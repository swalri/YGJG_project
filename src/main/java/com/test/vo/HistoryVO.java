package com.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HistoryVO {// 회원 내역 vo
	private String mem_id;// 회원아이디
	private String mem_history;// 회원이 사용한 쿠폰 or 예약 내역정보
}
