package com.test.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponVO {// 쿠폰 테이블
	private String cp_id;// 쿠폰아이디
	private String cp_name;// 쿠폰 이름
	private String cp_detail;// 쿠폰 내용
	private String cp_price;// 쿠폰 가격

	@Nullable
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate cp_startdate;// 쿠폰 시작일

	@Nullable
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate cp_enddate;// 쿠폰 종료일

	private int cp_status;// 쿠폰 상태
}
