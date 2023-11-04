<%@page import="com.test.vo.LeisureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.vo.LeisureVO" %>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제위젯 샘플</title>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  
   <% 
      // 세션에서 leivo 객체를 가져옵니다.
      LeisureVO leivo = (LeisureVO) session.getAttribute("leivo");
    %>
    
    <script>
      // JSP 변수를 JavaScript 변수로 변환
      <%-- var leisure_price = <%= leivo.getLeisure_price() %>; --%>
      var leisure_price = <%= session.getAttribute("totalPrice") %>;
      var leisure_name = "<%= leivo.getLeisure_name() %>"; // 세미콜론 누락 수정
      
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
        paymentWidget.renderPaymentMethods("#payment-method", { value: leisure_price });

        const paymentRequestButton = document.getElementById(
          "payment-request-button"
        );
        paymentRequestButton.addEventListener("click", () => {
          /** 결제 요청
           * @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment%EA%B2%B0%EC%A0%9C-%EC%A0%95%EB%B3%B4
           */
          paymentWidget.requestPayment({
            orderId: generateRandomString(),
            orderName: leisure_name,
            successUrl: window.location.origin + "/l_success",
            failUrl: window.location.origin + "/l_fail",
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