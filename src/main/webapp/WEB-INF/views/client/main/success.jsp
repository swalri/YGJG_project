<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.parser.ParseException"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.io.Reader"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>

<%
// 결제 승인 API 호출하기 

String orderId = request.getParameter("orderId");
String paymentKey = request.getParameter("paymentKey");
String amount = request.getParameter("amount");
String secretKey = "test_sk_7DLJOpm5QrlG66aM4eLVPNdxbWnY:";

Encoder encoder = Base64.getEncoder();
byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");

HttpURLConnection connection = (HttpURLConnection) url.openConnection();
connection.setRequestProperty("Authorization", authorizations);
connection.setRequestProperty("Content-Type", "application/json");
connection.setRequestMethod("POST");
connection.setDoOutput(true);
JSONObject obj = new JSONObject();
obj.put("paymentKey", paymentKey);
obj.put("orderId", orderId);
obj.put("amount", amount);

OutputStream outputStream = connection.getOutputStream();
outputStream.write(obj.toString().getBytes("UTF-8"));

int code = connection.getResponseCode();
boolean isSuccess = code == 200 ? true : false;

InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
JSONParser parser = new JSONParser();
JSONObject jsonObject = (JSONObject) parser.parse(reader);
responseStream.close();

Connection dbConnection = null;
PreparedStatement preparedStatement = null;

double points = 0;
if (isSuccess) {
	//String orderName = (String) jsonObject.get("orderName");
	String method = (String) jsonObject.get("method");
	Long totalAmount = (Long) jsonObject.get("totalAmount");
	String user_id = (String) session.getAttribute("username");
	String lod_id = (String) session.getAttribute("lodging_id");
	String room_id = (String) session.getAttribute("room_id");

	//Format dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String CHECK_IN = (String) session.getAttribute("CHECK_IN");
	String CHECK_OUT = (String) session.getAttribute("CHECK_OUT");
	/* String CHECK_IN = dateFormat.format((String) session.getAttribute("CHECK_IN"));
	String CHECK_OUT = dateFormat.format((String) session.getAttribute("CHECK_OUT"));
	java.sql.Date check_in_sql = java.sql.Date.valueOf(CHECK_IN);
	java.sql.Date check_out_sql = java.sql.Date.valueOf(CHECK_OUT); */
	int PEOPLE_NUM = Integer.parseInt((String) session.getAttribute("PEOPLE_NUM"));
	// Calculate 10% of the total amount as points
	points = totalAmount * 0.01;
	try {
		// 데이터베이스 연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		dbConnection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hotelproject", "1234");

		// SQL 쿼리 실행
		String sql = "INSERT INTO payment_records_lodging (RECORD_ID, ORDERNAME, METHOD, TOTALAMOUNT, lodging_id, room_id,people_num,check_in,check_out) VALUES (PAYMENT_RECORDS_SEQUENCE.NEXTVAL, ?, ?, ?, ?, ?,?,?,?)";
		preparedStatement = dbConnection.prepareStatement(sql);
		preparedStatement.setString(1, user_id);//회원아이디
		preparedStatement.setString(2, method);//결제방식
		preparedStatement.setLong(3, totalAmount);//결제금액
		preparedStatement.setString(4, lod_id);//숙소아이디
		preparedStatement.setString(5, room_id);//방아이디
		preparedStatement.setLong(6, PEOPLE_NUM);//인원수
		preparedStatement.setString(7, CHECK_IN);//체크인
		preparedStatement.setString(8, CHECK_OUT);//체크아웃

		preparedStatement.executeUpdate();

		// Insert points into the USER_POINTS table
		//sql = "INSERT INTO USER_POINTS (USER_ID, POINTS, CREATED_DATE) VALUES (?, ?, SYSDATE)";
		//preparedStatement = dbConnection.prepareStatement(sql);
		//preparedStatement.setString(1, orderId); // Assuming orderId is the userId, modify this if necessary
		//preparedStatement.setDouble(2, points);

		//preparedStatement.executeUpdate();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (preparedStatement != null) {
	try {
		preparedStatement.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		}
		if (dbConnection != null) {
	try {
		dbConnection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		}
	}
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>결제 성공</title>
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

section {
	max-width: 500px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	margin-bottom: 20px;
	color: #333;
}

p {
	margin-bottom: 10px;
	font-size: 14px;
	line-height: 1.6;
}

button {
	display: block;
	margin: 0 auto;
	padding: 10px 20px;
	background-color: #007BFF;
	border: none;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

.label {
	font-weight: bold;
}
</style>
</head>
<body>
	<section>
		<%
		if (isSuccess) {
		%>
		<h1>결제 성공</h1>
		<p>
			<span class="label">상품:</span>
			<%=jsonObject.get("orderName")%></p>
		<p>
			<span class="label">결제방식:</span>
			<%=jsonObject.get("method")%></p>
		<p>
			<span class="label">결제 완료 금액:</span>
			<%=jsonObject.get("totalAmount")%>원
		</p>
		<!-- 결제 일시가 API 응답에 포함되어 있다면 아래와 같이 표시할 수 있습니다. -->
		<!-- <p><span class="label">결제 일시:</span>jsonObject.get("paymentDate")e") %></p> -->
		<p>
			<%
			String additionalInfo = "";
			if (jsonObject.get("method").equals("카드")) {
				additionalInfo = "카드 번호: " + ((JSONObject) jsonObject.get("card")).get("number");
			} else if (jsonObject.get("method").equals("가상계좌")) {
				additionalInfo = "계좌 번호: " + ((JSONObject) jsonObject.get("virtualAccount")).get("accountNumber");
			} else if (jsonObject.get("method").equals("계좌이체")) {
				additionalInfo = "은행: " + ((JSONObject) jsonObject.get("transfer")).get("bank");
			} else if (jsonObject.get("method").equals("휴대폰")) {
				additionalInfo = "휴대폰 번호: " + ((JSONObject) jsonObject.get("mobilePhone")).get("customerMobilePhone");
			}
			%>
			<span class="label">추가 정보:</span>
			<%=additionalInfo%>
		</p>
		<%
		} else {
		%>
		<h1>결제 실패</h1>
		<p><%=jsonObject.get("message")%></p>
		<span>에러코드: <%=jsonObject.get("code")%></span>
		<%
		}
		%>
		<button type="button" onclick="redirectToNotice()">홈으로</button>

		<script>
        function redirectToNotice() {
            window.location.href = "http://localhost:8101/main";
        }
    </script>
	</section>

	<script>
    document.getElementById('points').textContent = '<%=points%>
		';
	</script>
</body>
</html>