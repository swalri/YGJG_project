<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 왼쪽메뉴바-->
<div class="menuColor" id="menu-bar-div">
	<!-- 메뉴페이지 -->
	<nav id="menu-bar">
		<ul>
			<li>
				<h2 style="text-align: center; font-size: 36px">
					<a href="main" class="menu-bar-mainlink"> MainBoard </a>
				</h2>
			</li>
			<li><hr></li>
			<li>
				<div class="menu-cont">
					<span class="icon-save-span"><i class="fa-solid fa-user"></i></span>
					<span> Member </span> <span class="icon-save-span icon-chevron"><i
						class="fa-solid fa-chevron-right"></i></span>
				</div>
				<div class="clear-both"></div>
				<div class="detail-menu ">
					<h6 class="collapse-header page-selector">member-information :
					</h6>
					<a href="member_list" class="detail-menu-choice page-selector">
						Member Info </a>
				</div>
			</li>
			<li>
				<div class="menu-cont">
					<span class="icon-save-span"><i class="fa-solid fa-hotel"></i></span>
					<span> Lodging </span> <span class="icon-save-span icon-chevron"><i
						class="fa-solid fa-chevron-right"></i></span>
				</div>
				<div class="clear-both"></div>
				<div class="detail-menu">
					<h6 class="collapse-header page-selector">lodging-information
						:</h6>
					<a href="lodging_list" class="detail-menu-choice page-selector">Lodging
						Info</a> <a href="leisure_list"
						class="detail-menu-choice page-selector">Leisure Info</a>
				</div>
			</li>
			<li>
				<div class="menu-cont">
					<span class="icon-save-span"><i class="fa-solid fa-tags"></i></span>
					<span> Coupon </span> <span class="icon-save-span icon-chevron"><i
						class="fa-solid fa-chevron-right"></i></span>
				</div>
				<div class="clear-both"></div>
				<div class="detail-menu">
					<h6 class="collapse-header page-selector">Coupon-information :
					</h6>
					<a href="coupon_list" class="detail-menu-choice page-selector">Coupon
						Info</a> <a href="coupon_write"
						class="detail-menu-choice page-selector">Coupon Write</a>
				</div>
			</li>
			<li>
				<div class="menu-cont">
					<span class="icon-save-span"><i class="fa-solid fa-bullhorn"></i></span>
					<span> Gongji </span> <span class="icon-save-span icon-chevron"><i
						class="fa-solid fa-chevron-right"></i></span>
				</div>
				<div class="clear-both"></div>
				<div class="detail-menu">
					<h6 class="collapse-header page-selector">Gongji-information :</h6>
					<a href="gongji_list" class="detail-menu-choice page-selector">Gongji
						Info</a> <a href="gongji_write"
						class="detail-menu-choice page-selector">Gongji Write</a>
				</div>
			</li>
			<li>
				<div class="menu-cont">
					<span class="icon-save-span"><i class="fa-solid fa-gear"></i></span>
					<span> Option </span> <span class="icon-save-span icon-chevron"><i
						class="fa-solid fa-chevron-right"></i></span>
				</div>
				<div class="clear-both"></div>
				<div class="detail-menu">
					<h6 class="collapse-header page-selector">Option :</h6>
					<a href="../main" class="detail-menu-choice page-selector">MainSite</a>
					<a href="../logout" class="detail-menu-choice page-selector">Logout</a>
				</div>
			</li>
		</ul>
	</nav>
</div>
