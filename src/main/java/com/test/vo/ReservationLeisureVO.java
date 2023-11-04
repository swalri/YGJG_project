package com.test.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationLeisureVO {// 예약 테이블
	private Long record_id;// 예약 아이디
	private String ordername;// 회원 아이디
	private String method;// 결제방식
	private int totalamount;// 결제금액
	private Timestamp payment_date;// 결제일
	private String leisure_id;// 레저 아이디
	private int people_num;// 티켓 수

}
