<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ub_resellView.ubtitle }-1인자:중고거래 상세 페이지</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- CSS Style -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
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

.bdnickname:hover {
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

.zzimChatBtn:hover {
	cursor: pointer;
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
#sellList_title:hover{
	color:#00bcd4;
}

/* div .blur_bg {
width:100%;
background-size:cover;
/* opacity : 0.8; /* 여기 적힌 수치만큼 블러효과가 커집니다. 
} */
.subpic{
	position: relative;
}

.imText{
position: absolute;
top:0;
left:0;
color: white;
font-size: 60px;
width:100%;
font-weight: bold;
  background-color: rgb(107 101 101 / 55%); color: rgb(255 255 255 / 43%); 
        padding-top:155px;  text-align: center;
            height: 100%;
}
</style>
</head>
<body>
	<!-- TopBar -->
	<c:choose>
		<c:when test="${sessionScope.loginId != 'admin'}">
			<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/includes/TopBar_Admin.jsp"%>
		</c:otherwise>
	</c:choose>
	<!-- End of TopBar -->

	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Resell.jsp"%>

		<section>
			<!-- 본문 -->
			<div class="container">
				<h2 class="text-center">중고거래 상세페이지 : Resell_View</h2>
				<form action="insertResellChat">
					<div class="row">
						<div class="col">
							<c:choose>
								<c:when test="${ub_resellView.ubsellbuy == 'B' }">
									<a href=""> <span class="fw-bold boardCategory"> | 사구 </span>
									</a>
								</c:when>

								<c:otherwise>
									<a href=""> <span class="fw-bold boardCategory"> | 팔구 </span>
									</a>
								</c:otherwise>
							</c:choose>
							<span class="fw-bold" style="color: gray; font-size: 20px">/</span>
							<c:choose>
								<c:when test="${ub_resellView.ubrgcode == 'ALL' }">
									<a href="#"> <span class="bdregion">전국</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'SEL' }">
									<a href="#"> <span class="bdregion">서울</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'ICN' }">
									<a href="#"> <span class="bdregion">인천</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'GGD' }">
									<a href="#"> <span class="bdregion">경기</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'GSD' }">
									<a href="#"> <span class="bdregion">경상</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'JLD' }">
									<a href="#"> <span class="bdregion">전라</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'CCD' }">
									<a href="#"> <span class="bdregion">충청</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'GWD' }">
									<a href="#"> <span class="bdregion">강원</span>
									</a>
								</c:when>
								<c:when test="${ub_resellView.ubrgcode == 'JJD' }">
									<a href="#"> <span class="bdregion">제주</span>
									</a>
								</c:when>

							</c:choose>

							<a href="#"> <span class="bdregion">(지역코드 확인)_${ub_resellView.ubrgcode }</span>
							</a>
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col">
							<span class="fw-bold boardTitle" id="soldCheckMsg"></span> <span class="fw-bold boardTitle">${ub_resellView.ubtitle }</span> <span style="float: right;" class="boardDate">${ub_resellView.ubdate }</span>
						</div>
					</div>

					<!-- 중고거래 사진  -->
					<div class="row" style="margin-top: 40px; height: 430px;">
						<!-- 상품 사진 -->
						<div class="col-7">
							<!-- 중고거래 상품 사진 : 이미지 슬라이드 (캐러셀) -->
<%-- 							<div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
								<div class="carousel-indicators">
									<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
									<c:forEach items="${ub_resellView.ubdetailimg_list}" begin="1" varStatus="status">
										<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${status.count }" aria-label="Slide 2"></button>
									</c:forEach>
								</div>
								<div class="carousel-inner">
									<!-- 1번 사진 -->
									<div class="carousel-item active">
										<img style="object-fit: contain;" class="active Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}">
									</div>

									<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
										<div class="carousel-item">
											<img style="object-fit: contain;" class="Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}">
										</div>
									</c:forEach>

								</div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
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
							      <img style="object-fit: contain;" class="active Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}">
							    <span class="imgState"></span>
							    </div>
							    
							    <c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
							    <div class="carousel-item subpic" data-bs-interval="2000">
							      <img style="object-fit: contain;" class="Resell_img d-block w-100" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}">
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
											<img class="img-profile rounded-circle bdProfile" src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/${ub_resellView.ubprofile }">
										</c:when>

										<c:when test="${ub_resellView.ubprofile != null && ub_resellView.ubmstate == 9 }">
											<!-- 카카오 회원 -->
											<img class="img-profile rounded-circle bdProfile_Kakao" src="${ub_resellView.ubprofile }">
										</c:when>

										<c:otherwise>
											<img class="img-profile rounded-circle bdProfile" src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png">
										</c:otherwise>
									</c:choose>
									<!-- 닉네임 -->
									<a id="memberInfo" style="cursor: pointer" onclick="writeMemberSellbuy('${ub_resellView.ubnickname}')"> <span class="fw-bold bdnickname">${ub_resellView.ubnickname}</span>
									</a>
								</div>
							</div>
							<!-- 본문 글 내용-->
							<textarea style="margin-top: 10px; font-size: 18px;" id="inputReply" rows="15%" readonly>${ub_resellView.ubcontents}</textarea>
						</div>

					</div>
					<!--  -->
					<!-- 파라미터 값 -->
					<!--  -->
					<input type="hidden" name="cmfrmid" value="${sessionScope.loginId }"> <input type="hidden" name="cmfrmnickname" value="${sessionScope.loginNickname }"> <input type="hidden" name="cmtomnickname" value="${ub_resellView.ubnickname}"> <input type="hidden" name="cmtomid" value="${ub_resellView.ubmid}"> <input type="hidden" name="gdtitle" value="${ub_resellView.ubtitle }">


					<!-- 버튼 목록 -->
					<div class="row" style="border-bottom: solid 1px #E0E0E0;">
						<div class="col">
							<button id="backList" type="button" class="fw-bold btn-numberone">글목록</button>
						</div>
						<c:choose>
							<%-- 관리자일 때 --%>
							<c:when test="${sessionScope.loginId == 'admin' }">
								<div align="right" class="col">
									<input onclick="adminBoardStop('${ub_resellView.ubcode}')" type="button" style="left: 0;" class="btn btn-sm btn-secondary fw-bold" value="정지">
								</div>
							</c:when>

							<c:when test="${sessionScope.loginId != null && ub_resellView.ubmid != sessionScope.loginId}">

								<%-- 작성자가 본인이 아니고 일반사용자일 때 --%>
								<div style="text-align: end;" class="col">
									<!-- 찜버튼 -->
									<i id="zzimBtn" style="font-size: 25px;" class="fa-regular fa-heart zzimChatBtn"></i>
									<!-- 찜 수 -->
									<span style="font-size: 20px;" id="zzimCount">${ub_resellView.ubzzim }</span>
									<!-- <span style="font-size: 30px; color: gray;">|</span> -->
									<!-- 채팅버튼 -->
									<i id="chatBtn" style="font-size: 25px;" class="fa-solid fa-comment-dots zzimChatBtn"></i> <span>&nbsp;</span>
									<!-- <span style="font-size: 30px; color: gray;">|</span> -->
									<!-- 신고버튼 -->
									<i id="ubWarning" style="font-size: 25px;" onclick="ubWarningCheckModal()" class='fa-solid fa-land-mine-on zzimChatBtn'></i>

								</div>
							</c:when>

							<%-- 작성자 본인일 때 --%>
							<c:when test="${ub_resellView.ubmid == sessionScope.loginId}">
								<!-- 찜버튼 -->
								<!-- 거래 / 구매  -->
								<div style="text-align: end;" class="col">
								<i	id="zzimBtn" style="font-size:25px;"
									class="fa-regular fa-heart zzimChatBtn"></i>
									<!-- 찜 수 -->
									<span
									style="font-size: 20px;"
									id="zzimCount">${ub_resellView.ubzzim }</span>
									<!-- 거래중 / 거래완료 -->
									<select class="select-size" id="totalOp">
										<option value="1">거래중</option>
										<option value="9">거래완료</option>
									</select>
									<!-- 글수정 -->
									<button onclick="resellModifyForm()" class="fw-bold btn-numberone" type="button">수정</button>
									<!-- 글삭제 -->
									<input onclick="ubDeleteCheckModal()" type="button" class="fw-bold btn-numberone" value="삭제">
								</div>
							</c:when>
						</c:choose>
					</div>

					<!--  -->
					<!--  -->
					<!--  -->
					<!--  -->
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
										<input type="checkbox" class="selectCheckBox goods_name" onclick="clickBox(this, '${gdList.gdname }')" value="${gdList.gdname }"> <span class="goods_name gd_nameList">${gdList.gdname }</span>

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
				
				<div class="row mb-2">
					<div class="col text-center">
								<span class="fw-bold boardCategory"> < 구매자의 다른 상품 > </span>
								<span id="memberList_Btn">++더보기</span>
				
					</div>
				</div>

				<!-- 거래자의 다른 품목 리스트 -->
				<div class="row">
					<c:forEach items="${ memberSellList}" var="sellList">
						<div class="col-4">
							<a href="selectResellView?ubcode=${sellList.ubcode}&ubsellbuy=${sellList.ubsellbuy}&modifyCheck=LIST"> <img style="width: 270px; height: 200px; object-fit: cover; border-top-left-radius: 10px; border-top-right-radius: 10px;" class="another_goods" alt="" src="${pageContext.request.contextPath }/resources/img/resell/${sellList.ubmainimg }">
							</a>

							<div class="card_body text-left fw-bold">
								<!-- <div class="fw-bold text-white" style="width:270px; background-color:#00bcd4;">	 -->
								<a id="sellList_title" href="selectResellView?ubcode=${sellList.ubcode}&ubsellbuy=${sellList.ubsellbuy}&modifyCheck=LIST"> ${sellList.ubtitle} 
								<br>
								${sellList.ubdatedef}
								</a>
								<!-- </div> -->
							</div>
<%-- 							<div class="card_footer  text-left" style="margin-bottom: 30px;">
								<!-- <div  style="width:270px; background-color:#00bcd4;"> -->
								${sellList.ubdate}
								<!-- </div> -->
							</div> --%>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</main>

	<!-- 신고 확인 모달 -->
	<div class="modal fade" id="ubWarningCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시글 신고</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					게시글을 신고하시겠습니까? <br> <span class="text-danger fw-bold">(※한번 신고한 게시글은 신고취소가 불가능합니다.)</span>
				</div>
				<div class="modal-footer">
					<input type="hidden">
					<button class="close btn btn-info text-white" onclick="insertResellWarning()">네</button>
					<button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div>

	<!--  -->
	<!-- 삭제 확인 모달 -->
	<div class="modal fade" id="ubDeleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시글 삭제</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<span class="fw-bold">게시글을 삭제하시겠습니까?</span>
				</div>
				<div class="modal-footer">
					<input type="hidden">
					<button class="close btn btn-info text-white" onclick="updateResellDelete()">네</button>
					<button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	
	let checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}

</script>

<script type="text/javascript">
	
	//console.log("찜체크 : " + zzim_Check);
	const warningBtn = document.getElementById("warningBtn"); //신고
	const zzimBtn = document.getElementById("zzimBtn"); //찜버튼
	const chatBtn = document.getElementById("chatBtn"); //채팅버튼
	const loginId = '${sessionScope.loginId}'; //로그인된 아이디
	const ubcode = '${ub_resellView.ubcode}'; //현재 글번호
	const ubmid = '${ub_resellView.ubmid}'; //작성자아이디
	const ubnickname = '${ub_resellView.ubnickname}';	//작성자닉네임
	const ubsellbuy = '${ub_resellView.ubsellbuy}'; //사구, 팔구  구분
	const ubstate = '${ub_resellView.ubstate}'; // 글 상태 값 
	const totalOp = document.getElementById("totalOp"); // 글 상태 select태그
	const selectCheckBox = document.querySelectorAll(".selectCheckBox"); // 상품 상태 checkbox 
	const select_gdcode = document.querySelectorAll(".select_gdcode"); //상품코드	
	const select_gdstate = document.querySelectorAll(".select_gdstate");//상품상태 
	const gd_nameList = document.querySelectorAll(".gd_nameList"); //상품명 
	const gd_priceList = document.querySelectorAll(".gd_priceList"); //상품가격 
	const soldCheckMsg = document.getElementById("soldCheckMsg");	// 제목에 '판매완료'Text 출력하기용
	//const blur_img = document.getElementById("blur_img");	
	const imgState = document.getElementsByClassName('imgState');	// 이미지에 '판매완료' Text 띄우기용
	const memberList_Btn = document.getElementById('memberList_Btn');	//회원의 중고거래 글 더보기
	
	let zzim_Check = '${zzim_Check}';
	let ubzzim = '${ub_resellView.ubzzim }';	//찜 갯수
	
	
	memberList_Btn.addEventListener('click', load_memberList);
	
	function load_memberList(){
		
		location.href = 'selectResellTransactionList?searchType=ubmid&keyword='+ubnickname;		
	}
	
	
</script>


<!-- 페이지 로드 스크립트 -->
<script type="text/javascript">
window.onload = function(){
	console.log('페이지로드')
	addPriceComma();		// 페이지 로드 시 가격에 콤마 표시
	checkResellWarning();	// 페이지 로드 시 회원의 현재 글 신고 여부확인
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

function checkResellWarning() {
	console.log('checkResellWarning 호출');
	/* 게시글 신고 확인 */
	$.ajax({
		type : "get",
		url : "checkResellWarning_ajax",
		data : {
			"loginId" : loginId,
			"ubcode" : ubcode
		},
		async : false,
		success : function(wnCheck) {
			console.log("신고유무 확인 : " + wnCheck);
			if (wnCheck === "Yes") {
				$("#ubWarning").addClass("text-danger");
			}
		}
	});
}

function myZzimCheck(){
	console.log('myZzimCheck 호출');
	/* 로그인한 회원이 현재 글에 찜을 했는지 여부를 확인 */
	if (zzim_Check === 'UNCHECK') {
		/* zzimBtn.classList.add("blue");
		zzimBtn.classList.remove("red"); */
		
		$("#zzimBtn").removeClass("fa-solid");
		
	} else if (zzim_Check === 'CHECK') {
/* 			zzimBtn.classList.add("red");
		zzimBtn.classList.remove("blue"); */
		
		$("#zzimBtn").addClass("fa-solid");
	}

}

/* 페이지로드시 글의 거래상태체크 */
function ubstateCheckFunction(){
	console.log('ubstateCheckFunction 호출');
	console.log('글의 현재 상태값 : ', ubstate);
	
	if (ubstate === '9') { // 글의 상태값이 9(거래완료)이면 실행.
		console.log('글의 상태: 거래완료 확인');
	
		for(imgState_ of imgState){
			imgState_.classList.add('imText');
			imgState_.innerText='거래완료';	
		}
		
		for (let j = 0; j < select_gdstate.length; j++) {
			gd_nameList[j].classList.add('line-through');
			gd_priceList[j].classList.add('line-through');
			selectCheckBox[j].setAttribute('disabled','disabled');
		}
	} else { //글의 상태값이 1(거래중)이면 실행
		console.log('글의 상태: 거래중 확인');
	
		for(imgState_ of imgState){
			imgState_.classList.remove('imText');
			imgState_.innerText='';	
		}
		
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
	
	// 로그인아이디가 작성자와 같으면 select 태그 선택
	if (ubmid === loginId){
		for (let i = 0; i < totalOp.options.length; i++) {
			if (totalOp.options[i].value == ubstate) 
				/* 글의 거래상태 option (9:거래완료 ,1:거래중)와 
				페이지 이동시 넘어온 글의 상태값 파라메터가 같을 경우 그 option에 selected 속성 추가*/
				totalOp.options[i].selected = 'true';
		}
	}
}

</script>



<script type="text/javascript">
if(loginId.length >0){
	myZzimCheck();		// 페이지 로드 시 회원의 현재 글 찜 여부확인
	zzimBtn.addEventListener('click', clickZzim);

	if (ubmid != loginId){
		chatBtn.addEventListener('click', chatInsert_Ajax);
				}

}
/* 찜 클릭 핸들러 */
function clickZzim(){
	$.ajax({
		type : "get",
		url : "zzimClick_ajax",
		async : false, //전역변수 값 저장을 위해 필요
		data : {
			"zzubcode" : ubcode,
			"zzmid" : loginId,
			"zzim_Check" : zzim_Check
		},

		success : function(zzimCheck) {
			console.log("zzimCheck : " + zzimCheck);

			if (zzimCheck == 'CHECK') { //찜 했을 때
				/* zzimBtn.classList.remove("blue");
				zzimBtn.classList.add("red"); */
				zzim_Check = 'CHECK';

				ubzzim = Number(ubzzim)+1;
				document.getElementById("zzimCount").innerHTML = ubzzim;
				
				$("#zzimBtn").addClass("fa-solid");
				
			} else { //찜 취소했을 때
				/* zzimBtn.classList.remove("red");
				zzimBtn.classList.add("blue"); */
				zzim_Check = 'UNCHECK';
				
				$("#zzimBtn").removeClass("fa-solid");
				
				ubzzim = Number(ubzzim)-1;
				document.getElementById("zzimCount").innerHTML = ubzzim;
			}
		}
	})
	
}

/* 챗버튼 클릭 이벤트핸들러 */
function chatInsert_Ajax() {
   // 로그인 확인
   $.ajax({
      type : 'get',
      url : 'selectLoginOut_ajax',
      async : false,
      success : function(result){
         if (result === "2"){ 
            if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
               location.href = "loadToLogin"
               return;
            }
            return;
         }
         
         // 체크 확인
         if(gd_names.length == '0'){
            alert('관심있는 상품을 선택해주세요');
            return;
         }
         
         
         $.ajax({
   
            type : 'post',
            url : 'insertResellChat',
            traditional : true,     // 배열 전송위해서 필요.  
            async : false,
            data : {
               'gd_names' : gd_names,
               'cmfrmid' : cmfrmid,
               'cmfrmnickname' : cmfrmnickname,
               'cmtomnickname' : cmtomnickname,
               'cmtomid' : cmtomid,
               'gdtitle' : gdtitle
            },
            dataType : 'json',
            success : function(chatResult) {
               alert('바르고 고운 말을 써주세요.');
               console.log("chatResult : ", chatResult);
      
               popupChat(chatResult, cmtomnickname, '${ub_resellView.ubprofile }');
      
            }
         })
      }
   })
}


	
</script>


<!-- 글 상태 옵션 변경 ajax 스크립트  -->
<script type="text/javascript">
/* 작성자 본인일 경우만 이벤트실행가능 */
	if (ubmid === loginId){
		totalOp.addEventListener('change', selectOp_value);
	}

	function selectOp_value(e) {
		console.log("e", e.target.value);
		let select_ubstate = e.target.value;
		console.log("글 상태 : ", select_ubstate);
		console.log("글 번호 : ", ubcode);

		$.ajax({
			type : 'get',
			url : 'updateResellState_usedBoardAjax',
			data : {
				'ubcode' : ubcode,
				'ubstate' : select_ubstate
			},

			success : function(result) {
				console.log("결과", result);
				if (result === 'SOLD') {
					for(imgState_ of imgState){
						imgState_.classList.add('imText');
						imgState_.innerText='거래완료';	
						}
					for (let i = 0; i < selectCheckBox.length; i++) {
						console.log("길이", selectCheckBox.length)

						gd_nameList[i].classList.add('line-through');
						gd_priceList[i].classList.add('line-through');
						selectCheckBox[i].setAttribute('disabled','disabled');
					}

				} else {
					
					for(imgState_ of imgState){
						imgState_.classList.remove('imText');
						imgState_.innerText='';	
					}
					for (var j = 0; j < select_gdstate.length; j++) {

						if (select_gdstate[j].value === '0') {
							console.log("상태값이 0인 : "
									+ select_gdstate[j].value);
							//css속성 주기
							selectCheckBox[j].setAttribute('disabled', 'disabled');
							gd_nameList[j].classList.add('line-through');
							gd_priceList[j].classList.add('line-through');
						} else {
							console.log("상태값이 1인 : " + select_gdstate[j].value);
							selectCheckBox[j].removeAttribute('disabled');
							gd_nameList[j].classList.remove('line-through');
							gd_priceList[j].classList.remove('line-through');
						}
					}
				}
			}
		});
	}
	
</script>

<script type="text/javascript">
	// 게시글 경고 모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++) {
		close[i].addEventListener("click", function() {
			$("#ubWarningCheckModal").modal("hide");
		});
	}
</script>

<!--신고 스크립트  -->
<script type="text/javascript">



///////////////////////////[신고]/////////////////////////////////
	function ubWarningCheckModal() {
		/* 게시글 신고 클릭 시 모달창 출력 */
		if ($("#ubWarning").hasClass("text-danger")) {
			alert("이미 신고접수된 게시물입니다.");
		} else {
			$("#ubWarningCheckModal").modal('show');
		}
	}


	function insertResellWarning() {
		/* 게시글 신고 */
		console.log("게시글 신고자 : " + loginId);
		console.log("신고할 글번호 : " + ubcode);
		if ($("#ubWarning").hasClass("text-danger")) {
			deleteResellWarning();
		} else {
			$.ajax({
				type : "get",
				url : "insertResellWarning_ajax",
				data : {
					"loginId" : loginId,
					"ubcode" : ubcode
				},
				async : false,
				success : function(insertResult) {
					console.log(insertResult);
					if (insertResult > 0) {
						alert("게시글 신고가 접수되었습니다.")
						$("#ubWarning").addClass("text-danger");
					}
				}
			});
		}
	}

	function deleteResellWarning() {
		/* 신고 취소 // 22.07.06 신고취소 안되도록 수정 */
		$("#ubWarning").removeClass("text-danger");
		$.ajax({
			type : "get",
			url : "deleteResellWarning_ajax",
			data : {
				"loginId" : loginId,
				"ubcode" : ubcode
			},
			async : false,
			success : function(deleteResult) {
				console.log(deleteResult);
			}
		});
	}
</script>

<script type="text/javascript">
	// 게시글 삭제 경고 모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++) {
		close[i].addEventListener("click", function() {
			$("#ubDeleteCheckModal").modal("hide");
		});
	}
</script>


<script type="text/javascript">
	/* 게시글 수정, 삭제 */
	function resellModifyForm() {
		/* 게시글 수정 페이지 이동  */
		let modifyCheck = 'MODIFY';
		location.href = "loadToResellModifyForm?ubcode=" + ubcode
				+ "&ubsellbuy=" + ubsellbuy + "&modifyCheck=" + modifyCheck;
	}

	function ubDeleteCheckModal() {
		/* 게시글 삭제버튼 클릭 시 모달 출력 */
		$("#ubDeleteCheckModal").modal('show');
	}
	function updateResellDelete() {
		/* 게시글 삭제(상태변경) */
		//모달창에서 "네" 버튼 클릭 시 삭제
		location.href = "updateResellDelete?ubcode=" + ubcode + "&ubsellbuy="
				+ ubsellbuy;
	}
</script>

<!-- 글목록 버튼클릭 이벤트핸들러 스크립트  -->
<script type="text/javascript">
// 로컬스토리지 초기화
const storage = window.localStorage;

//글목록버튼
const backList = document.querySelector("#backList");	
backList.addEventListener("click", backListHandler);
// 기본값 (스토리지에 아이템 없을 때 사용)
let searchType = '';
let keyword = '';
let selRegion = '${ub_resellView.ubrgcode}';
let page = '1';

//스토리지 아이템 확인
if(storage.getItem('searchType') !=null){
	searchType = storage.getItem('searchType');
	console.log('로컬스토리지 검색타입 : ', searchType);
	}
	
if(storage.getItem('keyword') !=null){
	keyword = storage.getItem('keyword');
	console.log('로컬스토리지 검색어 : ', keyword);
}

if(storage.getItem('selRegion') !=null ){
	selRegion = storage.getItem('selRegion');
	console.log('로컬스토리지 선택지역 : ', selRegion);
}

if(storage.getItem('page') !=null ){
	page = storage.getItem('page');	
	console.log('로컬스토리지 선택페이지 : ', page);
}

	
	
	function backListHandler() {

		console.log("글목록버튼 클릭이벤트");
		
		location.href = 'selectResellPageList?sellBuy='+ubsellbuy+'&searchType='+searchType+'&keyword='+keyword+'&searchVal='+selRegion+'&page='+page;
	}

</script>



<!-- 작성자정보스크립트 -->
<script type="text/javascript">
let memberInfo = document.getElementById('memberInfo');

memberInfo.addEventListener('click', memberInfoView)


function memberInfoView(e){
	e.preventDefault();
	
$.ajax({
	type : 'get',
	url : 'selectMyInfoResellView',
	data : {'ubmid' : ubmid},
	type : 'json',
	async : false,
	success : function(mInfo){		
		console.log('거래자정보',mInfo );
				}
		
})

}


</script>

<script type="text/javascript">
	// 게시글 삭제 경고 모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++) {
		close[i].addEventListener("click", function() {
			$("#ubDeleteCheckModal").modal("hide");
		});
	}
</script>


<script type="text/javascript">
	/* 게시글 수정, 삭제 */
	function resellModifyForm() {
		/* 게시글 수정 페이지 이동  */
		let modifyCheck = 'MODIFY';
		location.href = "loadToResellModifyForm?ubcode=" + ubcode
				+ "&ubsellbuy=" + ubsellbuy + "&modifyCheck=" + modifyCheck;
	}

	function ubDeleteCheckModal() {
		/* 게시글 삭제버튼 클릭 시 모달 출력 */
		$("#ubDeleteCheckModal").modal('show');
	}
	function updateResellDelete() {
		/* 게시글 삭제(상태변경) */
		//모달창에서 "네" 버튼 클릭 시 삭제
		location.href = "updateResellDelete?ubcode=" + ubcode + "&ubsellbuy="
				+ ubsellbuy;
	}
</script>

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
		console.log(ubcode);
		location.href="admin_updateResellStop?ubcode="+ubcode+"&ubsellbuy=${ub_resellView.ubsellbuy}";
	}
</script>


<script type="text/javascript">
/**
*
* Version: 0.0.6
* Author: Gianluca Guarini
* Contact: gianluca.guarini@gmail.com
* Website: http://www.gianlucaguarini.com/
* Twitter: @gianlucaguarini
*
* Copyright (c) Gianluca Guarini
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
**/


(function(window, document, $) {
 'use strict';

 // Plugin private cache
 // static vars
 var cache = {
   filterId: 0
 },
   $body = $('body');

 var Vague = function(elm, customOptions) {
   // Default options
   var defaultOptions = {
     intensity: 5,
     forceSVGUrl: false,
     animationOptions: {
       duration: 1000,
       easing: 'linear'
     }
   },
     // extend the default options with the ones passed to the plugin
     options = $.extend(defaultOptions, customOptions),

     /*
      *
      * Helpers
      *
      */

     _browserPrefixes = ' -webkit- -moz- -o- -ms- '.split(' '),
     _cssPrefixString = {},
     _cssPrefix = function(property) {
       if (_cssPrefixString[property] || _cssPrefixString[property] === '') return _cssPrefixString[property] + property;
       var e = document.createElement('div');
       var prefixes = ['', 'Moz', 'Webkit', 'O', 'ms', 'Khtml']; // Various supports...
       for (var i in prefixes) {
         if (typeof e.style[prefixes[i] + property] !== 'undefined') {
           _cssPrefixString[property] = prefixes[i];
           return prefixes[i] + property;
         }
       }
       return property.toLowerCase();
     },
     // https://github.com/Modernizr/Modernizr/blob/master/feature-detects/css-filters.js
     _support = {
       cssfilters: function() {
         var el = document.createElement('div');
         el.style.cssText = _browserPrefixes.join('filter' + ':blur(2px); ');
         return !!el.style.length && ((document.documentMode === undefined || document.documentMode > 9));
       }(),

       // https://github.com/Modernizr/Modernizr/blob/master/feature-detects/svg-filters.js
       svgfilters: function() {
         var result = false;
         try {
           result = typeof SVGFEColorMatrixElement !== undefined &&
             SVGFEColorMatrixElement.SVG_FECOLORMATRIX_TYPE_SATURATE == 2;
         } catch (e) {}
         return result;
       }()
     },

     /*
      *
      * PRIVATE VARS
      *
      */

     _blurred = false,
     // cache the right prefixed css filter property
     _cssFilterProp = _cssPrefix('Filter'),
     _svgGaussianFilter,
     _filterId,
     // to cache the jquery animation instance
     _animation,

     /*
      *
      * PRIVATE METHODS
      *
      */

     /**
      * Create any svg element
      * @param  { String } tagName: svg tag name
      * @return { SVG Node }
      */

     _createSvgElement = function(tagName) {
       return document.createElementNS('http://www.w3.org/2000/svg', tagName);
     },

     /**
      *
      * Inject the svg tag into the DOM
      * we will use it only if the css filters are not supported
      *
      */

     _appendSVGFilter = function() {
       // create the svg and the filter tags
       var svg = _createSvgElement('svg'),
         filter = _createSvgElement('filter');

       // cache the feGaussianBlur tag and make it available
       // outside of this function to easily update the blur intensity
       _svgGaussianFilter = _createSvgElement('feGaussianBlur');

       // hide the svg tag
       // we don't want to see it into the DOM!
       svg.setAttribute('style', 'position:absolute');
       svg.setAttribute('width', '0');
       svg.setAttribute('height', '0');
       // set the id that will be used as link between the DOM element to blur and the svg just created
       filter.setAttribute('id', 'blur-effect-id-' + cache.filterId);

       filter.appendChild(_svgGaussianFilter);
       svg.appendChild(filter);
       // append the svg into the body
       $body.append(svg);

     };

   /*
    *
    * PUBLIC VARS
    *
    */

   // cache the DOM element to blur
   this.$elm = elm instanceof $ ? elm : $(elm);


   /*
    *
    * PUBLIC METHODS
    *
    */

   /**
    *
    * Initialize the plugin creating a new svg if necessary
    *
    */

   this.init = function() {
     // checking the css filter feature
     if (_support.svgfilters) {
       _appendSVGFilter();
     }
     // cache the filter id
     _filterId = cache.filterId;
     // increment the filter id static var
     cache.filterId++;

     return this;

   };

   /**
    *
    * Blur the DOM element selected
    *
    */

   this.blur = function() {

     var cssFilterValue,
       // variables needed to force the svg filter URL
       loc = window.location,
       svgUrl = options.forceSVGUrl ? loc.protocol + '//' + loc.host + loc.pathname + loc.search : '';

     // use the css filters if supported
     if (_support.cssfilters) {
       cssFilterValue = 'blur(' + options.intensity + 'px)';
       // .. or use the svg filters
     } else if (_support.svgfilters) {
       // update the svg stdDeviation tag to set up the blur intensity
       _svgGaussianFilter.setAttribute('stdDeviation', options.intensity);
       cssFilterValue = 'url(' + svgUrl + '#blur-effect-id-' + _filterId + ')';
     } else {
       // .. use the IE css filters
       cssFilterValue = 'progid:DXImageTransform.Microsoft.Blur(pixelradius=' + options.intensity + ')';
     }

     // update the DOM element css
     this.$elm[0].style[_cssFilterProp] = cssFilterValue;
     // set the _blurred internal var to true to cache the element current status
     _blurred = true;

     return this;
   };


   /**
    * Animate the blur intensity
    * @param  { Int } newIntensity: new blur intensity value
    * @param  { Object } customAnimationOptions: default jQuery animate options
    */

   this.animate = function(newIntensity, customAnimationOptions) {
     // control the new blur intensity checking if it's a valid value
     if (typeof newIntensity !== 'number') {
       throw (typeof newIntensity + ' is not a valid number to animate the blur');
     } else if (newIntensity < 0) {
       throw ('I can animate only positive numbers');
     }
     // create a new jQuery deferred instance
     var dfr = new $.Deferred();

     // kill the previous animation
     if (_animation) {
       _animation.stop(true, true);
     }

     // trigger the animation using the jQuery Animation class
     _animation = new $.Animation(options, {
       intensity: newIntensity
     }, $.extend(options.animationOptions, customAnimationOptions))
       .progress($.proxy(this.blur, this))
       .done(dfr.resolve);

     // return the animation deferred promise
     return dfr.promise();
   };

   /**
    *
    * Unblur the DOM element
    *
    */
   this.unblur = function() {
     // set the DOM filter property to none
     this.$elm.css(_cssFilterProp, 'none');
     _blurred = false;
     return this;
   };

   /**
    *
    * Trigger alternatively the @blur and @unblur methods
    *
    */

   this.toggleblur = function() {
     if (_blurred) {
       this.unblur();
     } else {
       this.blur();
     }
     return this;
   };
   /**
    * Destroy the Vague.js instance removing also the svg filter injected into the DOM
    */
   this.destroy = function() {
     // do we need to remove the svg filter?
     if (_support.svgfilters) {
       $('filter#blur-effect-id-' + _filterId).parent().remove();
     }

     this.unblur();

     // clear all the property stored into this Vague.js instance
     for (var prop in this) {
       delete this[prop];
     }

     return this;
   };
   // init the plugin
   return this.init();
 };

 // export the plugin as a jQuery function
 $.fn.Vague = function(options) {
   return new Vague(this, options);
 };

}(window, document, jQuery));

</script>


<script type="text/javascript">
	// 게시글 경고 모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++) {
		close[i].addEventListener("click", function() {
			$("#ubWarningCheckModal").modal("hide");
		});
	}
</script>

</html>