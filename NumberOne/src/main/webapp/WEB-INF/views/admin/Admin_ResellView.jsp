<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- CSS Style -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listCss.css" type="text/css">

<title>${ub_resellView.ubtitle }- 1인자:중고거래</title>

<style type="text/css">
section {
	max-width: 70%;
	margin: auto;
	margin-top: 0%;
}

textarea:focus {
	outline: none;
}

.row .col-1 {
	width: auto;
}

#inputReply {
	border: none;
	width: -webkit-fill-available;
	resize: none;
	height: 340px;
}

#inputComment {
	resize: none;
	height: auto;
	width: -webkit-fill-available;
	padding: 10px 0px;
	font-size: 20px;
}

.commentDate {
	color: gray;
	font-size: 17px;
}

.boardDate {
	color: gray;
	font-size: 17px;
	position: absolute;
    transform: translate(10%, 80%);
}

.bdhit {
	color: gray;
	font-size: 17px;
}

.boardCategory {
	color: #00a5ba;
	font-size: 20px;
}

.bdProfile {
	height: 40px;
	width: 40px;
	object-fit: cover;
	margin-bottom: 10px;
	background-color: white;
}

.bdProfile_Kakao {
	height: 40px;
	width: 40px;
	object-fit: cover;
}

.bdnickname {
	font-size: 20px;
}
.bdnickname:hover{
	color: #00bcd4;
}

.bdregion {
	font-weight: bold;
	color: #00bcd4;
	font-size: 20px;
}

.idDateHits {
	border-bottom: solid #E0E0E0 3px;
}

.boardTitle {
	font-size: 30px;
}

.boardContents {
	border-bottom: solid #E0E0E0 3px;
	font-size: 21px;
}

.commentCount {
	border-bottom: solid #E0E0E0 3px;
	font-size: 20px;
}

.inputRpcontents {
	font-size: 20px;
}

.outerCmtBox {
	background-color: #F6F6F6;
	display: table;
	vertical-align: middle;
}

.innerCmtBox {
	display: table-cell;
	margin: auto;
}

.replyButton {
	background-color: #F4F4F4;
	float: right;
}

.rpnickname {
	font-size: 20px;
}

.rpProfile {
	height: 50px;
	width: 50px;
	object-fit: cover;
}

.rpProfile_None {
	height: 50px;
	width: 50px;
	object-fit: cover;
}

.icon {
	border: solid gray 2px;
	border-radius: 5px;
	padding: 2px;
	color: gray;
}

.icon:hover {
	cursor: pointer;
}

#inputSearchText {
	font-size: 18px;
}

.img-container {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	border: solid #E0E0E0 2px;
	margin-top: 2%;
	width: 200px;
	height: 200px;
}

#upload_Img {
	width: 200px;
	height: 200px;
	object-fit: cover;
}

#inputModifyRpBox {
	border: solid #E0E0E0 2px;
	border-radius: 5px;
}

/* 중고거래 */
.Resell_Wrapper {
	width: 450px;
	height: 450px;
	text-align: center;
	left: 50%;
	top: 50%;
}

.Resell_contents {
	top: 50px;
}

.Resell_img_container {
	text-align: center;
	overflow: hidden;
	width: 600px;
	height: 400px;
	position: relative;
	/* 이미지 슬라이더 */
	overflow: hidden;
	
}	

.Resell_img {
	position: relative;
	width: 500px;
	height: 400px;
	display: none;
	object-fit: cover;
	border: solid 2px #00bcd4;
}

.active {
	display: block;
}

.square {
	width: 160px;
	height: 160px;
	text-align: center;
	line-height: 160px;
	background-color: #00bcd4;
	color: white;
	font-weight: bold;
	border-radius: 8px;
	font-size: 25px;
}

.goods_info {
	/* 	background-color:#eaf8ff;
	border-radius: 8px; */
	
}

.seller_and_buttons {
	border: solid #D2D2D2 2px;
	border-radius: 5px;
	height: 50px;
	background-color: #eaf8ff;
	line-height: 50px;
	text-align: center;
}

.selectCheckBox {
	height: 23px;
	width: 23px;
	vertical-align: sub;
}

.goods_name {
	font-size: 20px;
	left: 5px;
}

/* 글목록 버튼 */
#backList {
	width: 60px;
	height: 30px;
	margin-bottom: 13px;
}

.line-through {
	text-decoration: line-through;
	font-size: 20px;
}
</style>
</head>
<body>
	    <!-- TopBar -->
       	<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
        <!-- End of TopBar -->

	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Admin.jsp"%>

		<section>
			<!-- 본문 -->
			<div class="container" style="margin-top: 10px">
				<!-- 페이지 제목 -->
				<div class="checkout__form">중고거래</div>
					<c:choose>
						<c:when test="${ub_resellView.ubsellbuy == 'B' }">사구</c:when>
						<c:otherwise>팔구</c:otherwise>
					</c:choose>
						
				
				<form action="insertResellChat">
					<div class="row">
						<div class="col">
							<c:choose>
								<c:when test="${ub_resellView.ubsellbuy == 'B' }">
									<a href="">
										<span class="fw-bold boardCategory"> | 사구 </span>
									</a>
								</c:when>

								<c:otherwise>
									<a href="">
										<span class="fw-bold boardCategory"> | 팔구 </span>
									</a>
								</c:otherwise>
							</c:choose>
							<span
								class="fw-bold"
								style="color: gray; font-size: 20px"
							>/</span>
							<c:choose>
								<c:when test="${ub_resellView.ubrgcode == 'ALL' }">
									<a href="#">
										<span class="bdregion">전국</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'SEL' }">
									<a href="#">
										<span class="bdregion">서울</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'ICN' }">
									<a href="#">
										<span class="bdregion">인천</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'GGD' }">
									<a href="#">
										<span class="bdregion">경기</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'GSD' }">
									<a href="#">
										<span class="bdregion">경상</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'JLD' }">
									<a href="#">
										<span class="bdregion">전라</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'CCD' }">
									<a href="#">
										<span class="bdregion">충청</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'GWD' }">
									<a href="#">
										<span class="bdregion">강원</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'JJD' }">
									<a href="#">
										<span class="bdregion">제주</span>
									</a>
								</c:when>

							</c:choose>

							<a href="#">
								<span class="bdregion">(지역코드 확인)_${ub_resellView.ubrgcode }</span>
							</a>
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col-9">
							<span class="fw-bold boardTitle" id="soldCheckMsg"></span>
							<span class="fw-bold boardTitle">${ub_resellView.ubtitle }</span> 
						</div>
						<div class="col-3">
							<span class="boardDate">${ub_resellView.ubdate }</span>
						</div>
					</div>

					<!-- 중고거래 사진  -->
					<div class="row" style="margin-top: 40px; height: 430px;">
						<!-- 상품 사진 -->
						<div class="col-7">

							<!-- 중고거래 상품 사진 : 이미지 슬라이드 (캐러셀) -->
<%-- 							<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
								<div class="carousel-indicators">
									<button type="button" class="active"
										data-bs-target="#carouselExampleDark" data-bs-slide-to="0" aria-current="true" aria-label="Slide 1"></button>
									<c:forEach items="${ub_resellView.ubdetailimg_list}" begin="1" varStatus="status">
										<button type="button"
											data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.count }" aria-label="Slide 2"></button>
									</c:forEach>
								</div>
								
								<div class="carousel-inner">
									<!-- 1번 사진 -->
									<div class="carousel-item active">
										<img style="object-fit: cover;" class="active Resell_img d-block w-100"
											src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}">
									</div>

									<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
										<div class="carousel-item">
											<img style="object-fit: cover;" class="Resell_img d-block w-100"
												src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}">
										</div>
									</c:forEach>
								</div>
								
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
									<span class="carousel-control-prev-icon"
										aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div> --%>
							
							
							<!-- 다크 캐러셀 -->
							<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <c:forEach items="${ub_resellView.ubdetailimg_list}" begin="1" varStatus="status">
							     	<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.count }" aria-label="Slide 2"></button>
							    </c:forEach>
							  </div>
							  
							  <div id="blur_img">
							  
								  <div class="carousel-inner">
								    <!-- 1번사진 -->
								    <div class="carousel-item active subpic" data-bs-interval="10000">
									      <c:choose>
										      <c:when test="${ub_resellView.ubmainimg!= null}">
										      	<img style="object-fit: contain;" class="active Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}">
										      </c:when>
										      <c:otherwise>
										      	<img style="object-fit: contain;" class="active Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/logo_gray.png">
										      </c:otherwise>
									      </c:choose>
								    	<span class="imgState"></span>
								    </div>
								    
								    <c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
									    <div class="carousel-item subpic" data-bs-interval="2000">
										    <c:choose>
											    <c:when test="${ubdetailimg_list != null}">
											      <img style="object-fit: contain;" class="Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}">
											    </c:when>
											    <c:otherwise>
											     <img style="object-fit: contain;" class="Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/logo_gray.png">
											    </c:otherwise>
										    </c:choose>  
										    <span class="imgState"></span>
									    </div>
								    </c:forEach>
								  </div>
							  
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
							  
								</div>
							</div>
							
						</div>

						<!-- 거래자 정보  / 본문-->
						<div class="col-5">
							<div class="row">
								<div class="col seller_and_buttons">
									<!-- 프로필 -->
									<c:choose>
										<c:when test="${ub_resellView.ubprofile != null && ub_resellView.ubmstate == 1 }">
											<img class="img-profile rounded-circle bdProfile"
												src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/${ub_resellView.ubprofile }">
										</c:when>

										<c:when test="${ub_resellView.ubprofile != null && ub_resellView.ubmstate == 9 }">
											<!-- 카카오 회원 -->
											<img class="img-profile rounded-circle bdProfile_Kakao" src="${ub_resellView.ubprofile }">
										</c:when>

										<c:otherwise>
											<img class="img-profile rounded-circle bdProfile" 
												src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png">
										</c:otherwise>
									</c:choose>
									
									<!-- 닉네임 -->
									<a id="memberInfo" style="cursor: pointer"
										onclick="writeMemberSellbuy('${ub_resellView.ubnickname}')">
										<span class="fw-bold bdnickname">${ub_resellView.ubnickname}</span>
									</a>
								</div>
							</div>
							
							<!-- 본문 글 내용-->
							<textarea style="margin-top: 10px; font-size: 18px;" id="inputReply" rows="15%" readonly>${ub_resellView.ubcontents}</textarea>
						</div>

					</div>
					
					<!-- 파라미터 값 -->
					<input type="hidden" name="cmfrmid" value="${sessionScope.loginId }">
					<input type="hidden" name="cmfrmnickname" value="${sessionScope.loginNickname }">
					<input type="hidden" name="cmtomnickname" value="${ub_resellView.ubnickname}">
					<input type="hidden" name="cmtomid" value="${ub_resellView.ubmid}">
					<input type="hidden" name="gdtitle" value="${ub_resellView.ubtitle }">


					<!-- 버튼 목록 -->
					<div
						class="row"
						style="border-bottom: solid 1px #E0E0E0;">
						<div class="col">
							<button id="backList" type="button"	class="fw-bold btn-numberone"
								onclick="location.href='admin_selectResellList${paging.makeQueryPage(paging.page)}'" >
								글목록
							</button>
						</div>
						<c:choose>
							<%-- 관리자일 때 --%>
							<c:when test="${sessionScope.loginId == 'admin' }">
								<div align="right" class="col">
									<input
										onclick="adminBoardStop('${ub_resellView.ubcode}')"
										type="button"
										style="left: 0;"
										class="btn btn-sm btn-secondary fw-bold"
										value="정지">
								</div>
							</c:when>
						</c:choose>
					</div>


					<!-- 품목정보 옆 정사각형 -->
					<div class="row" style="margin-top: 20px;">
						<div class="col-1">
							<div class="square">
								<c:choose>
									<c:when test="${ub_resellView.ubsellbuy == 'B' }">
										구매상품
									</c:when>
									<c:otherwise>
										거래상품
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						
						<!-- 품목 정보 -->
						<div class="col goods_info">
							<c:forEach items="${gd_resellView}" var="gdList">
								<div class="row goods_name_price">
									<div class="col-9">
										<input type="checkbox" class="selectCheckBox goods_name"
											onclick="clickBox(this, '${gdList.gdname }')"
											value="${gdList.gdname }">
										<span class="goods_name gd_nameList">${gdList.gdname }</span>
									</div>
									<div class="col-3">
										<span class="goods_name gd_priceList">${gdList.gdprice }</span>
									</div>
								</div>
								
								<input type="hidden" class="select_gdcode" value="${gdList.gdcode }">
								<input type="hidden" class="select_gdstate" value="${gdList.gdstate }">
							</c:forEach>
						</div>
						
					</div>
				</form>

				<hr>
				<div class="row mb-2" >
					<div class="col text-center">
						<c:choose>
							<c:when test="${ub_resellView.ubsellbuy == 'B' }">
								<span class="fw-bold boardCategory"> < 구매자의 다른 상품 > </span>
							</c:when>
							<c:otherwise>
								<span class="fw-bold boardCategory"> < 거래자의 다른 상품  > </span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- 거래자의 다른 품목 리스트 -->
				<div class="row" style="text-align:center;">
					<c:forEach items="${ memberSellList}" var="sellList">
						<div class="col-4">
							<a href="admin_selectResellView${paging.makeQueryPage(sellList.ubcode, paging.page)}&ubsellbuy=${sellList.ubsellbuy}">
								<img style="width: 270px; height: 200px; object-fit: cover; border-top-left-radius:10px; border-top-right-radius:10px;" class="another_goods" alt="" src="${pageContext.request.contextPath }/resources/img/resell/${sellList.ubmainimg }">
							</a>

							<div class="card_body text-left fw-bold">
								<a href="admin_selectResellView${paging.makeQueryPage(sellList.ubcode, paging.page)}&ubsellbuy=${sellList.ubsellbuy}"> ${sellList.ubtitle} </a>
							</div>
							<div class="card_footer  text-left" style="margin-bottom:30px;">
								${sellList.ubdate}
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


		</section>
	</main>



	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"
	></script>
</body>

<script type="text/javascript">
	
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}

	
</script>



<script type="text/javascript">
	const loginId = '${sessionScope.loginId}'; //로그인된 아이디
	const ubcode = '${ub_resellView.ubcode}'; //현재 글번호
	const ubsellbuy = '${ub_resellView.ubsellbuy}'; //사구, 팔구  분류
	const ubstate = '${ub_resellView.ubstate}'; // 글 상태 값 
	const selectCheckBox = document.querySelectorAll(".selectCheckBox"); // 상품 상태 checkbox (복수 , c:forEach태그안에 있음) 
	const select_gdcode = document.querySelectorAll(".select_gdcode"); //상품코드	(복수 , c:forEach태그안에 있음) 
	const select_gdstate = document.querySelectorAll(".select_gdstate");//상품상태 (복수 , c:forEach태그안에 있음) 
	const gd_nameList = document.querySelectorAll(".gd_nameList"); //상품명 (복수 , c:forEach태그안에 있음)
	const gd_priceList = document.querySelectorAll(".gd_priceList"); //상품가격 (복수 , c:forEach태그안에 있음))
	const soldCheckMsg = document.getElementById("soldCheckMsg");
</script>



<!-- 페이지 로드 스크립트 -->
<script type="text/javascript">
	window.onload = function(){
		console.log('페이지로드')
		addPriceComma();		// 페이지 로드 시 가격에 콤마 표시
		ubstateCheckFunction();	// 페이지 로드 시 글의 거래 상태 확인
		soldCheck();			// 페이지 로드 시 거래완료된 글 확인
	}
	
	function addPriceComma(){
		/* 상품가격 콤마 추가 */
		for (let i = 0; i < gd_priceList.length; i++) {
			var gd_price = gd_priceList[i].innerText;
			//console.log(gd_price.toLocaleString('ko-KR'));
			var gd_price_comma = Number(gd_price).toLocaleString('ko-KR');
			gd_priceList[i].innerText = " ₩ " + gd_price_comma;
		}
	}
	
	function soldCheck() {
		/* 거래완료글 체크표시  */
    	if (ubstate === '9') {
        	console.log("거래완료글확인")
        	soldCheckMsg.textContent = "(거래완료) "
      	}
	}

	/* 페이지로드시 글의 거래상태체크 */
	function ubstateCheckFunction(){
		console.log('ubstateCheckFunction 호출');
		console.log('글의 현재 상태값 : ', ubstate);
		
		if (ubstate === '9') { // 글의 상태값이 9(거래완료)이면 실행.
			console.log('글의 상태: 거래완료 확인');
			for (let j = 0; j < select_gdstate.length; j++) {
				gd_nameList[j].classList.add('line-through');
				gd_priceList[j].classList.add('line-through');
				selectCheckBox[j].setAttribute('disabled','disabled');
			}
		} else { //글의 상태값이 1(거래중)이면 실행
			console.log('글의 상태: 거래중 확인');

			for (let j = 0; j < select_gdstate.length; j++) {
				if (select_gdstate[j].value === '0') {
					console.log("상태값이 0인 : " + select_gdstate[j].value);
					//css속성 주기
					selectCheckBox[j].setAttribute('disabled','disabled');
					gd_nameList[j].classList.add('line-through');
					gd_priceList[j].classList.add('line-through');

				} else {
					console.log("상태값 1인 : " + select_gdstate[j].value);
					selectCheckBox[j].removeAttribute('disabled');
					gd_nameList[j].classList.remove('line-through');
					gd_priceList[j].classList.remove('line-through');
				}
			}
		}
	}
</script>



<!-- 글목록으로 돌아가기 -->
<!-- <script type="text/javascript">
let storage = window.localStorage;

if(storage.getItem('searchType') !=null){
	var searchType_storage = storage.getItem('searchType');
	console.log('로컬스토리지 검색타입 : ', searchType_storage);}
if(storage.getItem('keyword') !=null){
	var keyword_storage = storage.getItem('keyword');
	console.log('로컬스토리지 검색어 : ', keyword_storage);
}
if(storage.getItem('selRegion') !=null ){
	var selRegion_storage = storage.getItem('selRegion');
	console.log('로컬스토리지 선택지역 : ', selRegion_storage);
}	
if(storage.getItem('page') !=null ){
	var page_storage = storage.getItem('page');	
	console.log('로컬스토리지 선택페이지 : ', page_storage);
}else{
	storage.setItem('page', '1');
	}	

	const backList = document.querySelector("#backList");
	
	backList.addEventListener("click", backListHandler);
	
	function backListHandler() {

		console.log("글목록버튼 클릭이벤트");
		
		location.href = 'selectResellPageList?sellBuy='+ubsellbuy+'&searchType='+searchType_storage+'&keyword='+keyword_storage+'&searchVal='+selRegion_storage+'&page='+page_storage;
	}

</script> -->


<!-- 체크박스 선택이벤트 스크립트  -->
<script type="text/javascript">
	/* 체크박스 클릭 이벤트 */
	let gd_names = [];
	const cmfrmid = loginId;
	const cmfrmnickname = document.getElementsByName("cmfrmnickname")[0].value;
	const cmtomnickname = document.getElementsByName("cmtomnickname")[0].value;
	const cmtomid = ubmid;
	const gdtitle = document.getElementsByName("gdtitle")[0].value;
	

	function clickBox(sel_boxTag, selOp) {
		if (sel_boxTag.checked == true) {
			// 클릭이벤트 발생 시 체크박스가 checked 된 경우에만 실행
			gd_names.push(selOp);	// checked 되었을 때 상품명을 gd_names 변수에 push 해서 담아준다.

			/* 데이터 확인 */
			console.log("선택된체크박스 : ", sel_boxTag);
			console.log("보내는아이디 : ", cmfrmid);
			console.log("보내는닉네임 : ", cmfrmnickname);
			console.log("받는닉네임 : ", cmtomnickname);
			console.log("받는아이디 : ", cmtomid);
			console.log("상품이름 : ", gd_names);
			console.log("글 제목 : ", gdtitle);			
	
	} else {
	        var ubIdx = gd_names.findIndex( (element) => element === selOp );
	        console.log(ubIdx);
	        gd_names.splice(ubIdx, 1);   // checked 해제 했을 때 상품명을 ub_names 변수에서 빼준다.
	        
	        /* 데이터 확인 */
	        console.log("<"+selOp+" 해제>");
	        console.log("상품이름 : ", gd_names);
		}
		
		//상품체크 시 해당 상품 줄에 배경색이 변하도록 설정 (Peace: 추가했어요!)
		for( var i=0; i < selectCheckBox.length; i++ ){
			if( selectCheckBox[i].checked == true ){
				$(".goods_name_price").eq(i).css("background-color", "#eaf8ff");
			}else{
				$(".goods_name_price").eq(i).css("background-color", "");
			}
		}	
		
	}
</script>

<!-- 관리자용 -->
<script type="text/javascript">
	function adminBoardStop(ubcode){
		/* 관리자 - 게시글 정지  */
		$.ajax({
	  		type : 'get',
	  		url : 'Admin_selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("관리자 로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					location.href = "loadToLogin";
	  				}
	  				return;
	  			}
	  			
				console.log(ubcode);
				var check = "adminPage"; // 관리자페이지에서 넘어왔음을 확인
				location.href="admin_updateResellStop${paging.makeQueryPage(paging.page)}&ubcode="+ubcode+"&ubsellbuy="+ubsellbuy+"&check="+check;
	  		}
		});
	}
</script>

</html>
