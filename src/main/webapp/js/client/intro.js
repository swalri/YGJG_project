const contents = document.querySelectorAll('.content');
let sectionIndex = 0;
let isScrolling = false;

function showContent(index) {
  contents.forEach(content => content.classList.remove('active'));
  contents[index].classList.add('active');
  
  const imgBoxes = contents[index].querySelectorAll('.img-box');
  imgBoxes.forEach((img, i) => {
    setTimeout(() => {
      img.style.opacity = "1";
      img.style.transform = "translateY(0)";
    }, i * 200); // 시간 간격을 조정하실 수 있습니다.
  });
}

document.addEventListener('scroll', () => {
  if (isScrolling) return;
  isScrolling = true;

  setTimeout(() => {
    isScrolling = false;
  }, 100);

  const currentIndex = Math.round(window.scrollY / window.innerHeight);
  if (currentIndex !== sectionIndex) {
    sectionIndex = currentIndex;
    showContent(sectionIndex);
  }
});



// const contents = document.querySelectorAll('.content');
// let sectionIndex = 0;
// let isScrolling = false;

// function showContent(index) {
//     contents.forEach(content => content.classList.remove('active'));
//     contents[index].classList.add('active');

    // if (index === 1) {
    //     // 2번째 내용이 활성화될 때 글자 애니메이션 활성화
    //     document.querySelectorAll('#content2 p span').forEach((span, i) => {
    //         setTimeout(() => {
    //             span.style.opacity = "1";
    //             span.style.transform = "translateY(0)";
    //         }, i * 200);
    //     });
    // }

//     if (index === 4) {
//         // 5번째 내용이 활성화될 때 이미지 애니메이션 활성화
//         document.querySelectorAll('#content1 .delayed-image').forEach((img, i) => {
//             setTimeout(() => {
//                 img.style.opacity = "1";
//                 img.style.transform = "translateY(0)";
//             }, i * 1000);
//         });
//     }
// }

// function scrollToSection(index) {
//     if (isScrolling) return;

//     isScrolling = true;
//     showContent(index);

//     window.scrollTo({
//         top: contents[index].offsetTop,
//         behavior: 'smooth'
//     });

//     setTimeout(() => {
//         isScrolling = false;
//     }, 1000);
// }

// window.addEventListener('wheel', (e) => {
//     if (isScrolling) return;

//     if (e.deltaY > 0 && sectionIndex < contents.length - 1) {
//         sectionIndex++;
//     } else if (e.deltaY < 0 && sectionIndex > 0) {
//         sectionIndex--;
//     }

//     scrollToSection(sectionIndex);
// });