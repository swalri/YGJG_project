<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="../css/client/main.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>

	<!-- 목표 -->
	<!-- 1. 데이터 받아오고 데이터베이스에서 값 출력 -->
	<!-- 2. 데이터 값 넘기기 -->
	<!-- 3. -->
	<jsp:include page="../header/header.jsp" />

	<div>
		<!-- 이미지 전환div -->
		<div class="container">
			<div class="banner">
				<div class="banner_img01"></div>

				<div id="hotelChoice" style="overflow-y: scroll">
					<div class="city-header">서울</div>
					<br>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option hotel" onclick="selectHotel('강남/역삼/삼성')">강남/역삼/삼성</div>
					<div class="hotel-option hotel" onclick="selectHotel('신사/청담/압구정')">신사/청담/압구정</div>
					<div class="hotel-option hotel" onclick="selectHotel('서초/교대/사당')">서초/교대/사당</div>
					<div class="hotel-option hotel" onclick="selectHotel('잠실/송파/강동')">잠실/송파/강동</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('을지로/명동/중구/동대문')">을지로/명동/중구/동대문</div>
					<div class="hotel-option hotel" onclick="selectHotel('서울역/이태원/용산')">서울역/이태원/용산</div>
					<div class="hotel-option hotel" onclick="selectHotel('종로/인사동')">종로/인사동</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('홍대/합정/마포/서대문')">홍대/합정/마포/서대문</div>
					<div class="hotel-option hotel" onclick="selectHotel('여의도')">여의도</div>
					<div class="hotel-option hotel" onclick="selectHotel('영등포역')">영등포역</div>
					<div class="hotel-option hotel" onclick="selectHotel('구로/신도림/금천')">구로/신도림/금천</div>
					<div class="hotel-option hotel" onclick="selectHotel('김포공항/염창/강서')">김포공항/염창/강서</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('건대입구/성수/왕십리')">건대입구/성수/왕십리</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('성북/강북/노원/도봉')">성북/강북/노원/도봉</div>

					<div class="hotel-option motel"
						onclick="selectHotel('강남/역삼/삼성/논현')">강남/역삼/삼성/논현</div>
					<div class="hotel-option motel" onclick="selectHotel('서초/신사/방배')">서초/신사/방배</div>
					<div class="hotel-option motel"
						onclick="selectHotel('잠실/신천(잠실새내)')">잠실/신천(잠실새내)</div>
					<div class="hotel-option motel" onclick="selectHotel('영등포/여의도')">영등포/여의도</div>
					<div class="hotel-option motel"
						onclick="selectHotel('신림/서울대/사당/동작')">신림/서울대/사당/동작</div>
					<div class="hotel-option motel" onclick="selectHotel('천호/길동/둔촌')">천호/길동/둔촌</div>
					<div class="hotel-option motel"
						onclick="selectHotel('화곡/까치산/양천/목동')">화곡/까치산/양천/목동</div>
					<div class="hotel-option motel"
						onclick="selectHotel('구로/금천/오류/신도림')">구로/금천/오류/신도림</div>
					<div class="hotel-option motel" onclick="selectHotel('신촌/홍대/합정')">신촌/홍대/합정</div>
					<div class="hotel-option motel" onclick="selectHotel('연신내/불광/응암')">연신내/불광/응암</div>
					<div class="hotel-option motel"
						onclick="selectHotel('종로/대학로/동묘앞역')">종로/대학로/동묘앞역</div>
					<div class="hotel-option motel" onclick="selectHotel('성신여대/성북/월곡')">성신여대/성북/월곡</div>
					<div class="hotel-option motel"
						onclick="selectHotel('이태원/용산/서울역/명동/회현')">이태원/용산/서울역/명동/회현</div>
					<div class="hotel-option motel"
						onclick="selectHotel('동대문/을지로/충무로/신당/약수')">동대문/을지로/충무로/신당/약수</div>
					<div class="hotel-option motel"
						onclick="selectHotel('회기/고려대/청량리/신설동')">회기/고려대/청량리/신설동</div>
					<div class="hotel-option motel" onclick="selectHotel('장안동/답십리')">장안동/답십리</div>
					<div class="hotel-option motel" onclick="selectHotel('건대/군자/구의')">건대/군자/구의</div>
					<div class="hotel-option motel" onclick="selectHotel('왕십리/성수/금호')">왕십리/성수/금호</div>
					<div class="hotel-option motel" onclick="selectHotel('수유/미아')">수유/미아</div>
					<div class="hotel-option motel" onclick="selectHotel('상봉/중랑/면목')">상봉/중랑/면목</div>
					<div class="hotel-option motel"
						onclick="selectHotel('태릉/노원/도봉/창동')">태릉/노원/도봉/창동</div>

					<br> <br>

					<div class="city-header">부산</div>
					<br>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option hotel" onclick="selectHotel('해운대/마린시티')">해운대/마린시티</div>
					<div class="hotel-option hotel" onclick="selectHotel('벡스코/센텀시티')">벡스코/센텀시티</div>
					<div class="hotel-option hotel" onclick="selectHotel('송정/기장/정관')">송정/기장/정관</div>
					<div class="hotel-option hotel" onclick="selectHotel('광안리/경성대')">광안리/경성대</div>
					<div class="hotel-option hotel" onclick="selectHotel('부산역')">부산역</div>
					<div class="hotel-option hotel" onclick="selectHotel('자갈치/남포동/영도')">자갈치/남포동/영도</div>
					<div class="hotel-option hotel" onclick="selectHotel('송도/다대포')">송도/다대포</div>
					<div class="hotel-option hotel" onclick="selectHotel('서면/연산/범일')">서면/연산/범일</div>
					<div class="hotel-option hotel" onclick="selectHotel('동래/온천/금정구')">동래/온천/금정구</div>
					<div class="hotel-option hotel" onclick="selectHotel('사상/강서/김해공항')">사상/강서/김해공항</div>

					<div class="hotel-option motel"
						onclick="selectHotel('해운대/센텀시티/재송')">해운대/센텀시티/재송</div>
					<div class="hotel-option motel"
						onclick="selectHotel('송정/기장/정관/오시리아 관광단지')">송정/기장/정관/오시리아
						관광단지</div>
					<div class="hotel-option motel" onclick="selectHotel('광안리/수영')">광안리/수영</div>
					<div class="hotel-option motel"
						onclick="selectHotel('경성대/대연/용호동/문현')">경성대/대연/용호동/문현</div>
					<div class="hotel-option motel"
						onclick="selectHotel('서면/양정/초읍/부산시민공원')">서면/양정/초읍/부산시민공원</div>
					<div class="hotel-option motel"
						onclick="selectHotel('남포동/중앙동/태종대/송도/영도')">남포동/중앙동/태종대/송도/영도</div>
					<div class="hotel-option motel"
						onclick="selectHotel('부산역/범일동/부산진역')">부산역/범일동/부산진역</div>
					<div class="hotel-option motel" onclick="selectHotel('연상/토곡')">연상/토곡</div>
					<div class="hotel-option motel"
						onclick="selectHotel('동래/사직/미남/온천장/부산대/구서/서동')">동래/사직/미남/온천장/부산대/구서/서동</div>
					<div class="hotel-option motel"
						onclick="selectHotel('사상(경전철)/엄궁/학장')">사상(경전철)/엄궁/학장</div>
					<div class="hotel-option motel"
						onclick="selectHotel('덕천/화명/만덕/구포(구포역/KTX역)')">덕천/화명/만덕/구포(구포역/KTX역)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('하단/명지/김해공항/다대포/강서/신호/괴정/지사')">하단/명지/김해공항/다대포/강서/신호/괴정/지사</div>

					<br> <br>
					<div class="city-header">제주</div>
					<br>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option hotel" onclick="selectHotel('제주시/제주국제공항')">제주시/제주국제공항</div>
					<div class="hotel-option hotel" onclick="selectHotel('서귀포시/모슬포')">서귀포시/모슬포</div>
					<div class="hotel-option hotel" onclick="selectHotel('애월/한림/협재')">애월/한림/협재</div>
					<div class="hotel-option hotel" onclick="selectHotel('중문')">중문</div>
					<div class="hotel-option hotel" onclick="selectHotel('표선/성산')">표선/성산</div>
					<div class="hotel-option hotel" onclick="selectHotel('함덕/김녕/세화')">함덕/김녕/세화</div>

					<div class="hotel-option motel"
						onclick="selectHotel('제주공항 서부(용담,도두,연동,노형동)')">제주공항
						서부(용담,도두,연동,노형동)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('제주공항 동부(제주시청,탑동,건입동)')">제주공항
						동부(제주시청,탑동,건입동)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('서귀포시/중문/모슬포')">서귀포시/중문/모슬포</div>
					<div class="hotel-option motel"
						onclick="selectHotel('이호테우/하귀/애월/한립/협재')">이호테우/하귀/애월/한립/협재</div>
					<div class="hotel-option motel" onclick="selectHotel('함덕/김녕/세화')">함덕/김녕/세화</div>
					<div class="hotel-option motel" onclick="selectHotel('남원/표선/성산')">남원/표선/성산</div>

					<br> <br>
					<div class="city-header">경기</div>
					<br>
					<div class="hotel-option hotel" onclick="selectHotel('가평/청평/양평')">가평/청평/양평</div>
					<div class="hotel-option hotel" onclick="selectHotel('수원/화성')">수원/화성</div>
					<div class="hotel-option hotel" onclick="selectHotel('고양/파주/김포')">고양/파주/김포</div>
					<div class="hotel-option hotel" onclick="selectHotel('의정부/포천/동두천')">의정부/포천/동두천</div>
					<div class="hotel-option hotel" onclick="selectHotel('용인/동탄')">용인/동탄</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('남양주/구리/성남/분당')">남양주/구리/성남/분당</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('이천/광주/여주/하남')">이천/광주/여주/하남</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('부천/광명/시흥/안산')">부천/광명/시흥/안산</div>
					<div class="hotel-option hotel" onclick="selectHotel('안양/의왕/군포')">안양/의왕/군포</div>

					<div class="hotel-option motel"
						onclick="selectHotel('수원 인계동/나혜석거리')">수원 인계동/나혜석거리</div>
					<div class="hotel-option motel"
						onclick="selectHotel('수원역/구운/행궁/장안구')">수원역/구운/행궁/장안구</div>
					<div class="hotel-option motel"
						onclick="selectHotel('수원시청/권선/영통/세류')">수원시청/권선/영통/세류</div>
					<div class="hotel-option motel"
						onclick="selectHotel('안양/평촌/인덕원/과천')">안양/평촌/인덕원/과천</div>
					<div class="hotel-option motel" onclick="selectHotel('성남/분당/위례')">성남/분당/위례</div>
					<div class="hotel-option motel" onclick="selectHotel('용인')">용인</div>
					<div class="hotel-option motel"
						onclick="selectHotel('동탄/화성/오산/병점')">동탄/화성/오산/병점</div>
					<div class="hotel-option motel"
						onclick="selectHotel('하남/광주/여주/이천')">하남/광주/여주/이천</div>
					<div class="hotel-option motel" onclick="selectHotel('안산 중앙역')">안산
						중앙역</div>
					<div class="hotel-option motel"
						onclick="selectHotel('안산 고잔/상록수/선부동/월피동')">안산 고잔/상록수/선부동/월피동</div>
					<div class="hotel-option motel"
						onclick="selectHotel('군포/의왕/금정/산본')">군포/의왕/금정/산본</div>
					<div class="hotel-option motel"
						onclick="selectHotel('시흥(월곶/정왕/오이도/거북섬)')">시흥(월곶/정왕/오이도/거북섬)</div>
					<div class="hotel-option motel" onclick="selectHotel('광명')">광명</div>
					<div class="hotel-option motel" onclick="selectHotel('평택/송탄/안성')">평택/송탄/안성</div>
					<div class="hotel-option motel" onclick="selectHotel('부천')">부천</div>
					<div class="hotel-option motel" onclick="selectHotel('일산/고양')">일산/고양</div>
					<div class="hotel-option motel" onclick="selectHotel('파주')">파주</div>
					<div class="hotel-option motel" onclick="selectHotel('김포')">김포</div>
					<div class="hotel-option motel" onclick="selectHotel('의정부')">의정부</div>
					<div class="hotel-option motel" onclick="selectHotel('구리')">구리</div>
					<div class="hotel-option motel"
						onclick="selectHotel('남양주(다산/별내/와부/호평)')">남양주(다산/별내/와부/호평)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('남양주(오남/조안/화도/진접)')">남양주(오남/조안/화도/진접)</div>
					<div class="hotel-option motel" onclick="selectHotel('포천')">포천</div>
					<div class="hotel-option motel" onclick="selectHotel('양주/동두천/연천')">양주/동두천/연천</div>
					<div class="hotel-option motel" onclick="selectHotel('양평')">양평</div>
					<div class="hotel-option motel" onclick="selectHotel('가평/청평')">가평/청평</div>
					<div class="hotel-option motel" onclick="selectHotel('제부도/대부도')">제부도/대부도</div>

					<div class="hotel-option pension" onclick="selectHotel('남양주')">남양주</div>
					<div class="hotel-option pension" onclick="selectHotel('포천')">포천</div>
					<div class="hotel-option pension" onclick="selectHotel('양평/용문')">양평/용문</div>
					<div class="hotel-option pension" onclick="selectHotel('파주/양주/연천')">파주/양주/연천</div>
					<div class="hotel-option pension"
						onclick="selectHotel('용인/여주/화성(제부도)/이천')">용인/여주/화성(제부도)/이천</div>

					<br> <br>
					<div class="city-header">인천</div>
					<br>
					<div class="hotel-option hotel" onclick="selectHotel('송도/소래포구')">송도/소래포구</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('인천국제공항/강화/을왕리')">인천국제공항/강화/을왕리</div>
					<div class="hotel-option hotel" onclick="selectHotel('영종도/월미도')">영종도/월미도</div>
					<div class="hotel-option hotel" onclick="selectHotel('주안/간석/인천시청')">주안/간석/인천시청</div>
					<div class="hotel-option hotel" onclick="selectHotel('청라/계양/부평')">청라/계양/부평</div>

					<div class="hotel-option motel" onclick="selectHotel('부평')">부평</div>
					<div class="hotel-option motel" onclick="selectHotel('구월')">구월</div>
					<div class="hotel-option motel"
						onclick="selectHotel('서구(석남/서구청/검단)')">서구(석남/서구청/검단)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('계양(작전/경인교대)')">계양(작전/경인교대)</div>
					<div class="hotel-option motel" onclick="selectHotel('주안')">주안</div>
					<div class="hotel-option motel" onclick="selectHotel('송도/연수')">송도/연수</div>
					<div class="hotel-option motel"
						onclick="selectHotel('인천공항/을왕리/영종도')">인천공항/을왕리/영종도</div>
					<div class="hotel-option motel"
						onclick="selectHotel('중구(월미도/신포/동인천/연안부두)')">중구(월미도/신포/동인천/연안부두)</div>
					<div class="hotel-option motel" onclick="selectHotel('강화/옹진')">강화/옹진</div>
					<div class="hotel-option motel" onclick="selectHotel('동암/간석')">동암/간석</div>
					<div class="hotel-option motel"
						onclick="selectHotel('남동구(소래포구/호구포)')">남동구(소래포구/호구포)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('용현/숭의/도화/동구')">용현/숭의/도화/동구</div>

					<div class="hotel-option pension" onclick="selectHotel('강화도/석모도')">강화도/석모도</div>
					<div class="hotel-option pension"
						onclick="selectHotel('대부도/영흥도/선재도')">대부도/영흥도/선재도</div>
					<div class="hotel-option pension"
						onclick="selectHotel('을왕리/영종도/그외 섬')">을왕리/영종도/그외 섬</div>

					<br> <br>
					<div class="city-header">강원</div>
					<br>
					<div class="hotel-option hotel" onclick="selectHotel('속초/양양/고성')">속초/양양/고성</div>
					<div class="hotel-option hotel" onclick="selectHotel('춘천/인제/철원')">춘천/인제/철원</div>
					<div class="hotel-option hotel" onclick="selectHotel('강릉')">강릉</div>
					<div class="hotel-option hotel" onclick="selectHotel('평창/정선/영월')">평창/정선/영월</div>
					<div class="hotel-option hotel" onclick="selectHotel('동해/삼척/태백')">동해/삼척/태백</div>
					<div class="hotel-option hotel" onclick="selectHotel('홍천/횡성/원주')">홍천/횡성/원주</div>

					<div class="hotel-option motel" onclick="selectHotel('춘천/강촌')">춘천/강촌</div>
					<div class="hotel-option motel" onclick="selectHotel('원주')">원주</div>
					<div class="hotel-option motel"
						onclick="selectHotel('경포대/사천/주문진/정동진')">경포대/사천/주문진/정동진</div>
					<div class="hotel-option motel" onclick="selectHotel('강릉역/교동/옥계')">강릉역/교동/옥계</div>
					<div class="hotel-option motel" onclick="selectHotel('영월/정선')">영월/정선</div>
					<div class="hotel-option motel" onclick="selectHotel('속초/고성')">속초/고성</div>
					<div class="hotel-option motel"
						onclick="selectHotel('양양(서피비치/낙산)')">양양(서피비치/낙산)</div>
					<div class="hotel-option motel" onclick="selectHotel('동해/삼척/태백')">동해/삼척/태백</div>
					<div class="hotel-option motel" onclick="selectHotel('평창')">평창</div>
					<div class="hotel-option motel" onclick="selectHotel('홍천/횡성')">홍천/횡성</div>
					<div class="hotel-option motel"
						onclick="selectHotel('화천/철원/인제/양구')">화천/철원/인제/양구</div>

					<div class="hotel-option pension"
						onclick="selectHotel('강릉(경포대/안목해변)')">강릉(경포대/안목해변)</div>
					<div class="hotel-option pension"
						onclick="selectHotel('강릉(사천/정동진/주문진)')">강릉(사천/정동진/주문진)</div>
					<div class="hotel-option pension" onclick="selectHotel('속초/고성')">속초/고성</div>
					<div class="hotel-option pension" onclick="selectHotel('양양')">양양</div>
					<div class="hotel-option pension" onclick="selectHotel('동해/삼척')">동해/삼척</div>
					<div class="hotel-option pension" onclick="selectHotel('춘천/강촌')">춘천/강촌</div>
					<div class="hotel-option pension" onclick="selectHotel('홍천')">홍천</div>
					<div class="hotel-option pension" onclick="selectHotel('평창')">평창</div>
					<div class="hotel-option pension" onclick="selectHotel('횡성/영월/정선')">횡성/영월/정선</div>
					<div class="hotel-option pension" onclick="selectHotel('철원/인제/화천')">철원/인제/화천</div>

					<br> <br>
					<div class="city-header">경상</div>
					<br>
					<div class="hotel-option motel" onclick="">모텔없음</div>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('대구/구미/안동/문경')">대구/구미/안동/문경</div>
					<div class="hotel-option hotel" onclick="selectHotel('경주')">경주</div>
					<div class="hotel-option hotel" onclick="selectHotel('울산/양산')">울산/양산</div>
					<div class="hotel-option hotel" onclick="selectHotel('거제/통영')">거제/통영</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('포항/영덕/울진/청송')">포항/영덕/울진/청송</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('창원/마산/진해/김해/부곡')">창원/마산/진해/김해/부곡</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('남해/사천/하동/진주')">남해/사천/하동/진주</div>
					<br> <br>
					<div class="city-header">전라</div>
					<br>
					<div class="hotel-option motel" onclick="">모텔없음</div>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option hotel" onclick="selectHotel('전주/완주')">전주/완주</div>
					<div class="hotel-option hotel" onclick="selectHotel('광주/나주/함평')">광주/나주/함평</div>
					<div class="hotel-option hotel" onclick="selectHotel('여수')">여수</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('순천/광양/담양/보성/화순')">순천/광양/담양/보성/화순</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('남원/부안/정읍/고창/무주/구례')">남원/부안/정읍/고창/무주/구례</div>
					<div class="hotel-option hotel" onclick="selectHotel('군산/익산')">군산/익산</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('목포/신안/영광/진도/고흥/영암/완도/강진')">목포/신안/영광/진도/고흥/영암/완도/강진</div>
					<br> <br>
					<div class="city-header">충청</div>
					<br>
					<div class="hotel-option motel" onclick="">모텔없음</div>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option hotel" onclick="selectHotel('대전/세종')">대전/세종</div>
					<div class="hotel-option hotel" onclick="selectHotel('천안/아산/도고')">천안/아산/도고</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('안면도/태안/서산/덕산')">안면도/태안/서산/덕산</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('보령/대천/부여/공주/금산')">보령/대천/부여/공주/금산</div>
					<div class="hotel-option hotel" onclick="selectHotel('청주/음성/진천')">청주/음성/진천</div>
					<div class="hotel-option hotel"
						onclick="selectHotel('충주/제천/단양/괴산/증평')">충주/제천/단양/괴산/증평</div>
					<br> <br>
					<div class="city-header">대전</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option motel" onclick="selectHotel('유성구')">유성구</div>
					<div class="hotel-option motel"
						onclick="selectHotel('동구(용전/복합터미널)')">동구(용전/복합터미널)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('서구(둔산/용문/월평)')">서구(둔산/용문/월평)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('대덕구(중리/신탄진)')">대덕구(중리/신탄진)</div>
					<br> <br>
					<div class="city-header">충남/세종</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option motel" onclick="selectHotel('천안 서북구')">천안
						서북구</div>
					<div class="hotel-option motel" onclick="selectHotel('천안 동남구')">천안
						동남구</div>
					<div class="hotel-option motel" onclick="selectHotel('아산')">아산</div>
					<div class="hotel-option motel" onclick="selectHotel('공주/동학사/세종')">공주/동학사/세종</div>
					<div class="hotel-option motel"
						onclick="selectHotel('계룡/금산/논산/청양')">계룡/금산/논산/청양</div>
					<div class="hotel-option motel" onclick="selectHotel('예산/홍성')">예산/홍성</div>
					<div class="hotel-option motel" onclick="selectHotel('태안/안면도/서산')">태안/안면도/서산</div>
					<div class="hotel-option motel" onclick="selectHotel('당진')">당진</div>
					<div class="hotel-option motel" onclick="selectHotel('보령/대천해수욕장')">보령/대천해수욕장</div>
					<div class="hotel-option motel" onclick="selectHotel('서천/부여')">서천/부여</div>

					<div class="hotel-option pension"
						onclick="selectHotel('태안(만리포/청포대)')">태안(만리포/청포대)</div>
					<div class="hotel-option pension"
						onclick="selectHotel('태안(안면도/꽃지)')">태안(안면도/꽃지)</div>
					<div class="hotel-option pension" onclick="selectHotel('보령(대천)')">보령(대천)</div>
					<div class="hotel-option pension"
						onclick="selectHotel('당진/서천/서산/예산')">당진/서천/서산/예산</div>
					<div class="hotel-option pension"
						onclick="selectHotel('부여/논산/공주/아산/금산')">부여/논산/공주/아산/금산</div>

					<br> <br>
					<div class="city-header">울산</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option motel"
						onclick="selectHotel('남구/중구(삼산/성남/무거/신정)')">남구/중구(삼산/성남/무거/신정)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('동구/북구/울주군(일산/진장/진하/kTX역/영남알프스)')">동구/북구/울주군(일산/진장/진하/kTX역/영남알프스)</div>
					<br> <br>
					<div class="city-header">경남</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option motel"
						onclick="selectHotel('창원 상남동/용호동/중앙동/창원시청')">창원
						상남동/용호동/중앙동/창원시청</div>
					<div class="hotel-option motel"
						onclick="selectHotel('창원 명서동/봉곡동/팔용동/북면온천/창원종합버스터미널')">창원
						명서동/봉곡동/팔용동/북면온천/창원종합버스터미널</div>
					<div class="hotel-option motel" onclick="selectHotel('마산')">마산</div>
					<div class="hotel-option motel" onclick="selectHotel('진해')">진해</div>
					<div class="hotel-option motel" onclick="selectHotel('김해/장유')">김해/장유</div>
					<div class="hotel-option motel" onclick="selectHotel('양산/밀양')">양산/밀양</div>
					<div class="hotel-option motel" onclick="selectHotel('진주')">진주</div>
					<div class="hotel-option motel" onclick="selectHotel('거제/통영/고성')">거제/통영/고성</div>
					<div class="hotel-option motel" onclick="selectHotel('사천/남해')">사천/남해</div>
					<div class="hotel-option motel" onclick="selectHotel('하동/산천/함양')">하동/산천/함양</div>
					<div class="hotel-option motel"
						onclick="selectHotel('거창/함안/창녕/합천/의령')">거창/함안/창녕/합천/의령</div>

					<div class="hotel-option pension"
						onclick="selectHotel('거제도 남부(바람의 언덕/해금갈)')">거제도 남부(바람의
						언덕/해금갈)</div>
					<div class="hotel-option pension"
						onclick="selectHotel('거제도 북부(매미성/가조도)')">거제도 북부(매미성/가조도)</div>
					<div class="hotel-option pension" onclick="selectHotel('남해')">남해</div>
					<div class="hotel-option pension" onclick="selectHotel('통영')">통영</div>
					<div class="hotel-option pension"
						onclick="selectHotel('사천/산천/하동/합천/거창')">사천/산천/하동/합천/거창</div>
					<div class="hotel-option pension"
						onclick="selectHotel('밀양/양산/김해/창원')">밀양/양산/김해/창원</div>

					<br> <br>
					<div class="city-header">대구</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option motel"
						onclick="selectHotel('동성로/서문시장/대구역/경북대/엑스코')">동성로/서문시장/대구역/경북대/엑스코</div>
					<div class="hotel-option motel"
						onclick="selectHotel('동대구역/신천동/수성못/범어/라이온즈파크/알파시티/시지')">동대구역/신천동/수성못/범어/라이온즈파크/알파시티/시지</div>
					<div class="hotel-option motel"
						onclick="selectHotel('대구공항/혁신도시/등촌유원지/팔공산/이시아폴리스/군위')">대구공항/혁신도시/등촌유원지/팔공산/이시아폴리스/군위</div>
					<div class="hotel-option motel"
						onclick="selectHotel('서대구역/북부정류장/평리/비산/칠곡지구/동천동/금호지구')">서대구역/북부정류장/평리/비산/칠곡지구/동천동/금호지구</div>
					<div class="hotel-option motel"
						onclick="selectHotel('두류/이월드/본리동/죽전동/서부정류장/앞산공원/안지랑/대명동/봉덕동')">두류/이월드/본리동/죽전동/서부정류장/앞산공원/안지랑/대명동/봉덕동</div>
					<div class="hotel-option motel"
						onclick="selectHotel('성서/계명대/상인동/대곡/현풍/테크노폴리스/가창/달성군')">성서/계명대/상인동/대곡/현풍/테크노폴리스/가창/달성군</div>
					<br> <br>
					<div class="city-header">경북</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option motel"
						onclick="selectHotel('포항/남구(시청/시외버스터미널/구룡포/쌍사/문덕/오천)')">포항/남구(시청/시외버스터미널/구룡포/쌍사/문덕/오천)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('포항/북구(영일대/죽도시장/여객터미널/송도)')">포항/북구(영일대/죽도시장/여객터미널/송도)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('경주(보문단지/황리단길/불국사/양남/감포/안강)')">경주(보문단지/황리단길/불국사/양남/감포/안강)</div>
					<div class="hotel-option motel" onclick="selectHotel('구미')">구미</div>
					<div class="hotel-option motel"
						onclick="selectHotel('경산(영남대/대구대/갓바위/하양/진량/자인)')">경산(영남대/대구대/갓바위/하양/진량/자인)</div>
					<div class="hotel-option motel"
						onclick="selectHotel('안동(경북도청/하회마을)')">안동(경북도청/하회마을)</div>
					<div class="hotel-option motel" onclick="selectHotel('영천/청도')">영천/청도</div>
					<div class="hotel-option motel" onclick="selectHotel('김천/칠곡/성주')">김천/칠곡/성주</div>
					<div class="hotel-option motel"
						onclick="selectHotel('문경/상주/영주/예천/의성/봉화')">문경/상주/영주/예천/의성/봉화</div>
					<div class="hotel-option motel" onclick="selectHotel('울진/영덕/청송')">울진/영덕/청송</div>
					<div class="hotel-option motel" onclick="selectHotel('울릉도')">울릉도</div>

					<div class="hotel-option pension"
						onclick="selectHotel('경주(황리단길/보문)')">경주(황리단길/보문)</div>
					<div class="hotel-option pension"
						onclick="selectHotel('경주(감포/불국사)')">경주(감포/불국사)</div>
					<div class="hotel-option pension" onclick="selectHotel('포항')">포항</div>
					<div class="hotel-option pension" onclick="selectHotel('영덕/울진')">영덕/울진</div>
					<div class="hotel-option pension"
						onclick="selectHotel('문경/안동/상주/영주/울릉')">문경/안동/상주/영주/울릉</div>
					<div class="hotel-option pension"
						onclick="selectHotel('청도/성주/영천/경산')">청도/성주/영천/경산</div>

					<br> <br>
					<div class="city-header">광주</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option pension" onclick="">숙소없음</div>
					<div class="hotel-option motel"
						onclick="selectHotel('상무지구/금호지구/유스퀘어/서구')">상무지구/금호지구/유스퀘어/서구</div>
					<div class="hotel-option motel"
						onclick="selectHotel('충장로/대인시장/국립아시아문화전당/동구/남구')">충장로/대인시장/국립아시아문화전당/동구/남구</div>
					<div class="hotel-option motel" onclick="selectHotel('첨단지구/양산동')">첨단지구/양산동</div>
					<div class="hotel-option motel"
						onclick="selectHotel('하남/광주여대/송정역/광산구')">하남/광주여대/송정역/광산구</div>
					<div class="hotel-option motel"
						onclick="selectHotel('광주역/기아챔피언스필드/전대사거리/북구')">광주역/기아챔피언스필드/전대사거리/북구</div>
					<br> <br>
					<div class="city-header">전남</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option motel" onclick="selectHotel('여수')">여수</div>
					<div class="hotel-option motel" onclick="selectHotel('순천')">순천</div>
					<div class="hotel-option motel" onclick="selectHotel('광양')">광양</div>
					<div class="hotel-option motel" onclick="selectHotel('목포')">목포</div>
					<div class="hotel-option motel" onclick="selectHotel('무안/영암/신안')">무안/영암/신안</div>
					<div class="hotel-option motel"
						onclick="selectHotel('나주/함평/영광/장성')">나주/함평/영광/장성</div>
					<div class="hotel-option motel"
						onclick="selectHotel('담양/곡성/화순/구례')">담양/곡성/화순/구례</div>
					<div class="hotel-option motel"
						onclick="selectHotel('해남/완도/진도/강진/장흥/보성/고흥')">해남/완도/진도/강진/장흥/보성/고흥</div>

					<div class="hotel-option pension" onclick="selectHotel('여수')">여수</div>
					<div class="hotel-option pension" onclick="selectHotel('순천/구례')">순천/구례</div>
					<div class="hotel-option pension" onclick="selectHotel('무안/해남/완도')">무안/해남/완도</div>
					<div class="hotel-option pension" onclick="selectHotel('담양/곡성/장성')">담양/곡성/장성</div>

					<br> <br>
					<div class="city-header">전주/전북</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option motel" onclick="selectHotel('전주 덕진구')">전주
						덕진구</div>
					<div class="hotel-option motel" onclick="selectHotel('전주 완산구/완주')">전주
						완산구/완주</div>
					<div class="hotel-option motel" onclick="selectHotel('군산')">군산</div>
					<div class="hotel-option motel" onclick="selectHotel('익산')">익산</div>
					<div class="hotel-option motel"
						onclick="selectHotel('남원/임실/순창/무주/진안/장수')">남원/임실/순창/무주/진안/장수</div>
					<div class="hotel-option motel"
						onclick="selectHotel('정읍/부안/김제/고창')">정읍/부안/김제/고창</div>

					<div class="hotel-option pension" onclick="selectHotel('부안(변산반도)')">부안(변산반도)</div>
					<div class="hotel-option pension" onclick="selectHotel('무주')">무주</div>
					<div class="hotel-option pension" onclick="selectHotel('전주')">전주</div>
					<div class="hotel-option pension" onclick="selectHotel('고창/남원/완주')">고창/남원/완주</div>

					<br> <br>
					<div class="city-header">가평</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option motel" onclick="">모텔없음</div>
					<div class="hotel-option pension" onclick="selectHotel('남이섬/가평읍')">남이섬/가평읍</div>
					<div class="hotel-option pension" onclick="selectHotel('자라섬/북면')">자라섬/북면</div>
					<div class="hotel-option pension"
						onclick="selectHotel('아침고요수목원/상면')">아침고요수목원/상면</div>
					<div class="hotel-option pension"
						onclick="selectHotel('청평/설악/쁘띠프랑스')">청평/설악/쁘띠프랑스</div>
					<br> <br>
					<div class="city-header">충북</div>
					<br>
					<div class="hotel-option hotel" onclick="">호텔없음</div>
					<div class="hotel-option motel" onclick="">모텔없음</div>
					<div class="hotel-option pension" onclick="selectHotel('단양')">단양</div>
					<div class="hotel-option pension" onclick="selectHotel('제천/충주')">제천/충주</div>
					<div class="hotel-option pension" onclick="selectHotel('괴산/보은/청주')">괴산/보은/청주</div>
				</div>


			</div>
		</div>
		<!-- 예약div -->
		<div>
			<div class="select-container">
				<select id="typeSelector" name="selectedType"
					onchange="filterByType(this.value)">
					<option value="" selected disabled>타입 선택</option>
					<option value="motel">모텔</option>
					<option value="hotel">호텔</option>
					<option value="pension">팬션/풀빌라</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="selectBox" onclick="toggleHotelChoices()">지역 선택</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				체크인&nbsp;:&nbsp; <input type="date" name="CHECK_IN" id="CHECK_IN"
					min="<%=java.time.LocalDate.now()%>"
					value="<%=java.time.LocalDate.now()%>"
					style="width: 150px; padding: 5px 5px; border-radius: 9px; border: 3px solid #c7c5c5;" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 체크아웃&nbsp;:&nbsp; <input
					type="date" name="CHECK_OUT" id="CHECK_OUT"
					min="<%=java.time.LocalDate.now()%>"
					style="width: 150px; padding: 5px 5px; border-radius: 9px; border: 3px solid #c7c5c5;" />


				<select name="member" id="men">
					<option value="인원 선택" ${setPayList.PEOPLE_NUM}>인원 선택</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<!-- 2개 지움 -->
				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="cho"
					id="searchButton" type="button" onclick="searchLodgingList() "
					value="검색">
			</div>
		</div>
	</div>

	<!-- <script>
		document.addEventListener("DOMContentLoaded", function() {
			const checkInInput = document.getElementById("CHECK_IN");
			const checkOutInput = document.getElementById("CHECK_OUT");

			checkInInput.addEventListener("change", function() {
				const checkInDate = new Date(checkInInput.value);
				const minCheckOutDate = new Date(checkInDate);
				minCheckOutDate.setDate(minCheckOutDate.getDate() + 1); // 체크인 날짜 다음날로 설정

				checkOutInput.min = minCheckOutDate.toISOString().slice(0, 10);
			});
		});
	</script> -->

	<script src="../js/client/main.js"></script>
	<script type="text/javascript">
		// 시작일(input 태그)과 종료일(input 태그) 요소를 가져옵니다.
		var startDateInput = document.getElementById('CHECK_IN');
		var endDateInput = document.getElementById('CHECK_OUT');

		startDateInput.addEventListener('input', function() {
			// 사용자가 날짜를 클리어한 경우
			if (startDateInput.value === '') {
				// 오늘 날짜를 가져오기
				var today = new Date();
				// 날짜를 "yyyy-mm-dd" 형식으로 변환
				var formattedDate = today.toISOString().substring(0, 10);
				// input 요소에 오늘 날짜 설정
				startDateInput.value = formattedDate;
			}
		});

		// 시작일의 변경을 감지하고 종료일의 최소값을 설정합니다.
		startDateInput.addEventListener('change', function() {
			// 시작일의 값을 가져옵니다.
			var startDate = new Date(startDateInput.value);
			// 종료일의 최소값을 시작일로 설정합니다.
			endDateInput.min = startDateInput.value;
			// 종료일의 값을 가져옵니다.
			var endDate = new Date(endDateInput.value);
			// 종료일이 시작일보다 작으면 종료일을 시작일로 설정합니다.
			if (endDate < startDate) {
				endDateInput.value = startDateInput.value;
			}
		});

		//목표 초기화시 최소값을 오늘날짜로 초기화
	</script>

	<script type="text/javascript">
		function searchLodgingList() {
			var selectedType = document.getElementById("typeSelector").value;
			var CHECK_IN = document.getElementById("CHECK_IN").value;
			var CHECK_OUT = document.getElementById("CHECK_OUT").value;
			var men = document.getElementById("men").value;

			var a = new Date(CHECK_IN);
			var b = new Date(CHECK_OUT);
			var diff = ((a.getTime() - b.getTime()) / (1000 * 60 * 60 * 24))
					* -1;

			if (selectedType === "") {
				alert("숙소 타입을 설정해 주세요");
			} else if (CHECK_IN === "") {
				alert("체크인 날짜를 설정해 주세요");
			} else if (CHECK_OUT === "") {
				alert("체크아웃 날짜를 설정해 주세요");
			} else if (men === "인원 선택") {
				alert("인원수를 설정해 주세요");
			} else {
				location.href = "lodging_list?type=" + selectedType
						+ "&CHECK_IN=" + CHECK_IN + "&CHECK_OUT=" + CHECK_OUT
						+ "&men=" + men + "&diff=" + diff;
			}
		}
	</script>
	<script type="text/javascript">
		function filterByType(type) {
			var options = document.getElementById("men").options;
			if (type === "motel") {
				for (var i = 3; i < options.length; i++) {
					options[i].style.display = "none";
				}
			} else {
				for (var i = 3; i < options.length; i++) {
					options[i].style.display = "";
				}
			}
		}
	</script>
	<jsp:include page="../footer/footer.jsp" />