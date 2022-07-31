<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 사구게시판</title>

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

#regionList {
	width: 100%;
	height: 100%;
	margin: 50px auto;
	padding-top: 10px;
	overflow: hidden;
	padding-top: 10px;
}

#pageList button {
	display: none;
}

label {
	cursor: pointer;
}

.float_ {
	width: 33.3333333%;
	float: left;
	margin-bottom: 30px;
	margin-top: 30px;
}

.float_ img {
	width: 90%;
	height: 400px;
	border-radius: 20px;
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

.searchType_ {
	text-align: center;
	border-radius: 5px;
	font-size: 18px;
	border: solid 1px #00bcd4;
}

#inputSearchText {
	font-size: 18px;
}

.bigger { font-size: 2rem; }
.medium { font-size : 1.5rem;}

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
	margin-top: 10px;
	background-color: #00bcd4;
	margin-left: 0%;
	margin-right: 0%;
	height: 3.2rem;
}

div.col.mb-2 span.mainMsg {
	color: white;
		font-weight: bold; 
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

.btn-numberone{
	/* 글쓰기 버튼 */
	background-color: #00bcd4;
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

			<div
				class="container"
				style="margin-top: 10px"
			>
				<!-- <h1 class="text-center">중고거래 사구 페이지</h1> -->
				<!-- 페이지 제목 -->
				<div class="checkout__form " style="margin-top: 30px;">${paging.keyword} 님의 상품보기</div>

				 <!-- 거래완료 --> 
				<div class="row sellbuyhead">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<span style="font-size: 2.0rem; float:left;" id="transactionMsg_total" class="mainMsg">전체</span>
						&nbsp;&nbsp;<span style="font-size: 2.0rem;" id=transactionMsg_trading>거래중</span>
						&nbsp;&nbsp;<span style="font-size: 2.0rem;" id="transactionMsg_completed">거래완료</span>
					<div style="clear: left;"></div>
					</div>
				</div>
				<div id="regionList">
					<!-- ajax 출력 시작지점  -->


<!-- 전체 --> 

					<div id="totalList" class = "">
						<c:forEach items="${member_transactionList}" var="transactionList">
							<div class="float_">
								<div id="sellbuyscreen">
									<a onclick="laodToView('${transactionList.ubcode }')" href="javascript:void(0);"> <img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${transactionList.ubmainimg }">
									</a>

								</div>
								<div class="bottom" style="font-weight: 600; position: relative;">
									<span class="soldCheckMsg_ bold"></span> <a onclick="laodToView('${transactionList.ubcode }')" href="javascript:void(0);">${transactionList.ubtitle }</a>
								</div>

								<div style="height: 2rem; font-size: 1.6rem; padding: 0; color: grey;">${transactionList.ubdatedef }&nbsp;

									<span style="color: red; font-size: 1.8rem;" onclick="clickZzim('${transactionList.ubcode }')" id="zzimCheck_${transactionList.ubcode }"> <c:choose>
											<c:when test="${transactionList.zzimcheck != null }">
												<i id="zzimState_${transactionList.ubcode }" class='fa-heart fa-solid'></i>
											</c:when>
											<c:otherwise>
												<i id="zzimState_${transactionList.ubcode }" class='fa-heart fa-regular'></i>
											</c:otherwise>
										</c:choose>
									</span> <span style="color: initial; font-size: 1.8rem;" id="zzimCount_${transactionList.ubcode }"> ${transactionList.ubzzim } </span>


								</div>
								<div class="bottom" style="font-size: 1.7rem; font-weight: 600; position: relative;">
									<span onclick="writeMemberSellbuy('${transactionList.ubnickname }')" style="height: 1.8rem; font-size: 1.6rem; padding: 0; color: initial; cursor: pointer;">${transactionList.ubnickname }</span>
								</div>
								<input type="hidden" class="ubstate_" value="${transactionList.ubstate }">
							</div>
						</c:forEach>

						<div style="height: 20px; float: left; width: 33.3333333%;"></div>
					</div>
<!-- 거래중 -->


					<div id="tradingList" class = "d_none">
					
						<c:forEach items="${member_transactionList}" var="transactionList">
					
					<c:if test="${transactionList.ubstate == 1}">					
					
							<div class="float_">
								<div id="sellbuyscreen">
									<a onclick="laodToView('${transactionList.ubcode }')" href="javascript:void(0);"> <img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${transactionList.ubmainimg }">
									</a>

								</div>
								<div class="bottom" style="font-weight: 600; position: relative;">
									<span class="soldCheckMsg_ bold"></span> <a onclick="laodToView('${transactionList.ubcode }')" href="javascript:void(0);">${transactionList.ubtitle }</a>
								</div>

								<div style="height: 2rem; font-size: 1.6rem; padding: 0; color: grey;">${transactionList.ubdatedef }&nbsp;

									<span style="color: red; font-size: 1.8rem;" onclick="clickZzim('${transactionList.ubcode }')" id="zzimCheck_${transactionList.ubcode }"> <c:choose>
											<c:when test="${transactionList.zzimcheck != null }">
												<i id="zzimState_${transactionList.ubcode }" class='fa-heart fa-solid'></i>
											</c:when>
											<c:otherwise>
												<i id="zzimState_${transactionList.ubcode }" class='fa-heart fa-regular'></i>
											</c:otherwise>
										</c:choose>
									</span> <span style="color: initial; font-size: 1.8rem;" id="zzimCount_${transactionList.ubcode }"> ${transactionList.ubzzim } </span>


								</div>
								<div class="bottom" style="font-size: 1.7rem; font-weight: 600; position: relative;">
									<span onclick="writeMemberSellbuy('${transactionList.ubnickname }')" style="height: 1.8rem; font-size: 1.6rem; padding: 0; color: initial; cursor: pointer;">${transactionList.ubnickname }</span>
								</div>
								<input type="hidden" class="ubstate_" value="${transactionList.ubstate }">
							</div>
							</c:if>
													</c:forEach>

						<div style="height: 20px; float: left; width: 33.3333333%;"></div>
					</div>

<!-- 거래완료 -->

				<div id="completedList" class = "d_none">
					
						<c:forEach items="${member_transactionList}" var="transactionList">
					
					<c:if test="${transactionList.ubstate == 9}">					
					
							<div class="float_">
								<div id="sellbuyscreen">
									<a onclick="laodToView('${transactionList.ubcode }')" href="javascript:void(0);"> <img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${transactionList.ubmainimg }">
									</a>

								</div>
								<div class="bottom" style="font-weight: 600; position: relative;">
									<span class="soldCheckMsg_ bold"></span> <a onclick="laodToView('${transactionList.ubcode }')" href="javascript:void(0);">${transactionList.ubtitle }</a>
								</div>

								<div style="height: 2rem; font-size: 1.6rem; padding: 0; color: grey;">${transactionList.ubdatedef }&nbsp;

									<span style="color: red; font-size: 1.8rem;" onclick="clickZzim('${transactionList.ubcode }')" id="zzimCheck_${transactionList.ubcode }"> <c:choose>
											<c:when test="${transactionList.zzimcheck != null }">
												<i id="zzimState_${transactionList.ubcode }" class='fa-heart fa-solid'></i>
											</c:when>
											<c:otherwise>
												<i id="zzimState_${transactionList.ubcode }" class='fa-heart fa-regular'></i>
											</c:otherwise>
										</c:choose>
									</span> <span style="color: initial; font-size: 1.8rem;" id="zzimCount_${transactionList.ubcode }"> ${transactionList.ubzzim } </span>


								</div>
								<div class="bottom" style="font-size: 1.7rem; font-weight: 600; position: relative;">
									<span onclick="writeMemberSellbuy('${transactionList.ubnickname }')" style="height: 1.8rem; font-size: 1.6rem; padding: 0; color: initial; cursor: pointer;">${transactionList.ubnickname }</span>
								</div>
								<input type="hidden" class="ubstate_" value="${transactionList.ubstate }">
							</div>
							</c:if>
													</c:forEach>

						<div style="height: 20px; float: left; width: 33.3333333%;"></div>
					</div>











				</div>
				<div style="clear: left;"></div>
				<!-- 글목록 끝-->




				<!-- 페이지 번호 출력 -->

				<input type="hidden" id="pageNum" name="page" value="1">
				<div class="block text-center" id="pageList">
					<ul class="pagination">
						<c:choose>
							<c:when test="${paging.prev }">
								<li class="paginate_button"><a onclick="paginationBtn('${paging.page-1 }')" href="javascript:void(0);">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button"><span>이전</span></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" step="1">
							<c:choose>
								<c:when test="${paging.page == num }">
									<li class=""><a class="active">${num }</a></li>
								</c:when>
								<c:otherwise>
									<li class="paginate_button "><a onclick="paginationBtn('${num}')" href="javascript:void(0);">${num }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${paging.next }">
								<li class="paginate_button"><a onclick="paginationBtn('${paging.page+1 }')" href="javascript:void(0);">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button"><span>다음</span></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- 페이지 번호 출력 -->



			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">

	//글작성 후 페이지 이동했을 때 출력 메시지
	const checkMsg = '${msg}';
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}

	// 로컬스토리지 초기화
	let storage = window.localStorage;
	console.log('스토리지아이템갯수', storage.length); //현재 로컬스토리지에 저장된 아이템 갯수
	

	// 페이지로드 시 거래완료된 글 확인
	window.onload = function() {
		soldCheck();
	}

	/* 로컬스토리지 아이템 확인 */
	if (storage.getItem('searchType') != null) {
		console.log('로컬스토리지 검색타입 : ', storage.getItem('searchType'));
		storage.removeItem('searchType');
	}
	if (storage.getItem('keyword') != null) {
		console.log('로컬스토리지 검색어 : ', storage.getItem('keyword'));
		storage.removeItem('keyword');
	}
	if (storage.getItem('selRegion') != null) {
		console.log('로컬스토리지 선택지역 : ', storage.getItem('selRegion'));
		storage.removeItem('selRegion');
	}
	if (storage.getItem('page') != null) {
		console.log('로컬스토리지 페이지번호 : ', storage.getItem('page'));
		storage.removeItem('page');
	}

	storage.setItem('page', '1'); //페이지번호 기본값 1
</script>


<script type="text/javascript">

	const memberId = '${sessionScope.loginId}';
	const ubstate = document.querySelectorAll('.ubstate_');
	
	

	let soldCheckMsg = document.querySelectorAll('.soldCheckMsg_');

</script>

<!-- 전체, 거래중, 거래완료 선택 -->
<script type="text/javascript">

/* 전체, 거래중, 거래완료 Text 출력용 태그  */
const transactionMsg_total = document.getElementById('transactionMsg_total');	// 전체 MSG
const transactionMsg_trading = document.getElementById('transactionMsg_trading');	// 거래중 MSG 
const transactionMsg_completed = document.getElementById('transactionMsg_completed');	// 서브 MSG 

/* 태그의 d_none 클래스 제거를 위한 id */
const totalList = document.getElementById('totalList');		//전체 출력 div
const completedList	= document.getElementById('completedList');		//거래중 출력 div
const tradingList = document.getElementById('tradingList');			// 거래완료 출력 div


/* 전체, 거래중, 거래완료 이벤트 */
transactionMsg_total.addEventListener('click', () => showList(totalList));
transactionMsg_trading.addEventListener('click', () => 	showList(tradingList));
transactionMsg_completed.addEventListener('click', () => showList(completedList));

/*  전체, 거래중, 거래완료 이벤트 핸들러 */
function showList(list_Tag){
	console.log(list_Tag);
				
	switch (list_Tag) {
	
	case totalList : totalList.classList.remove('d_none');
					 transactionMsg_total.classList.add('mainMsg');
	
				     completedList.classList.add('d_none');
					 tradingList.classList.add('d_none');
					 
					 transactionMsg_completed.classList.remove('mainMsg');
					 transactionMsg_trading.classList.remove('mainMsg');
					 					 					
		break;
	case completedList : completedList.classList.remove('d_none');
						 transactionMsg_completed.classList.add('mainMsg');
						 
						 totalList.classList.add('d_none');
						 tradingList.classList.add('d_none');
						 
						 transactionMsg_total.classList.remove('mainMsg');
						 transactionMsg_trading.classList.remove('mainMsg');
		break;
		
	case tradingList :   tradingList.classList.remove('d_none');
					     transactionMsg_trading.classList.add('mainMsg');
	
						 completedList.classList.add('d_none');
						 totalList.classList.add('d_none');
						 
						 transactionMsg_completed.classList.remove('mainMsg');
						 transactionMsg_total.classList.remove('mainMsg');						 
		break;				
	}
}

</script>

<!-- 페이지이동시 상세페이지에서 글목록으로 돌아올 때 필요한 값 저장. -->
<script type="text/javascript">
/* 페이지 이동 시 현재 페이지 정보 저장을 위한 이벤트 핸들러 */
  
 /* 페이지 번호저장. */
	function paginationBtn(pageNum) {
		storage.setItem('page', pageNum); // 로컬스토리지 페이지번호 저장

		location.href = "selectResellPageList?page=" + pageNum + "&sellBuy=B";
	}

/* 상세페이지 클릭시 선택되어있는 검색타입, 검색어 */
	
	function laodToView(ubcode) {
		storage.setItem('searchType', 'ubmid'); // 로컬스토리지 검색타입 저장
		storage.setItem('keyword', document.getElementById("keyword").value); // 로컬스토리지 검색어 저장

		location.href = "selectResellView?ubcode=" + ubcode
				+ "&ubsellbuy=B&modifyCheck=LIST";
	}
	


</script>


<script type="text/javascript">
	/* 거래완료 글 체크표시  */
	function soldCheck() {
		for (let i = 0; i < ubstate.length; i++) {
			if (ubstate[i].value === '9') {
				
				console.log("거래완료글확인")
				soldCheckMsg[i].textContent = "(거래완료) "

			}
		}
	}
</script>


<script type="text/javascript">
    /* 메인에서 찜 버튼 클릭 */ 
	function clickZzim(ubcode) {
    	
    	console.log(ubcode);
		var loginId = '${loginId}';
		
		//로그인 체크
		if('${loginId}'.length == 0){
			 alert("script-로그인 후 이용가능합니다");
		}
		
		//찜 체크
		var zzim_Check;
		console.log($("#zzimState_"+ubcode).attr("class")[12]);
		//현재 찜상태 s:찜O r:찜X
		var zzimState = $("#zzimState_"+ubcode).attr("class")[12];
		if(zzimState == 's'){
			//현재 찜이 되어 있는 경우
			console.log("zzim O")
			zzim_Check = 'CHECK';
		} else {			
			//현재 찜이 안되어 경우
			console.log("zzim X")
			zzim_Check = 'UNCHECK';
		}
    	
		var zzimCount = $("#zzimCount_"+ubcode).text().trim();
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
					$("#zzimState_"+ubcode).removeClass("fa-regular").addClass("fa-solid");

					//증가
					console.log("증가 요청");
					if(zzimCount==0){
						zzimCount = 1;
					} else {
						zzimCount = parseInt(zzimCount)+1;
					}

				} else { //찜 취소했을 때
					//하트 비우기
					$("#zzimState_"+ubcode).removeClass("fa-solid").addClass("fa-regular");		
				
					//감소				
					console.log("감소 요청");
					zzimCount = parseInt(zzimCount)-1;

				}
					$("#zzimCount_"+ubcode).text(zzimCount);
			}
		})
	}
      
</script>

</html>