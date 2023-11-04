package com.test.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter // setter()메서드 자동제공
@Getter // getter()메서드 자동제공
@ToString // toString() 메서드 자동제공
public class GongjiVO { /* 공지사항 테이터 저장빈 클래스, 되도록이면 테이블 컬럼명과 일치하는 변수명을 정의한다. */

	private int gongji_no;// 공지번호

	private String gongji_name;// 공지 작성자
	private String gongji_title;// 공지 제목
	private String gongji_cont; // 공지내용
	private int gongji_hit; // 조회수

	@Nullable
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate gongji_date;// 등록날짜

}
