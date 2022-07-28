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
				<div class="checkout__form" style="margin-top: 30px;">중고거래 - 사구</div>


				<!-- 검색기능시작 -->

				<div class="row" style="margin-top: 40px">

					<div class="col-5" align="right">
						<select class="bigger searchType_" id="searchType">
							<option value="ubtitle">제목</option>
							<option value="ubcontents">내용</option>
							<option value="total">제목+내용</option>
							<option value="ubmid">작성자</option>
						</select>
					</div>
					<div class="col-7 ">
						<input
							type="text"
							class="bigger"
							placeholder="검색어를 입력하세요"
							id="keyword"
						> &nbsp;
						<button
							class="btn btn-secondary medium"
							onclick="selectRegion(1)"
						>검색</button> &nbsp;
						<c:if test="${sessionScope.loginId != null}">
							<button
								type="button"
								class="btn medium btn-numberone"
								onclick="loadToWrite()"
							>글쓰기</button>

						</c:if>
					</div>
				</div>
				<!-- 검색기능끝 -->


				<!-- 지역선택 -->
				<div class="row" style="margin-top: 20px;">

					<div class="col">
						<select class="bdCategoryList" onchange="selectRegion(1)" id="regionInfo">
							<option value="all">전국</option>
							<option value="SEL">서울</option>
							<option value="ICN">인천</option>
							<option value="GGD">경기</option>
							<option value="GWD">강원</option>
							<option value="CCD">충청</option>
							<option value="JLD">전라</option>
							<option value="GSD">경상</option>
							<option value="JJD">제주</option>
						</select>
					</div>
				</div>

				<!-- 지역선택 끝 -->

				<!-- 글목록 -->

				<div class="row sellbuyhead">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">사구</h3>
					</div>
				</div>
				<div id="regionList">
					<!-- ajax 출력 시작지점  -->

					<div id="sellList">
						<c:forEach items="${sell_buyList}" var="buyList">
							<div class="float_">
								<div id="sellbuyscreen">
									<a onclick="laodToView('${buyList.ubcode }')" href="javascript:void(0);"> <img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${buyList.ubmainimg }">
									</a>

								</div>
								<div class="bottom" style="font-weight: 600; position: relative;">
									<span class="soldCheckMsg_ bold"></span> <a onclick="laodToView('${buyList.ubcode }')" href="javascript:void(0);">${buyList.ubtitle }</a>
								</div>

								<div style="height: 2rem; font-size: 1.6rem; padding: 0; color: grey;">${buyList.ubdatedef }&nbsp;

									<span style="color: red; font-size: 1.8rem;" onclick="clickZzim('${buyList.ubcode }')" id="zzimCheck_${buyList.ubcode }"> <c:choose>
											<c:when test="${buyList.zzimcheck != null }">
												<i id="zzimState_${buyList.ubcode }" class='fa-heart fa-solid'></i>
											</c:when>
											<c:otherwise>
												<i id="zzimState_${buyList.ubcode }" class='fa-heart fa-regular'></i>
											</c:otherwise>
										</c:choose>
									</span> <span style="color: initial; font-size: 1.8rem;" id="zzimCount_${buyList.ubcode }"> ${buyList.ubzzim } </span>


								</div>
								<div class="bottom" style="font-size: 1.7rem; font-weight: 600; position: relative;">
									<span onclick="writeMemberSellbuy('${buyList.ubnickname }')" style="height: 1.8rem; font-size: 1.6rem; padding: 0; color: initial; cursor: pointer;">${buyList.ubnickname }</span>
								</div>
								<input type="hidden" class="ubstate_" value="${buyList.ubstate }">
							</div>
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
	const selectRegion_param = '${paging.searchVal}';
	const searchedKeyword_param = '${paging.keyword}';
	const searchedType_param = '${paging.searchType}';

	const memberRegion = '${sessionScope.loginRegion}';
	const memberId = '${sessionScope.loginId}';
	const checkSearch = '${checkSearch}'; //검색확인용	
	const ubstate = document.querySelectorAll('.ubstate_');
	
	let regionInfo = document.getElementById("regionInfo");
	let searchInfo = document.getElementById("searchType");
	

	let selRegion = regionInfo.value;	// 현재 선택되어있는 지역
	
	


	let soldCheckMsg = document.querySelectorAll('.soldCheckMsg_');

	console.log("체크메세지", checkSearch);

	if (checkSearch === 'write') { //글 작성 후 이동해왔을 시 [전국]으로 selected 하기위한 코드

		console.log("체크메세지 : ", checkSearch);
		regionInfo.options[0].selected = "true"; //0번인덱스가 [전국]
	}

	else { // 단순 페이지이동 ( 메인페이지에서 더보기 클릭 , 상세페이지에서 글목록 클릭, 사이드바에서 클릭)
		//checkSearch의 값이 'NO' 일 경우
		console.log('체크메세지 : NO')

		console.log('지역확인 : ', selectRegion_param);
		console.log('검색어확인 : ', searchedKeyword_param);
		console.log('검색타입확인 : ', searchedType_param);

		if (selectRegion_param != null) {
			/* 페이지에 지역파라메터가 있다면 실행 : 파라메터와 일치하는 option에 selected*/

			for (let i = 0; i < regionInfo.options.length; i++) {
				if (regionInfo.options[i].value === selectRegion_param) {
					regionInfo.options[i].selected = 'true';
					break;
				}
			}
		}

		if (searchedKeyword_param != null) {
			/* 페이지에 검색어파라메터가 있다면 실행 : 검색input에 검색어출력*/

			document.getElementById('keyword').value = searchedKeyword_param;

		}

		if (searchedType_param != null) {
			/* 페이지에 검색타입파라메터가 있다면 실행 : 파라메터와 일치하는 option에 selected */
			
			for (let i = 0; i < searchInfo.options.length; i++) {
				if (searchInfo.options[i].value === searchedType_param) {
					searchInfo.options[i].selected = 'true';
					break;
				}
			}
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

/* 상세페이지 클릭시 선택되어있는 검색타입, 검색어, 지역 저장 */
	
	function laodToView(ubcode) {
		storage.setItem('searchType',
				document.getElementById("searchType").value); // 로컬스토리지 검색타입 저장
		storage.setItem('keyword', document.getElementById("keyword").value); // 로컬스토리지 검색어 저장
		storage.setItem('selRegion',
				regionInfo.value); // 로컬스토리지 선택지역 저장

		location.href = "selectResellView?ubcode=" + ubcode
				+ "&ubsellbuy=B&modifyCheck=LIST";
	}
	
	/* 글쓰기 버튼 클릭시 선택되어있는 검색타입, 검색어, 지역 저장*/
	function loadToWrite(){
		storage.setItem('searchType',
				document.getElementById("searchType").value); 
		storage.setItem('keyword', document.getElementById("keyword").value); 
		storage.setItem('selRegion',
				regionInfo.value); 

		location.href = "loadToResellWriteForm?ubsellbuy=B&ubrgcode="+regionInfo.value;
	}	
</script>


<!-- 지역선택, 검색 스크립트 -->
<script type="text/javascript">
	/* 지역선택, 검색 이벤트  */

	/* ajax를 위한 객체 생성 */
	let paging = {
		"keyword" : '',
		"searchVal" : '',
		"sellBuy" : 'B',
		"ajaxCheck" : '',
		"page" : '1',
		"searchType" : ''
	};

	function selectRegion(page) {
		console.log("selectRegion이벤트 호출");

		/* 객체에 이벤트가 실행되었을 때의 데이터를 저장  */
		paging.searchType = document.getElementById("searchType").value;
		paging.keyword = document.getElementById("keyword").value;
		paging.searchVal = regionInfo.value;
		paging.page = page;
		paging.ajaxCheck = 'REGION'

		/* 객체 데이터확인 */
		console.log('======================');
		console.log('검색');
		console.log('검색어 : ', paging.keyword);
		console.log('검색타입 : ', paging.searchType);
		console.log("선택된 지역 : ", paging.searchVal);
		console.log("페이지번호 : ", paging.page);
		console.log('======================');

		/* 로컬스토리지 데이터 저장(글 목록을 select하기위해 필요한 데이터들) */
	storage.setItem('searchType',
			paging.searchType); // 로컬스토리지 검색타입 저장
		storage.setItem('keyword', paging.keyword); // 로컬스토리지 검색어 저장
		storage.setItem('selRegion',
				paging.searchVal); // 로컬스토리지 선택지역 저장
		storage.setItem('page', paging.page); // 로컬스토리지 페이지번호 저장

		//ajax를 통해 선택된 지역의 목록을 가져온다.		
		$.ajax({
			type : "get",
			url : "selectResellRegionList_ajax",
			dataType : "json",
			async : false,
			data : paging,
			success : function(result) {
				output_page = '';
				console.log("결과 : " + result);
				listOutput(result); //목록 출력용 함수
				document.getElementById("regionList").innerHTML = output_page;
			}

		})
		/* ajax의 data 는 data : 객체,   를 보내는 형식인데, paging 자체가 객체이므로 변수명만 작성해줘야 값이 전송된다.  */

		////////////////////////* 페이지네이션 ajax *//////////////////////////

		// ajax체크메세지 저장. (페이지번호출력을 위한 ajax인지, 지역목록출력을 위한 ajax 인지 구분하기위해)
		paging.ajaxCheck = 'PAGE';

		$.ajax({ // 페이지 번호 출력용 ajax
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					async : false,
					data : paging,
					success : function(result) {
						console.log("결과페이지 : " + result.page);

						let output_pageNum = "<ul class='pagination'>";
						if (result.prev) {
							output_pageNum += '<li class=\"paginate_button\"> <a href=\"javascript:void(0);\" onclick=\"selectRegion('
									+ (result.page - 1)
									+ ')\">이전</a></button>';
						} else {
							output_pageNum += "<li class='paginate_button'><span>이전</span></li>";
						}
						for (var i = result.startPage; i <= result.endPage; i++) {

							if (result.page == i) {
								output_pageNum += '<li><a class=\"active\">'
										+ i + '</a></li>';
							} else {
								output_pageNum += '<li class=\"paginate_button\"><a href=\"javascript:void(0);\" onclick=\"selectRegion('
										+ i + ')\">' + i + '</a></li>';
							}
						}
						if (result.next) {
							output_pageNum += '<li class=\"paginate_button\"><a href=\"javascript:void(0);\" onclick=\"selectRegion('
									+ (result.page + 1) + ')\">다음</a></li>';
						} else {
							output_pageNum += '<li class=\"paginate_button\"><span>다음</span></li>'
						}
						document.getElementById("pageList").innerHTML = output_pageNum;
					}
				})
	}
</script>


<!-- ajax에 사용되는  페이지출력을 위한 스크립트 -->
<script type="text/javascript">
	/* ajax에 사용되는 글 목록 출력 함수 */
	function listOutput(result) {

		for ( let i in result) {

			output_page += '<div id=\"sellList\"><div class=\"float_\">'
					+ '<div id=\"sellbuyscreen\">'
					+ '<a href=\"selectResellView?ubcode='
					+ result[i].ubcode
					+ '&ubsellbuy='
					+ result[i].ubsellbuy
					+ '&modifyCheck=LIST\">'
					+ '<img alt=\"이미지\" src=\"${pageContext.request.contextPath }/resources/img/resell/'+result[i].ubmainimg+'\">'
					+ '</a>'
					+ '</div>'
					+ '<div class=\"bottom\" style=\"font-weight:600; position:relative;\">'
					+ '<span class=\"soldCheckMsg_ bold\"></span>'
					+ '<a href=\"selectResellView?ubcode='
					+ result[i].ubcode
					+ '&ubsellbuy='
					+ result[i].ubsellbuy
					+ '&modifyCheck=LIST\">'
					+ result[i].ubtitle
					+ '</a>'
					+ '</div>'
					+ '<div style=\"height:2rem; font-size:1.6rem; padding:0; color:grey;\">'
					+ result[i].ubdatedef
					+ '&nbsp'
					+ '<span style=\"color:red; font-size:1.8rem;\">'
					+ '<i class=\"fa-regular fa-heart\"></i>'
					+ '</span>'
					+ '</div>'
					+ '<div class=\"bottom\" style=\"font-size:1.7rem; font-weight:600; position:relative;\">'
					+ '<span onclick=\"writeMemberSellbuy('
					+ result[i].ubnickname
					+ ')\" style=\"height:1.8rem; font-size:1.6rem; padding:0; color:initial; cursor:pointer;\">'
					+ result[i].ubnickname
					+ '</span>'
					+ '</div>'
					+ '<input type=\"hidden\" class=\"ubstate_\" value=\"'+result[i].ubstate+'\">'
					+ '</div>';
		}
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