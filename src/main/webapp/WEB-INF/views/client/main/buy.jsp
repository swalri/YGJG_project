<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="javax.servlet.http.HttpSession" %> --%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<link rel="icon" type="image/svg+xml" href="/vite.svg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>결제위젯 샘플</title>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<script>
    
        var roomname = '<%=(String) session.getAttribute("roomname")%>';
       var price = <%=session.getAttribute("pay")%>;
    
    document.addEventListener('DOMContentLoaded', function() {
      const paymentWidget = PaymentWidget(
        "test_ck_ODnyRpQWGrN4qq0PEN73Kwv1M9EN",
        // 비회원 customerKey
        PaymentWidget.ANONYMOUS
      );

      /**
       * 결제창을 렌더링합니다.
       * @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods%EC%84%A0%ED%83%9D%EC%9E%90-%EA%B2%B0%EC%A0%9C-%EA%B8%88%EC%95%A1
       */
      paymentWidget.renderPaymentMethods("#payment-method", { value: price });

      const paymentRequestButton = document.getElementById(
        "payment-request-button"
      );
      paymentRequestButton.addEventListener("click", () => {
        /** 결제 요청
         * @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment%EA%B2%B0%EC%A0%9C-%EC%A0%95%EB%B3%B4
         */
        paymentWidget.requestPayment({
          orderId: generateRandomString(),
          orderName: roomname,
          successUrl: window.location.origin + "/success",
          failUrl: window.location.origin + "/fail",
        });
      });

      function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
      }
    });
    </script>
</head>

<body>
	<div id="payment-method"></div>
	<button id="payment-request-button">결제하기</button>


</body>
</html>