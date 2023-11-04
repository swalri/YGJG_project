package com.test.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.Domain.Member;
import com.test.Dto.MemberDto;
import com.test.Repository.MemberRepository;

@Service
public class MemberService implements UserDetailsService {
    private final MemberRepository memberRepository;
    
//    @PostConstruct
//    public void init() {
//        createAdminAccount();
//    }
//    
    @Autowired
    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @Transactional
    public Long signUp(MemberDto memberDto) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
        // password를 암호화 한 뒤 db에 저장
        return memberRepository.save(memberDto.toEntity()).getId();
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 로그인을 하기 위해 가입된 user정보를 조회하는 메서드
        Optional<Member> memberWrapper = memberRepository.findByusername(username);
        Member member = memberWrapper.orElseThrow(() -> new UsernameNotFoundException("User not found"));

        List<GrantedAuthority> authorities = new ArrayList<>();

        if ("ADMIN".equals(member.getRole())) {
            authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
        } else {
            authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
        }


      // 아이디, 비밀번호, 권한리스트를 매개변수로 User를 만들어 반환해준다.
      return new User(member.getUsername(), member.getPassword(), authorities);
   }

   public boolean authenticateUser(String username, String password) {
      Optional<Member> memberWrapper = memberRepository.findByusername(username);
      if (memberWrapper.isPresent()) {
         Member member = memberWrapper.get();
         BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

         if (passwordEncoder.matches(password, member.getPassword())) {
            return true; // 인증 성공
         }
      }

      return false; // 인증 실패
   }


   public void saveMember(MemberDto memberDto) {
      Member member = memberDto.toEntity();
      memberRepository.save(member);
   }

   public String getNameByUsername(String username) {
      Optional<Member> memberOptional = memberRepository.findByusername(username);

      if (memberOptional.isPresent()) {
         Member member = memberOptional.get();
         return member.getName();
      } else {
         return "Guest"; // 사용자가 존재하지 않을 경우 기본값 설정
      }
   }

   public Member getUser(String username) {
      Optional<Member> memberOptional = memberRepository.findByusername(username);

      if (memberOptional.isPresent()) {
         Member member = memberOptional.get();
         return member;
      } else {
         return null; // 사용자가 존재하지 않을 경우 기본값 설정
      }
   }

    // 새로운 메소드: 관리자 계정 생성
//  public void createAdminAccount() {
//      MemberDto memberDto = new MemberDto();
//      memberDto.setUsername("admin");
//      memberDto.setName("Admin Name");
//      memberDto.setEmail("admin@example.com");
//      memberDto.setPhone("1234567890");
//      memberDto.setRdate("2023-09-19");
//      memberDto.setRole("ADMIN");
//   
//      BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//      String encodedPassword = passwordEncoder.encode("123");
//      memberDto.setPassword(encodedPassword);
//      System.out.println(encodedPassword);
//      saveMember(memberDto);
//  }
}