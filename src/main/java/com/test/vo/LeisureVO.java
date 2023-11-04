package com.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LeisureVO {// 레저 테이블
	private String leisure_id;// 레저 아이디
	private String leisure_name;// 레저 이름
	private String leisure_price;// 레저 가격
	private String leisure_img;// 레저 이미지
	private int leisure_description;// 레저 평점
}
