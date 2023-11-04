package com.test.vo;

import java.sql.Timestamp;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationLodgingVO {// 예약 테이블
	private Long record_id;// 예약 아이디
	private String ordername;// 회원 아이디
	private String method;// 결제방식
	private int totalamount;// 결제금액
	private Timestamp payment_date;// 결제일
	private String lodging_id;// 숙소 아이디
	private String room_id;// 방 아이디

	@Nullable
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate check_in;// 쿠폰 시작일

	@Nullable
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate check_out;// 쿠폰 종료일
	private int people_num;// 인원

}
