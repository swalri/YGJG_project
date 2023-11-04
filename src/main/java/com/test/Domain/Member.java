package com.test.Domain;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Column;

@NoArgsConstructor(access=AccessLevel.PROTECTED)
@Getter
@Entity
@SequenceGenerator(name="MemBER_SEQ_GENERATOR",
sequenceName="Member_SEQ",
initialValue=5,allocationSize=100)
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,generator="MEMBER_SEQ_GENERATOR")
    private Long id;
    
    private String name; //이름
    private String username; //아이디
    private String password; //비밀번호
    private String email; //이메일
    private String phone; // 폰번호
    private String rdate; // 생일
    
    @Column(name = "role", nullable = false, columnDefinition = "VARCHAR2(20) DEFAULT 'MEMBER'")
    private String role; // 역할 (MEMBER or ADMIN)

    @Builder
    public Member(Long id, String name, String username, String password, String email, String phone, String rdate, String role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.rdate = rdate;
        this.role = role;
    }
}