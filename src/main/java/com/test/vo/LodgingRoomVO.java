package com.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LodgingRoomVO {	//숙소 방 테이블
	private String lodging_id;	//숙소 아이디
	private String room_id;		//방 아이디
	private String room_name;	//방 이름
	private String room_img;	//방 이미지
	private String room_detail;	//방 내용
	private int room_count;			//방 인원
	private int room_day_price;		//숙박 가격
	private int room_time_price;		//대실 가격
}
