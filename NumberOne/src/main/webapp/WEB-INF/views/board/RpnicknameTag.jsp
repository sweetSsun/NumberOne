<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 작성글 조회</title>

<!-- BarCss 삭제 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listCss.css" type="text/css">

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#pageList button {
	display: none;
}

label {
	cursor: pointer;
}

section {
	max-width: 70%;
	margin: auto;
	margin-top: 0%;
}

.d_none {
	display: none;
}

.scroll::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
	cursor: default;
}

.scroll::-webkit-scrollbar-thumb {
	height: 5%; /* 스크롤바의 길이 */
	background: #999999; /* 스크롤바의 색상 */
	border-radius: 10px;
}

.scroll::-webkit-scrollbar-track {
	background: #EAEAEA; /*스크롤바 뒷 배경 색상*/
}

.bdcategory {
	color: #00bcd4;
}

.bdCategoryList {
	color: #00bcd4;
	border: none;
	font-size: 18px;
}

.bdcategorySel {
	font-weight: bold;
	text-align: center;
	color: #00bcd4;
}

input {
	border-radius: 3px;
	border: solid #E0E0E0 2px;
	height: 28px;
	font-size: 20px;
}

.searchType {
	text-align: center;
	border-radius: 5px;
	font-size: 18px;
	border: solid 1px #00bcd4;
}

#inputSearchText {
	font-size: 18px;
}

.pagination {
	width: 20rem ! important;
	display: inline-block ! important;
	margin-left: auto ! important;
	margin-right: auto ! important;
	margin-top: 1rem ! important;
	font-size: 18px ! important;
}

.pagination a {
	color: black ! important;
	padding: 6px 12px ! important;
	text-decoration: none ! important;
	border-radius: 5px ! important;
}

.pagination span {
	color: black ! important;
	padding: 6px 12px ! important;
	text-decoration: none ! important;
	border-radius: 5px ! important;
}

.pagination a.active {
	background-color: #00bcd4 ! important;
	border-radius: 5px ! important;
	color: white ! important;
}

.bigger {
	font-size: 2rem;
}

.bdCategoryList {
	color: #00bcd4;
	border: none;
	font-size: 18px;
	margin-left: 2%;
}

.bdcategorySel {
	font-weight: bold;
	text-align: center;
	color: #00bcd4;
}

.bold {
	font-weight: bold;
}

/* List CSS */
#regionList {
	width: 100%;
	height: 100%;
	margin: auto;
	padding-top: 10px;
	overflow: hidden;
	padding-top: 10px;
}

div.row.sellbuyhead {
	margin-top: 2 rem;
	background-color: #00bcd4;
	margin-left: 0%;
	margin-right: 0%;
	height: 3.2rem;
}

div.col.mb-2 h3 {
	color: white;
}

.float_ {
	width: 33.3333333%;
	height: 40rem;
	float: left;
	padding: 1%;
}

#sellbuyscreen {
	width: 100%;
	height: 34rem;
	margin-bottom: 10px;
}

#sellbuyscreen>a>img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	object-fit: cover;
}

.bottom {
	font-size: 2rem;
	padding: 0px;
	margin: 0px 0px;
	width: 100%;
	height: 2.4rem;
	overflow: hidden;
	color: initial;
}

#sellList, #buyList {
	height: 43rem;
	/* border : 1px solid  #00bcd4; */
}

section div.checkout__form{
	/* 페이지 제목 */
	color: #1c1c1c; 
    font-weight: 700; 
    border-bottom: 1px solid #e1e1e1;
    padding-bottom: 20px;
    margin-bottom: 25px;
    font-size : 24px;
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
		<!-- 사이드바 End-->
					
	<section>
		<!-- 페이지명 -->
		<div class="checkout__form" style="margin-top: 30px;">작성글 조회</div> 
	

				<!--roomlist div 시작  -->
				<div class="row sellbuyhead">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">자취방 자랑게시판</h3>
					</div>
					<div align="right" class="col" style="padding-top: 0.45rem;">
						<span style="font-size: 1.6rem;"> <a href="#" style="color: gold !important; font-weight: bold;"><i class="fa-solid fa-square-plus"></i>&nbsp;&nbsp;더보기</a></span>
					</div>
				</div>
				
				<div id="roomList">
					<c:forEach items="${roomList}" var="room">
						<div class="float_">
							<div id="sellbuyscreen">
								
							<c:choose>
								<c:when test="${room.bdimg != null}">
									<a href="#"> <img alt="" src="${pageContext.request.contextPath }/resources/img/room/${room.bdimg }">
									</a>
									</c:when>
									
									<c:otherwise>
										<a href="#">  <img alt="" src="${pageContext.request.contextPath }/resources/img/logo_bada.png">
									</a>
									
									</c:otherwise>
							</c:choose>
							</div>
						<div class="bottom" style="font-weight:600; position:relative;">
							<span class="soldCheckMsg_ bold"></span>
							<a href="#">${room.bdtitle }</a>
						</div>
						<div style="height:2rem; font-size:1.6rem; padding:0; color:grey;">${room.bddate }&nbsp;
							<span style="color:red; font-size:1.8rem;" onclick="clickZzim('${room.bdcode }')" id="zzimCheck_${room.bdcode }">
								<c:choose>
									<c:when test="${room.bdscrap != null }">
										<i id="zzimState_${room.bdcode }" class='fa-heart fa-solid'></i> 
									</c:when>
									<c:otherwise>
										<i id="zzimState_${room.bdcode }" class='fa-heart fa-regular'></i> 
									</c:otherwise>
								</c:choose>	
							</span>
							<span style="color:initial; font-size:1.8rem;" id="zzimCount_${room.bdcode }">
								${room.bdscrap } 
							</span>
						</div>
						<div class="bottom" style="font-size:1.7rem; font-weight:600; position:relative;">
							<span onclick="writeMemberSellbuy('${room.bdnickname }')" style="height:1.8rem; font-size:1.6rem; padding:0; color:initial; cursor:pointer;">${room.bdnickname }</span>
						</div>
					</div>
				</c:forEach>


					<div style="height: 20px; float: left; width: 33.3333333%;"></div>
				</div>
				<!--roomlist div 끝  -->

				

				<!--중고거래 div 시작  -->
				<div class="row sellbuyhead" style="clear: both; margin-top: 50px;">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">중고거래</h3>
					</div>
					<div align="right" class="col" style="padding-top: 0.45rem;">
						<span style="font-size: 17px;"> <a href="selectResellPageList?sellBuy=B&ajaxCheck=LIST" style="color: gold !important; font-weight: bold;"><i class="fa-solid fa-square-plus"></i>&nbsp;&nbsp;더보기</a></span>
					</div>
				</div>

				<div id="buyList">

					<c:forEach items="${resellList}" var="resell">
						<div class="float_">
							<div id="sellbuyscreen">
							<c:choose>
								<c:when test="${resell.ubmainimg != null}">
									<a href="selectResellView?ubcode=${resell.ubcode }&ubsellbuy=${resell.ubsellbuy }&modifyCheck=LIST"> <img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${resell.ubmainimg }">
									</a>
									</c:when>
									
									<c:otherwise>
										<a href="selectResellView?ubcode=${resell.ubcode }&ubsellbuy=${resell.ubsellbuy }&modifyCheck=LIST">  <img alt="" src="${pageContext.request.contextPath }/resources/img/logo_bada.png">
									</a>
									
									</c:otherwise>
							</c:choose>
							</div>
							<div class="bottom" style="font-weight: 600; position: relative;">
								<span class="soldCheckMsg_ bold"></span> <a href="selectResellView?ubcode=${resell.ubcode }&ubsellbuy=${resell.ubsellbuy }&modifyCheck=LIST">${resell.ubtitle }</a>
							</div>
							<div style="height: 2rem; font-size: 1.6rem; padding: 0; color: grey;">${resell.ubdatedef }&nbsp;
								<span style="color: red; font-size: 1.8rem;" onclick="clickZzim('${resell.ubcode }')" id="zzimCheck_${resell.ubcode }"> <c:choose>
										<c:when test="${sellList.zzimcheck != null }">
											<i id="zzimState_${resell.ubcode }" class='fa-solid fa-heart'></i>
										</c:when>
										<c:otherwise>
											<i id="zzimState_${resell.ubcode }" class='fa-regular fa-heart'></i>
										</c:otherwise>
									</c:choose>
								</span> <span style="color: initial; font-size: 1.8rem;" id="zzimCount_${resell.ubcode }"> ${resell.ubzzim } </span>
							</div>
							<div class="bottom" style="font-size: 1.7rem; font-weight: 600; position: relative;">
								<span onclick="writeMemberSellbuy('${resell.ubnickname }')" style="height: 1.8rem; font-size: 1.6rem; padding: 0; color: initial; cursor: pointer;">${resell.ubnickname }</span>
							</div>
							<input type="hidden" class="ubstate_" value="${resell.ubstate }">
						</div>

					</c:forEach>
					
					<div style="height: 20px; float: left; width: 33.3333333%;"></div>
				</div>
				<!-- 중고거래 div 끝 -->


				<!--일반게시판 div 시작  -->
				<div class="row sellbuyhead" style="clear: both; margin-top: 50px;">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">일반게시판</h3>
					</div>
					<div align="right" class="col" style="padding-top: 0.45rem;">
						<span style="font-size: 17px;"> <a href="selectResellPageList?sellBuy=B&ajaxCheck=LIST" style="color: gold !important; font-weight: bold;"><i class="fa-solid fa-square-plus"></i>&nbsp;&nbsp;더보기</a></span>
					</div>
				</div>

				<div class="row">
				<table class="boardList">
					<thead >
						<tr class="text-center" id="board_column">
							<td style="font-size: 17px;">글번호</td>
							<td style="font-size: 17px;">카테고리</td>
							<td style="font-size: 17px;">제목</td>
							<td style="font-size: 17px;">작성자</td>
							<td style="font-size: 17px;">날짜</td>
							<td style="font-size: 17px;">조회</td>
							<td style="font-size: 17px;">추천</td>
						</tr>
					</thead>
					
					<tbody id="bdCategoryList">
					<c:forEach items="${boardList }" var="board">
						<c:if test="${board.bdcategory != '자랑' }">
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td class="text-center tableCell">${board.bdcode}</td>
							<td class="bdcategory text-center tableCell">
								<a href="selectCategoryBoardList?searchVal=${board.bdcategory }">
									${board.bdcategory}
								</a>
							
							</td>
							<td class="tableCell">
								<c:choose>
									<c:when test="${board.bdcategory eq '후기'  }">
										<a href="selectReviewBoardView${paging.makeQueryPage(board.bdcode, paging.page) }">${board.bdtitle} 
									 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span> </a>
									</c:when>
									
									<c:otherwise>
									 	<a href="selectBoardView${paging.makeQueryPage(board.bdcode, paging.page)}">${board.bdtitle}
									 		<c:if test="${board.bdimg != null }">
									 		<i class="fa-regular fa-image"></i>
									 		</c:if>
									 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span> </a>
									</c:otherwise>
								</c:choose>
							 </td>
							<td class="text-center tableCell">
								<span style="cursor: pointer" class="bdnickname" onclick="writeMemberBoard('${board.bdnickname}')">${board.bdnickname}</span>
							</td>
							<td class="text-center tableCell" id="bddate">${board.bddate}</td>
							<td class="text-center tableCell">${board.bdhits }</td>
							<td class="fw-bold text-center tableCell" style="color: #00bcd4;">${board.bdrccount}</td>
						</tr>
						</c:if>
					</c:forEach>
					</tbody>
				</table>
				</div>
				<!-- 일반게시판 div 끝 -->
				


			


		</section>


	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>

<script type="text/javascript">

	var checkMsg = '${msg}';
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>

<script type="text/javascript">
	function searchKeyword() {
		var searchType = document.getElementById("searchType").value;
		console.log(searchType);
		var keyword = document.getElementById("keyword").value;
		console.log(keyword);
		if (searchType == 'sell') {
			location.href = "selectResellPageList?sellBuy=S&searchType="
					+ searchType + "&keyword=" + keyword;
		} else {
			location.href = "selectResellPageList?sellBuy=B&searchType="
					+ searchType + "&keyword=" + keyword;
			;
		}
	}

	/* 메인에서 찜 버튼 클릭 */
	function clickZzim(ubcode) {

		console.log(ubcode);
		var loginId = '${loginId}';

		//로그인 체크
		if ('${loginId}'.length == 0) {
			alert("script-로그인 후 이용가능합니다");
		}

		//찜 체크
		var zzim_Check;
		console.log($("#zzimState_" + ubcode).attr("class")[12]);
		//현재 찜상태 s:찜O r:찜X
		var zzimState = $("#zzimState_" + ubcode).attr("class")[12];
		if (zzimState == 's') {
			//현재 찜이 되어 있는 경우
			console.log("zzim O")
			zzim_Check = 'CHECK';
		} else {
			//현재 찜이 안되어 경우
			console.log("zzim X")
			zzim_Check = 'UNCHECK';
		}

		var zzimCount = $("#zzimCount_" + ubcode).text().trim();
		console.log(zzimCount);

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
					//하트 채우기
					$("#zzimState_" + ubcode).removeClass("fa-regular")
							.addClass("fa-solid");

					//증가
					console.log("증가 요청");
					if (zzimCount == 0) {
						zzimCount = 1;
					} else {
						zzimCount = parseInt(zzimCount) + 1;
					}

				} else { //찜 취소했을 때
					//하트 비우기
					$("#zzimState_" + ubcode).removeClass("fa-solid").addClass(
							"fa-regular");

					//감소				
					console.log("감소 요청");
					zzimCount = parseInt(zzimCount) - 1;

				}
				$("#zzimCount_" + ubcode).text(zzimCount);
			}
		})
	}
</script>

<script type="text/javascript">

	/* 거래완료 글 체크표시  */
	// 페이지로드 시 거래완료된 글 확인
	window.onload = function() {
		soldCheck();
	}
	const ubstate = document.querySelectorAll('.ubstate_');
	const soldCheckMsg = document.querySelectorAll('.soldCheckMsg_');
	function soldCheck() {
		for (let i = 0; i < ubstate.length; i++) {
			if (ubstate[i].value === '9') {

				console.log("거래완료글확인")
				soldCheckMsg[i].textContent = "(거래완료) "

			}
		}
	}

</script>

</html>