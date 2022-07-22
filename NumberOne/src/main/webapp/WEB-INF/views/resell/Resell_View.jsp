<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 폰트어썸 -->
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<title>${board.bdtitle } - 1인자:게시판 글상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
	.row .col-1{
		width: auto;
	}
	#inputReply{
		border: none;
		width: -webkit-fill-available;
		resize: none;
		height: auto;
	}
	#inputComment{
		resize: none;
		height: auto;
		width: -webkit-fill-available; 
		padding: 10px 0px; 
		font-size:20px;
	}
	.commentDate{
		color: gray;
		font-size: 17px;
	}
	.boardDate{
		color: gray;
		font-size: 17px;
		text-align: left;
	}
	.bdhit{
		color: gray;
		font-size: 17px;
	}
	.boardCategory{
		color : #00a5ba;
		font-size: 20px;
	}
	.bdProfile{
		height: 40px;
		width:40px;
		object-fit: cover;
	}
	.bdProfile_Kakao{
		height: 40px; 
		width:40px;
		object-fit: cover;
	}
	.bdnickname{
		font-size: 20px;
	}
	.bdregion{
		font-weight: bold;
		color : #00bcd4;
		font-size: 20px;
	}
	.idDateHits{
		border-bottom: solid #E0E0E0 3px;
	}
	.boardTitle{
		font-size: 25px;
	}
	.boardContents{
		border-bottom: solid #E0E0E0 3px;
		font-size: 21px;
	}
	
	.commentCount{
		border-bottom : solid #E0E0E0 3px;
		font-size:20px;
	}
	.inputRpcontents{
		font-size:20px;
	}
	.outerCmtBox{
		background-color : #F6F6F6;
		display: table;
		vertical-align: middle;
	}
	.innerCmtBox{
		display: table-cell;
		margin: auto;
	}
	.replyButton{
		background-color: #F4F4F4;
		float: right;
	}
	.rpnickname{
		font-size:20px;
	}
	.rpProfile{
		height:50px;
		width:50px;
		object-fit: cover;
	}
	.rpProfile_None{
		height:50px; 
		width:50px;
		object-fit: cover;
	}
	.icon{
		border : solid gray 2px;
		border-radius: 5px;
		padding: 2px;
		color : gray;
	}
	.icon:hover{
		cursor: pointer;
	}
	#inputSearchText{
		font-size: 18px;
	}
	.img-container{
     overflow: hidden;
     display: flex;
     align-items: center;
     justify-content: center;
     border: solid #E0E0E0 2px;
     margin-top: 2%;
     width: 200px;
     height: 200px;
     
   }
   #upload_Img{
   	width: 200px;
   	height: 200px;
   	object-fit: cover;
   }
   #inputModifyRpBox{
   	border: solid #E0E0E0 2px; 
   	border-radius:5px;
   }
   
   /* 중고거래 */
.Resell_Wrapper{
	width: 450px;
	height: 450px;
	text-align: center;
	left: 50%;
    top: 50%;

}   
.Resell_contents{
	top: 50px;
}
.Resell_img_container{

	text-align: center;
	overflow: hidden;
	width: 600px;
	height: 450px;
	position: relative;
}   
.Resell_img{
    position: relative;
    width: 600px;
    height: 400px;
    display: none;	
    object-fit: fill;
}
.active{
    display: block;
}
.square{
	width: 150px;
	height: 150px;
	text-align: center;
	line-height: 150px;
	background-color: #00bcd4;
	color: white;
	font-weight: bold;
	border-radius: 8px;
	font-size: 25px;
}
.goods_info{
/* 	background-color:#eaf8ff;
	border-radius: 8px; */
}
.seller_and_buttons{
	height: 50px;
	background-color:#eaf8ff;	
	line-height: 50px;
	text-align: center;
}
.selectCheckBox{
	height: 20px;
	width: 20px;
}
.good_name{
	font-size: 20px;
}
.another_goods{
	weight: 400px;
	width: 400px;
	object-fit: fill;
}
</style>
</head>
<body>
	    <!-- TopBar -->
        <c:choose>
            <c:when test="${sessionScope.loginId != 'admin'}">
                    <%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
            </c:when>
            <c:otherwise>
                    <%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
            </c:otherwise>
        </c:choose>
        <!-- End of TopBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Resell.jsp"%>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">중고거래 상세페이지</h1>


				<div class="container-header container-card_w100 slider">

					<div class="w3-content w3-display-container">
						<img class="mySlides" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}" style="width: 100%">

						<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
							<img class="mySlides" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}" style="width: 100%">
						</c:forEach>
						<div class="w3-left position-left" onclick="plusDivs(-1)">&#10094;</div>
						<div class="w3-right position-right" onclick="plusDivs(1)">&#10095;</div>

						<!--  -->
					</div>


				</div>



				<div class="container-body">
					<!-- 품목명  -->
					<form action="insertResellChat">
						<div class="container-card_goods container-card_w100">
							<c:forEach items="${gd_resellView}" var="gdList">

								<div class="container-card_goods_2">
									<div class="item-basis_1">

										<input type="checkbox" class="selectCheckBox" onclick="clickBox(this, '${gdList.gdname }')" value="${gdList.gdname }">
									</div>
									<div class="item-basis_2 gd_nameList">${gdList.gdname }</div>
									<div class="item-basis_3 gd_priceList">${gdList.gdprice }</div>
									<input type="hidden" class="select_gdcode" value="${gdList.gdcode }"> <input type="hidden" class="select_gdstate"
										value="${gdList.gdstate }"
									>
								</div>

							</c:forEach>


							<input type="hidden" name="cmfrmid" value="${sessionScope.loginId }"> <input type="hidden" name="cmfrmnickname"
								value="${sessionScope.loginNickname }"
							> <input type="hidden" name="cmtomnickname" value="${ub_resellView.ubnickname}"> <input type="hidden" name="cmtomid"
								value="${ub_resellView.ubmid}"
							> <input type="hidden" name="gdtitle" value="${ub_resellView.ubtitle }">


						</div>


						<div class="container-flex_2">

							<div class=item-basis_5>
								<div>
									<p style="font-size: 12.5px">
										<a href="selectMyInfoMemberView" id ="memberInfo">${ub_resellView.ubnickname} &nbsp;&nbsp; <img class="img-profile rounded-circle" style="width: 50px"
											src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${ub_resellView.ubprofile }"
										>
										</a>

									</p>
								</div>

							</div>

							<div class=" item-basis_4">
								<button id="sellBuyList" type="button">글목록</button>
							</div>
							<div class="item-basis_4">
								<button id="zzimBtn" type="button">찜</button> <span id="zzimCount">${ub_resellView.ubzzim }</span>
							</div>
							<c:choose>
								<c:when test="${ub_resellView.ubsellbuy == 'B' }">
									<a href=""><span class="fw-bold boardCategory"> | 사구 </span></a> 
								</c:when>
								
								<c:otherwise>
									<a href=""><span class="fw-bold boardCategory"> | 팔구 </span></a>
								</c:otherwise>
							</c:choose>
							<span class="fw-bold" style="color:gray; font-size:20px">/</span> 
								<a href="selectRegionBoardList"><span class="bdregion">${ub_resellView.ubrgcode }</span></a>
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col">
							<span class="fw-bold boardTitle">${ub_resellView.ubtitle }</span>  
						</div>
					</div>
					
					<!-- 중고거래 사진 / 본문  -->
					<div class="row" style="margin-top: 40px; border-bottom: solid 1px #E0E0E0">
						<!-- 사진 -->
						<div class="col-6">
							<div class="Resell_img_container">
								<img class="active Resell_img" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}" >
									<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
										<img class="Resell_img" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}">
									</c:forEach>
	<!-- 							<button id="prev" onclick="prev()"> &lt; </button>
									<button id="next" onclick="next()"> &gt; </button> -->
							</div>
						</div>
						<div class="col-6" >
							<div class="row">
								<div class="col seller_and_buttons">
									<!-- 판매자 정보 -->
									<!-- 프로필 -->
									<c:choose>
										<c:when test="${ub_resellView.ubprofile != null && ub_resellView.ubstate == 1 }">
											<img class="img-profile rounded-circle bdProfile"  src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/${ub_resellView.ubprofile }">
										</c:when>
										
										<c:when test="${ub_resellView.ubprofile != null && ub_resellView.ubstate == 9 }">
											<!-- 카카오 회원 -->
											<img class="img-profile rounded-circle bdProfile_Kakao" src="${ub_resellView.ubprofile }">
										</c:when>
											
										<c:otherwise>
											<img class="img-profile rounded-circle bdProfile"  src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png">
										</c:otherwise>
									</c:choose>		
									<!-- 닉네임 -->
									<a style="cursor: pointer" onclick="writeMemberBoard('${ub_resellView.ubnickname}')"><span class="fw-bold bdnickname">${ub_resellView.ubnickname}</span></a> 
		
								</div>
							</div>
							<!-- 본문 글 내용-->
							<textarea style="margin-top:10px;" id="inputReply" rows="10%"  readonly>${ub_resellView.ubcontents}</textarea>
						</div>	
					</div>
					
					<!-- 품목정보 -->
					<div class="row" style="margin-top: 20px;">
						<div class="col-1">
							<div class="square">
								<c:choose>
								<c:when test="${ub_resellView.ubsellbuy == 's' }">
									구매상품
								</c:when>
								
								<c:otherwise>
									판매상품
								</c:otherwise>
							</c:choose>
								
							</div>
						</div>
						<div class="col goods_info">
							<c:forEach items="${gd_resellView}" var="gdList">
							<div class="row">
								<div class="col-6">
									<input type="checkbox" class="selectCheckBox good_name" onclick="clickBox(this, '${gdList.gdname }')" value="${gdList.gdname }">
									<span class="good_name">${gdList.gdname }</span>
									<span class="good_name">${gdList.gdprice }</span>
									<input type="hidden" class="select_gdcode" value="${gdList.gdcode }"> <input type="hidden" class="select_gdstate"
										value="${gdList.gdstate }">
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
					<input type="hidden" name="cmfrmid" value="${sessionScope.loginId }"> 
					<input type="hidden" name="cmfrmnickname" value="${sessionScope.loginNickname }"> 
					<input type="hidden" name="cmtomnickname" value="${ub_resellView.ubnickname}"> <input type="hidden" name="cmtomid"
								value="${ub_resellView.ubmid}"> 
					<input type="hidden" name="gdtitle" value="${ub_resellView.ubtitle }">
					
					<!-- 수정/삭제/정지 버튼 -->
					<c:choose>
						<%-- 작성자 본인일 때 --%>
						<c:when test="${ub_resellView.ubmid == sessionScope.loginId}">
							<div class="card_in-icon">
								<select class="select-size" id="totalOp">
									<option value="1">판매중</option>
									<option value="9">판매완료</option>
								</select>
							</div>
							<div class="card_in-icon">
								<button onclick="resellModifyForm()" type="button" class="btn-numberone btn-sm fw-bold">수정</button>
							</div>
							<div class="card_in-icon">
								<input onclick="ubDeleteCheckModal()" type="button" style="background-color: #00bcd4;" class="btn-numberone btn-sm fw-bold" value="삭제">
							</div>
						</c:when>
						<%-- 관리자일 때 --%>
						<c:when test="${sessionScope.loginId == 'admin' }">
							<div align="right" class="col">
								<input onclick="adminBoardStop('${ub_resellView.ubcode}')" type="button" style="left:0;" class="btn btn-sm bg-secondary fw-bold text-white" value="정지">
							</div>
						</c:when>
					</c:choose>

				<hr>				
				<div class="row" >
					<div class="col text-center" >
						<c:choose>
							<c:when test="${ub_resellView.ubsellbuy == 'B' }">
								<a href=""><span class="fw-bold boardCategory">구매자의 다른 상품</span></a> 
							</c:when>
							
							<c:otherwise>
								<a href=""><span class="fw-bold boardCategory">판매자의 다른 상품 </span></a>
							</c:otherwise>
						</c:choose>			
					</div>
				</div>
				
				<!-- 판매자의 다른 품목 리스트 -->
				<div class="row">
					<c:forEach items="${ memberSellList}" var="sellList">
					<div class="col-4">
						<a href="selectResellView?ubcode=${sellList.ubcode}&ubsellbuy=${sellList.ubsellbuy}&modifyCheck=LIST">
						<img class="another_goods" alt="" src="${pageContext.request.contextPath }/resources/img/resell/${sellList.ubmainimg }" >
						</a>
					
					<div class="card_body font-s text-right padding-right text-bold">
						<a href="selectResellView?ubcode=${sellList.ubcode}&ubsellbuy=${sellList.ubsellbuy}&modifyCheck=LIST"> ${sellList.ubtitle} </a>
					</div>
					<div class="card_footer font-s text-right padding-right">${sellList.ubdate}</div>
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


	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>


<script type="text/javascript">
	let zzim_Check = '${zzim_Check}';
	//console.log("찜체크 : " + zzim_Check);
	const warningBtn = document.getElementById("warningBtn"); //신고
	const zzimBtn = document.getElementById("zzimBtn"); //찜버튼
	const chatBtn = document.getElementById("chatBtn"); //채팅버튼
	const loginId = '${sessionScope.loginId}'; //로그인된 아이디
	const ubcode = '${ub_resellView.ubcode}'; //현재 글번호
	const ubmid = '${ub_resellView.ubmid}'; //작성자아이디
	const ubsellbuy = '${ub_resellView.ubsellbuy}'; //사구, 팔구  분류
	const ubstate = '${ub_resellView.ubstate}'; // 글 상태 값 
	const selectCheckBox = document.querySelectorAll(".selectCheckBox"); // 상품 상태 checkbox (복수 , c:forEach태그안에 있음) 
	const select_gdcode = document.querySelectorAll(".select_gdcode"); //상품코드	(복수 , c:forEach태그안에 있음) 
	const select_gdstate = document.querySelectorAll(".select_gdstate");//상품상태 (복수 , c:forEach태그안에 있음) 
	const gd_nameList = document.querySelectorAll(".gd_nameList"); //상품명 (복수 , c:forEach태그안에 있음)
	const gd_priceList = document.querySelectorAll(".gd_priceList"); //상품가격 (복수 , c:forEach태그안에 있음))

	let ubzzim = '${ub_resellView.ubzzim }';	//찜 갯수


</script>


<script type="text/javascript">
	
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
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


<!-- 슬라이드배너  -->
<script type="text/javascript">
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
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		;
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" w3-white", "");
		}
		x[slideIndex - 1].style.display = "block";
		//dots[slideIndex - 1].className += " w3-white";
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
	window.onload = function(){
		checkResellWarning();
	}
	
	function checkResellWarning() {
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
				if (wnCheck == "Yes") {
					$("#ubWarning").addClass("text-danger");
				}
			}
		});
	}


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

<!-- 글목록으로 돌아가기 -->
<script type="text/javascript">
	let sellbuy_List = document.querySelector("#sellBuyList");
	//console.log(sellbuy_List);
	
	sellbuy_List.addEventListener("click", backList);
	
	function backList() {
		console.log("글목록버튼 클릭이벤트");
		location.href = "selectResellPageList?sellBuy=" + ubsellbuy;
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
	}
</script>

<!--채팅 활성화  -->
<script type="text/javascript">
chatBtn.addEventListener('click', chatInsert_Ajax);

/* 챗버튼 클릭 이벤트핸들러 */
function chatInsert_Ajax() {
   // 로그인 확인
   $.ajax({
      type : 'get',
      url : 'selectLoginOut_ajax',
      async : false,
      success : function(result){
         if (result == "2"){ 
            if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
               location.href = "loadToLogin"
               return;
            }
            return;
         }
         
         // 체크 확인
         if(gd_names.length == 0){
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
      
               popupChat(chatResult);
      
            }
         })
      }
   })
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
		alert('성공');
		console.log('판매자정보',mInfo );
				}
		
})

}


</script>

</html>
