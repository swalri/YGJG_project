package com.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WishlistVO {// 회원 찜목록 vo
	private String mem_id;// 회원아이디
	private String wishlist_lodging_id;// 회원이 찜한 숙소 id
	private String wishlist_room_id;// 회원이 찜한 방 id
}
