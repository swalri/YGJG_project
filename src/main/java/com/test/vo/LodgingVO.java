package com.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LodgingVO {// 숙소 테이블
	private String lodging_id;// 숙소 아이디
	private String lodging_type;// 숙소 종류
	private String lodging_name;// 숙소 이름
	private String lodging_phone;// 숙소 전화번호
	private String lodging_email;// 숙소 이메일
	private String lodging_img;// 숙소 이미지
	private int lodging_description;// 숙소 평점
	private int min_day_price;		//숙박 가격
	private int min_time_price;		//대실 가격
}
