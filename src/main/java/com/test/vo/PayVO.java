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
public class PayVO { // 결제 테이블
	private String RESERVATION_ID; // 숙소 아이디

	@Nullable
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate CHECK_IN;

	@Nullable
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate CHECK_OUT;

	private int PEOPLE_NUM; // 인원수

}
