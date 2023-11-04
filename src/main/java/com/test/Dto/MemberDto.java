package com.test.Dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.test.Domain.Member;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class MemberDto {
    private Long id;
    
    private String role = "MEMBER";

    @NotEmpty(message = "이름을 입력하세요.")
    @Size(min = 2, max = 10, message = "이름은 2자 이상 10자 이하로 입력해주세요.")
    private String name;

    @NotEmpty(message = "아이디를 입력하세요.")
    private String username;

    @NotEmpty(message = "비밀번호를 입력하세요.")
    @Size(min = 8, message = "비밀번호는 8자 이상이어야 합니다.")
    private String password;
    
    private String confirmPassword; // 비밀번호 확인 추가

    @NotEmpty(message = "이메일을 입력하세요.")
    @Pattern(regexp = "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,4}\\b",
            message = "올바른 이메일 주소를 입력하세요.")
    private String email;

    @NotEmpty(message = "전화번호를 입력하세요.")
    @Pattern(regexp = "^[0-9]*$", message = "숫자만 입력 가능합니다.")
    private String phone;

    @NotEmpty(message = "생년월일을 입력하세요.")
    private String rdate;


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }
    
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public Member toEntity() {
        return Member.builder()
                .id(id)
                .name(name)
                .username(username)
                .password(password)
                .email(email)
                .phone(phone)
                .rdate(rdate)
                .role(role) // role 필드를 entity 생성 시에도 추가
                .build();
    }

    @Builder
    public MemberDto(Long id, String name, String username, String password, String email, String phone, String rdate, String role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.rdate = rdate;
        this.role = role; // role 필드를 builder 생성자에 추가
    }
} 