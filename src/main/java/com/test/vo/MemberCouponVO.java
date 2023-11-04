package com.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberCouponVO {// 회원 쿠폰 테이블
	private String mem_id;// 회원 아이디
	private String cp_id;// 쿠폰 아이디
	private int cp_use;// 쿠폰 사용

}
