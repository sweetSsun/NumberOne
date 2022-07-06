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
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/resell.css" type="text/css">


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
						<div class="item-basis_4" id="zzimBtn">찜</div>
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


<!-- 판매자의 다른품목 리스트  -->
				<div class="container-footer container-flex_1 container-card_w100 wrap-vertical">
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

<!-- 스크롤확인용 추가  -->

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

<script type="text/javascript">
var zzim = '${zzimCheck}';
if(zzim == null){
	zzimBtn.classList.add("");
}
else{
	zzimBtn.classList.remove("");
}

var zzimBtn = document.getElementById("zzimBtn");
var zzim_class = document.getElementsByClassName("zzim_class");
var zzim_num = '';
   
	


zzimBtn.onclick = function(zzubcode,zzmid){
	
	zzim_class.length == 0 ? zzim_num = 0 : zzim_num = 1;
			
	
	$.ajax({
		type : "get",
		url : "zzimClick_ajax",
		data : {"zzubcode" : zzubcode , "zzmid" : zzmid, "zzim_num" : zzim_num},
		success : function(result){
			console.log(result);
			if(result.length == null){
				zzimBtn.classList.add("");
			}
			else{
				zzimBtn.classList.remove("");
			}
		}
		
		
	})
	
}






</script>





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
