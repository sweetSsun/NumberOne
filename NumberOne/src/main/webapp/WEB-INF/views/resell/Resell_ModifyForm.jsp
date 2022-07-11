<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래 상세페이지</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
						<img class="mySlides" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}" style="width: 100%">

						<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list">
							<img class="mySlides" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}" style="width: 100%">
						</c:forEach>
						<div class="w3-left position-left" onclick="plusDivs(-1)">&#10094;</div>
						<div class="w3-right position-right" onclick="plusDivs(1)">&#10095;</div>

					</div>


				</div>



				<div class="container-body">
					<!-- 품목명  -->
					<!-- <form action=""> -->
						<div class="container-card_goods container-card_w100">
							<c:forEach items="${gd_resellView}" var="gdList">
								<c:choose>

									<c:when test="${gdList.gdstate==1 }">
										<div class="container-card_goods_2">
											<div class="item-basis_1">
												<input type="checkbox" class="gd_chBox">
											</div>
											<div class="item-basis_2">${gdList.gdname }</div>
											<div class="item-basis_3">${gdList.gdprice }</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="container-card_goods_2" style="text-decoration: overline;">
											<div class="item-basis_1"></div>
											<div class="item-basis_2">${gdList.gdname }</div>
											<div class="item-basis_3">${gdList.gdprice }</div>
										</div>
									</c:otherwise>

								</c:choose>
							</c:forEach>

						</div>


						<div class="container-flex_2">

							<div class=item-basis_5>
							<div><p style="font-size: 12.5px"><a href="selectMyInfoMemberView">${ub_resellView.ubnickname} 님 &nbsp;&nbsp;
										<img class="img-profile rounded-circle" style="width:50px" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${ub_resellView.ubprofile }">
										</a></p></div>
						
							</div>

							<div class=" item-basis_4"><button id="sellBuyList"> 목록</button></div>
							<div class="item-basis_4"><button id="zzimBtn" type="button"> 찜</button></div>
							<c:choose>
								<c:when test="${ub_resellView.ubmid == sessionScope.loginId}">
									<div class="card_in-icon"><button onclick="resellModifyForm()">수정</button></div>
									<div class="card_in-icon"><input onclick="ubDeleteCheckModal()" type="button" style="background-color: #00bcd4;" class="btn btn-sm fw-bold text-white" value="삭제"></div>
								</c:when>			
							<c:otherwise>
																			
									<div class="item-basis_4" >	<i id="ubWarning" onclick="ubWarningCheckModal()" class='fa-solid fa-land-mine-on  fa-2x icon' style="margin-right: 2px; font-size:40px"></i></div>
									<div class="item-basis_4"><button id="chatBtn"> 채팅</button></div>
									</c:otherwise>
</c:choose>							

							
						</div>
	<!-- </form> -->
					
					<div class="container-flex_1">
						<textarea rows="2" cols="80" style="resize: none" readonly>${ub_resellView.ubcontents}</textarea>

					</div>

				</div>


				<!-- 판매자의 다른품목 리스트  -->
				<div class="container-footer container-flex_1 container-card_w100 wrap-vertical">
					<c:forEach items="${ memberSellList}" var="sellList">
						<div class="col_2-m container-card_goods item-basis_6">
							<div class="card_top">
								<a href="selectResellView?ubcode=${sellList.ubcode}&ubsellbuy=${sellList.ubsellbuy}"><img alt=""
									src="${pageContext.request.contextPath }/resources/img/resell/${sellList.ubmainimg }" class="img_size"></a>
							</div>
							<div class="card_body font-s text-right padding-right text-bold">
								<a href="selectResellView?ubcode=${sellList.ubcode}&ubsellbuy=${sellList.ubsellbuy}"> ${sellList.ubtitle} </a>
							</div>
							<div class="card_footer font-s text-right padding-right">${sellList.ubdate}</div>

						</div>
					</c:forEach>

				</div>
			</div>
		</section>
	</main>
	<!-- 신고 확인 모달 -->
	<div class="modal fade" id="ubWarningCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 게시글 신고 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	게시글을 신고하시겠습니까?
                	<br> <span class="text-danger fw-bold">(※한번 신고한 게시글은 신고취소가 불가능합니다.)</span></div>
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn btn-info text-white" onclick="insertResellWarning()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
    
    <!--  --><!-- 삭제 확인 모달 -->
	<div class="modal fade" id="ubDeleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" > 게시글 삭제 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	<span class="fw-bold">게시글을 삭제하시겠습니까?</span>
                </div>	
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn btn-info text-white" onclick="updateResellDelete()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">

var zzim_Check = '${zzim_Check}';
console.log("찜체크 : " +zzim_Check);
		const sellBuyList = document.getElementById("sellBuyList"); //목록버튼
		const warningBtn = document.getElementById("warningBtn"); //신고
		const zzimBtn = document.getElementById("zzimBtn"); //찜버튼
		const chatBtn = document.getElementById("chatBtn"); //채팅버튼
		const loginId = '${sessionScope.loginId}';	//로그인된 아이디
		const ubcode = '${ub_resellView.ubcode}';	//현재 글번호
		const ubmid = '${ub_resellView.ubmid}';	//작성자아이디
		const ubsellbuy = '${ub_resellView.ubsellbuy}';  //사구, 팔구  분류
		
		
		window.onload = function(){
		if (zzim_Check == 'UNCHECK') {
			zzimBtn.classList.add("blue");
			zzimBtn.classList.remove("red");
		} else if(zzim_Check == 'CHECK'){
			zzimBtn.classList.add("red");
			zzimBtn.classList.remove("blue");
		}
		}
</script>


<!-- 찜버튼 스크립트 -->
<script type="text/javascript">
	/* 찜버튼 이벤트 호출 함수 */
	zzimBtn.addEventListener('click', clickZzim);

function clickZzim() {
	
		
		

		$.ajax({
			type : "get",
			url : "zzimClick_ajax",
			async : false,   	//전역변수 값 저장을 위해 필요
			data : {
				"zzubcode" : ubcode,
				"zzmid" : ubmid,
				"zzim_Check" : zzim_Check
			},
			
			success : function(zzimCheck) {
				console.log("zzimCheck : "+ zzimCheck);
				
				if (zzimCheck == 'CHECK') {	//찜 했을 때
					zzimBtn.classList.remove("blue");
					zzimBtn.classList.add("red");
					zzim_Check = 'CHECK';
				} else {					//찜 취소했을 때
					zzimBtn.classList.remove("red");
					zzimBtn.classList.add("blue");
					zzim_Check = 'UNCHECK';
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
		dots[slideIndex - 1].className += " w3-white";
	}
</script>

<script type="text/javascript">
		// 게시글 경고 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#ubWarningCheckModal").modal("hide");
			});
		}		
</script>

<script type="text/javascript">
///////////////////////////[신고]/////////////////////////////////
function ubWarningCheckModal(){
	/* 게시글 신고 클릭 시 모달창 출력 */
	if( $("#ubWarning").hasClass("text-danger") ){
		alert("이미 신고접수된 게시물입니다.");
	}else{
		$("#ubWarningCheckModal").modal('show');
	}
}

function checkResellWarning(){
	/* 게시글 신고 확인 */
	$.ajax({
		type : "get",
		url : "checkResellWarning_ajax",
		data : { "loginId" : loginId, "udcode" : udcode },
		async: false,
		success : function(wnCheck){
			console.log("신고유무 확인 : " + wnCheck );
			if( wnCheck == "Yes" ){
				$("#ubWarning").addClass("text-danger");
			}
		}
	});
}

function insertResellWarning(){
	/* 게시글 신고 */
	console.log("게시글 신고자 : " + loginId);
	console.log("신고할 글번호 : " + ubcode);
	if( $("#ubWarning").hasClass("text-danger") ){
		deleteResellWarning();
	}else{
		$.ajax({
			type : "get",
			url : "insertResellWarning_ajax",
			data : { "loginId" : loginId, "ubcode" : ubcode },
			async: false,
			success : function(insertResult){
				console.log(insertResult);
				if( insertResult > 0 ){
					alert("게시글 신고가 접수되었습니다.")
					$("#ubWarning").addClass("text-danger");
				}
			}
		});
	}
}

function deleteResellWarning(){
	/* 신고 취소 // 22.07.06 신고취소 안되도록 수정 */
	$("#ubWarning").removeClass("text-danger");
	$.ajax({
		type : "get",
		url : "deleteResellWarning_ajax",
		data : { "loginId" : loginId, "ubcode" : ubcode },
		async : false,
		success : function(deleteResult){
			console.log(deleteResult);
		}			
	});
}
</script>

<script type="text/javascript">
		// 게시글 삭제 경고 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#ubDeleteCheckModal").modal("hide");
			});
		}
</script>


<script type="text/javascript">
	/* 게시글 수정, 삭제 */
	function resellModifyForm(){
		/* 게시글 수정 페이지 이동  */
		let modifyCheck = 'MODIFY';
		location.href="loadToResellModifyForm?ubcode="+ubcode+"&ubsellbuy="+ubsellbuy+"&modifyCheck="+modifyCheck;
	}
	
	function ubDeleteCheckModal(){
		/* 게시글 삭제버튼 클릭 시 모달 출력 */
		$("#ubDeleteCheckModal").modal('show');
	}
	function updateResellDelete(){
		/* 게시글 삭제(상태변경) */
		//모달창에서 "네" 버튼 클릭 시 삭제
		location.href="updateResellDelete?ubcode="+ubcode+"&ubsellbuy="+ubsellbuy;
	}
	
</script>


</html>
