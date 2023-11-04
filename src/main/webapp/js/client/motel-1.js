function showRoomInfo(roomType) {
    const modal = document.getElementById("room-info-modal");
    const modalRoomName = document.getElementById("modal-room-name");
    const modalPrice = document.getElementById("modal-price");
    const modalAdditionalInfo = document.getElementById("modal-additional-info");
  
    if (roomType === "small") {
        modalRoomName.innerText = "작은 방";
        modalPrice.innerText = "가격: $100";
        modalAdditionalInfo.innerText = "추가 정보: ...";
    } else if (roomType === "large") {
        modalRoomName.innerText = "큰 방";
        modalPrice.innerText = "가격: $200";
        modalAdditionalInfo.innerText = "추가 정보: ...";
    } else {
        // 다른 방 종류에 대한 정보도 추가 가능
        modalRoomName.innerText = "알 수 없는 방";
        modalPrice.innerText = "가격: 정보 없음";
        modalAdditionalInfo.innerText = "추가 정보: 정보 없음";
    }
  
    modal.style.display = "block";
  }
  
  function hideRoomInfoModal() {
    const modal = document.getElementById("room-info-modal");
    modal.style.display = "none";
  }
  // 작은 방과 큰 방 이미지를 클릭했을 때 이벤트 처리
  const roomItems = document.querySelectorAll('.room-item a');
  roomItems.forEach((roomItem) => {
    roomItem.addEventListener('click', (event) => {
        event.preventDefault();
        // 클릭한 링크의 href 속성을 이용하여 해당 방 정보 페이지로 이동
        const roomInfoUrl = roomItem.getAttribute('href');
        window.location.href = roomInfoUrl;
    });
  });
  
  // 이용자 정보와 예약자 정보가 동일한지 체크하는 이벤트 처리
  const sameAsReserverCheckbox = document.getElementById('same-as-reserver');
  const reservationInfoInputs = document.querySelectorAll('.reservation-info input');
  const userInfoInputs = document.querySelectorAll('.reservation-info input:not(#same-as-reserver)');
  sameAsReserverCheckbox.addEventListener('change', () => {
    if (sameAsReserverCheckbox.checked) {
        userInfoInputs.forEach((input, index) => {
            input.value = reservationInfoInputs[index].value;
        });
    } else {
        userInfoInputs.forEach((input) => {
            input.value = '';
        });
    }
  });
  
  // 쿠폰 선택에 따른 결제 금액 계산 이벤트 처리
  const discountSelect = document.querySelector('.discount-info select');
  const paymentInfo = document.querySelector('.payment-info div');
  discountSelect.addEventListener('change', () => {
    const couponValue = parseFloat(discountSelect.value.split('%')[0]);
    const price = 200; // 선택한 방의 가격 (실제 데이터에 따라 변경)
    const discountedPrice = price - (price * couponValue / 100);
    paymentInfo.textContent = `결제 금액: $${discountedPrice}`;
  });
  