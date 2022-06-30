<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래 상세페이지</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style type="text/css">
div {
	border: 1px solid black;
}

.container {
	width: 90%;
	max-width: 1240px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: auto;
	grid-gap: 20px;
}

.container-card_goods {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: space-evenly;
}

.container-card_w100 {
	width: 100%;
}

.container-card_goods_2 {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-evenly;
}

.container-card_goods-item {
	display: block;
	flex-basis: 20%;
}

.container-flex_1 {
	display: flex;
	flex-flow: row nowrap;
}

.container-flex_2 {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-evenly;
}

.container-flex_3 {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-evenly;
}

.item-basis_1 {
	flex-basis: 10%
}

.item-basis_2 {
	flex-basis: 60%
}

.item-basis_3 {
	flex-basis: 30%
}

.item-basis_4 {
	flex-basis: 15%
}

.item-basis_5 {
	flex-basis: 40%
}

.item-basis_6 {
	flex-basis: 25%
}

.img_size {
	max-width: 250px;
	max-height: 200px;
}

.font-s {
	font-size: 15px;
}

.font-m {
	font-size: 20px;
}

.font-l {
	font-size: 30px;
}

.text-right {
	text-align: right;
}

.text-bold {
	font-weight: bold;
}

.img-size {
	width: 640px;
	height: 480px;
}
.slider{
position: relative;
margin: 0 auto;
overflow: hidden;
}


.mySlides {display:none;}
.w3-left, .w3-right{
margin: 5px;
display: inline-block;
background-color: #262626;
border:2px solid #262626;
border-radius: 10%;
}

.w3-left, .w3-right:before{
content:'';
left: 10px;
bottom: 50%;
width: 100%;
height: 100%;
background-color: #fff;
transition: 0.5s;
}
.w3-left, .w3-right:hover:before{
top 0;
}




.w3-badge {height:13px;width:13px;padding:0;}
.position-left{
position: absolute;
left: 10px;
bottom: 50%;
width: 70px;
height: 70px;
}
.position-right{
position: absolute;
right: 10px;
bottom: 50%;
width: 70px;
height: 70px;

}
</style>



</head>


<body>
	<!-- TobBar -->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End of TobBar -->

	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp"%>

		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">중고거래 상세페이지</h1>


				<div class="container-header container-card_w100 slider">
				
<div class="w3-content w3-display-container">
  <img class="mySlides" src="${pageContext.request.contextPath }/resources/img/banner/slide-1.jpg" style="width:100%">
  <img class="mySlides" src="${pageContext.request.contextPath }/resources/img/banner/slide-2.jpg" style="width:100%">
  <img class="mySlides" src="${pageContext.request.contextPath }/resources/img/banner/slide-3.jpg" style="width:100%">
    <div class="w3-left position-left" onclick="plusDivs(-1)">&#10094;</div>
    <div class="w3-right position-right" onclick="plusDivs(1)">&#10095;</div>

</div>


				</div>



				<div class="container-body">
					<!-- 품목명  -->
					<div class="container-card_goods container-card_w100">

						<div class="container-card_goods_2">
							<div class="item-basis_1">
								<input type="checkbox">
							</div>
							<div class="item-basis_2">품목명</div>
							<div class="item-basis_3">가격</div>
						</div>

						<div class="container-card_goods_2">
							<div class="item-basis_1">
								<input type="checkbox">
							</div>
							<div class="item-basis_2">품목명</div>
							<div class="item-basis_3">가격</div>
						</div>
						<div class="container-card_goods_2">
							<div class="item-basis_1">
								<input type="checkbox">
							</div>
							<div class="item-basis_2">품목명</div>
							<div class="item-basis_3">가격</div>
						</div>

						<div class="container-card_goods_2">
							<div class="item-basis_1">
								<input type="checkbox">
							</div>
							<div class="item-basis_2">품목명</div>
							<div class="item-basis_3">가격</div>
						</div>
						<div class="container-card_goods_2">
							<div class="item-basis_1">
								<input type="checkbox">
							</div>
							<div class="item-basis_2">품목명</div>
							<div class="item-basis_3">가격</div>
						</div>

					</div>


					<div class="container-flex_2">

						<div class=item-basis_5>프로필</div>
						<div class=" item-basis_4">목록</div>
						<div class="item-basis_4">신고</div>
						<div class="item-basis_4">찜</div>
						<div class="item-basis_4">채팅</div>
						<!-- 작성자 -->
						<!-- 	<div class="card_in-icon">상태변경</div>
							<div class="card_in-icon">수정</div>
							<div class="card_in-icon">삭제</div> -->

					</div>

					<div class="container-flex_1">
						<textarea rows="2" cols="80" style="resize: none" readonly>상품상세설명</textarea>

					</div>

				</div>


				<div class="container-footer container-flex_1 container-card_w100">
					<div class="col_2-m container-card_goods item-basis_6">
						<div class="card_top">
							<a href="#"><img alt=""
								src="${pageContext.request.contextPath }/resources/img/logo.jpg"
								class="img_size"></a>
							<!--찜 기본  -->
							<i
								class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
							<!--찜하면 show  -->
							<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
						</div>
						<div class="card_body font-s text-right padding-right text-bold">제목</div>
						<div class="card_footer font-s text-right padding-right">가격</div>

					</div>
					<div class="col_2-m container-card_goods item-basis_6">
						<div class="card_top">
							<a href="#"><img alt=""
								src="${pageContext.request.contextPath }/resources/img/logo.jpg"
								class="img_size"></a>
							<!--찜 기본  -->
							<i
								class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
							<!--찜하면 show  -->
							<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
						</div>
						<div class="card_body font-s text-right padding-right text-bold">제목</div>
						<div class="card_footer font-s text-right padding-right">가격</div>

					</div>
					<div class="col_2-m container-card_goods item-basis_6">
						<div class="card_top">
							<a href="#"><img alt=""
								src="${pageContext.request.contextPath }/resources/img/logo.jpg"
								class="img_size"></a>
							<!--찜 기본  -->
							<i
								class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
							<!--찜하면 show  -->
							<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
						</div>
						<div class="card_body font-s text-right padding-right text-bold">제목</div>
						<div class="card_footer font-s text-right padding-right">가격</div>

					</div>
					<div class="col_2-m container-card_goods item-basis_6">
						<div class="card_top">
							<a href="#"><img alt=""
								src="${pageContext.request.contextPath }/resources/img/logo.jpg"
								class="img_size"></a>
							<!--찜 기본  -->
							<i
								class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
							<!--찜하면 show  -->
							<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
						</div>
						<div class="card_body font-s text-right padding-right text-bold">제목</div>
						<div class="card_footer font-s text-right padding-right">가격</div>

					</div>

				</div>




			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>
</html>
