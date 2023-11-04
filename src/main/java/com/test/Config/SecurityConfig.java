package com.test.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.test.service.MemberService;
import com.test.service.Role;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig {

    @Autowired
    private MemberService memberService;
    

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    public void configure(WebSecurity web) throws Exception {
       // 인증을 무시하기 위한 설정, 정적 자원(예: css, JavaScript, 이미지, 라이브러리)에 대한 요청을 무시하도록 구성.
       // 정적 자원은 ant 패턴을 사용하여 지정됩니다.(예: "/css/**"는 "css" 디렉터리 아래의 모든 자원을 무시.
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**");
    }

    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable() // 공격 보호 기능을 비활성화 하는 설정
            .authorizeRequests() // 요청에 대한 권한 설정을 시작
                .antMatchers("/admin/**").hasRole("ADMIN")
//                .antMatchers("/lodging_list").hasRole("MEMBER")
                .antMatchers("/**").permitAll() // 모든 URL에 대한 접근을 허용. 즉, 인증없이 모든 사용자가 접근할 수 있다.
                .antMatchers("/main").authenticated() // "main" URL에 대한 접근은 인증된 사용자에게만 허용된다.
                .antMatchers("/admin/main").hasRole("ADMIN")
                .antMatchers("/login").permitAll()
                .anyRequest().authenticated() // 다른 모든 경로는 인증이 필요
                .and()
            .formLogin() // 로그인 페이지 및 관련 설정을 정의
                .loginPage("/login") // 커스텀 login 페이지를 사용
                .failureUrl("/login?error=true") 
                .successHandler(customAuthenticationSuccessHandler()) // 로그인 성공 핸들러 설정
                .usernameParameter("username") // 로그인 페이지에서 사용자 이름과 비밀번호를 입력받는 파라미터 이름을 설정.
                .passwordParameter("password")
                .loginProcessingUrl("/login") // 로그인 처리를 담당할 URL 지정
                .permitAll() // 로그인 페이지에 대한 접근을 모든 사용자에게 허용한다.
                .and()
            .logout() // 로그아웃 설정을 정의
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout")) // 로그아웃 요청을 처리하는 URL을 지정
                .logoutSuccessUrl("/main") // 로그아웃 성공 시 이동할 페이지 
                .invalidateHttpSession(true) // 세션 초기화 
                .and()
            .exceptionHandling() // 예외 처리에 관련된 설정을 추가 
               // 권한 없음 페이지 경로
               .accessDeniedPage("/login?message=로그인이 필요합니다.");
        return http.build();
    }

    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return (request, response, authentication) -> {
            // 로그인 성공 후 리다이렉트 URL 설정
            if (authentication.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals(Role.ADMIN.getValue()))) {
                response.sendRedirect("/admin/main");
            } else {
                response.sendRedirect("/main");
            }
        };
    }
}