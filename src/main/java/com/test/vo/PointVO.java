package com.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PointVO {// 회원 포인트 vo
	private String mem_id;// 회원아이디
	private String mem_point;// 회원이 가지고 있는 point
}
