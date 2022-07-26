<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 팔구게시판</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"
	referrerpolicy="no-referrer"
></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"
>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">


<style type="text/css">
* {
	margin: 0;
	padding: 0;
}


#regionList {
	width: 100%;
	height: 100%; 
	margin: 50px auto; padding-top : 10px;
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

.searchType {
	text-align: center;
	border-radius: 5px;
	font-size: 18px;
	border: solid 1px #00bcd4;
}

#inputSearchText {
	font-size: 18px;
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
	padding-top : 10px;
	overflow: hidden;
	padding-top: 10px;
	
}

div.row.sellbuyhead{
	margin-top : 2 rem;
	background-color : #00bcd4;
	margin-left : 0%; 
	margin-right : 0%; 	
	height : 3.2rem;
}


div.col.mb-2 h3{ color : white; }

.float_ {
	width: 33.3333333%;
	height: 40rem;
	float: left;
	padding: 1%; 

}

#sellbuyscreen{
	width: 100%;
	height: 34rem;
	margin-bottom: 10px;
}

#sellbuyscreen > a > img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	object-fit:cover;
}

.bottom {
	font-size:2rem; 
	padding: 0px;
	margin: 0px 0px;
	width : 100%;
	height: 2.4rem;
	overflow: hidden;
	color: initial;
}

#sellList, #buyList{
	height : 43rem;
	/* border : 1px solid  #00bcd4; */
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
			<div class="container" style="margin-top: 50px">

	<h1 class="text-center">중고거래 사구 페이지</h1>
				<!--  -->
				<div class="row">
					<!-- 검색기능 -->
					<div
						class="col-5"
						align="right"
					>
						<select
							class="searchType bigger"
							id="searchType"
						>
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
							name="keyword"
							placeholder="검색어를 입력하세요"
							id="searchText"
						>
						<button
							class="btn btn-secondary bigger"
							onclick="searchE(1)"
						>검색</button>
						<c:if test="${sessionScope.loginId != null}">
							<button
								type="button"
								class="btn btn-primary bigger"
								style="padding: .25rem .5rem;"
								onclick="location.href='${pageContext.request.contextPath }/loadToResellWriteForm?sell_buy=B'"
							>글쓰기</button>
						</c:if>
					</div>
				</div>
		<div class="row" style="margin-top: 20px;">
					<div class="col">
					<select
						class="bdCategoryList"
						onchange="selectRegion(1)"
						
						id="regionInfo"
					>
						<option value="all">전국</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충청">충청</option>
						<option value="전라">전라</option>
						<option value="경상">경상</option>
						<option value="제주">제주</option>

					</select>
					</div>
				</div>
			</div>


			<!-- 글목록 -->

			<div id="regionList">

<div class="row sellbuyhead">
					<div class="col mb-2" style="padding-top:0.2rem;">
						<h3 style="font-size:2.3rem; font-weight:700;">사구</h3>
					</div>
					</div>
					
		<div id="buyList">
				
				<c:forEach items="${sell_buyList}" var="buyList">
					<div class="float_">
						<div id="sellbuyscreen">
							<a href="selectResellView?ubcode=${buyList.ubcode }&ubsellbuy=${buyList.ubsellbuy }&modifyCheck=LIST">
								<img
									alt=""
									src="${pageContext.request.contextPath }/resources/img/resell/${buyList.ubmainimg }"
								>
							</a>
						</div>
						<div class="bottom" style="font-weight:600; position:relative;">
							<span class="soldCheckMsg_ bold"></span>
							<a href="selectResellView?ubcode=${buyList.ubcode }&ubsellbuy=${buyList.ubsellbuy }&modifyCheck=LIST">${buyList.ubtitle }</a>
						</div>
						<div style="height:2rem; font-size:1.6rem; padding:0; color:grey;">${buyList.ubdatedef }&nbsp;
							<span style="color:red; font-size:1.8rem;">
								<i class='fa-regular fa-heart'></i>
							</span>
						</div>
						<div class="bottom" style="font-size:1.7rem; font-weight:600; position:relative;">
							<span onclick="writeMemberSellbuy('${buyList.ubnickname }')" style="height:1.8rem; font-size:1.6rem; padding:0; color:initial; cursor:pointer;">${buyList.ubnickname }</span>
						</div>
						<input
							type="hidden"
							class="ubstate_"
							value="1"
						>
					</div>
					
				</c:forEach>
						
			</div>
			</div>
			<div style="clear: left;"></div>


			<!-- 페이지  -->
			<input
				type="hidden"
				id="pageNum"
				name="page"
				value="1"
			>
			<div
				class="block text-center"
				id="pageList"
			>
				<ul class="pagination">
					<c:choose>
						<c:when test="${paging.prev }">
							<li class="paginate_button"><a href="selectResellPageList?page=${paging.page-1 }&sellBuy=S">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><span>이전</span></li>
						</c:otherwise>
					</c:choose>

					<c:forEach
						begin="${paging.startPage }"
						end="${paging.endPage }"
						var="num"
						step="1"
					>
						<c:choose>
							<c:when test="${paging.page == num }">
								<li class=""><a class="active">${num }</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button "><a href="selectResellPageList?page=${num}&sellBuy=S">${num }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${paging.next }">
							<li class="paginate_button"><a href="selectResellPageList?page=${paging.page+1 }&sellBuy=S">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><span>다음</span></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

			<!-- 팔구div끝  -->


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
	const checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	window.onload = function() {
		soldCheck();
	}
</script>

<script type="text/javascript">

	const memberRegion = '${sessionScope.loginRegion}';
	const memberId = '${sessionScope.loginId}';
	const checkSearch = '${checkSearch}'; //검색확인용	
	const ubstate = document.querySelectorAll('.ubstate_');
	const searchType_main = '${paging.searchType}';  //매인에서 선택한 검색타입
	const keyword_main = '${paging.keyword}';		//메인에서 입력한 검색어
	
	
	let regionInfo = document.getElementById("regionInfo");
	let soldCheckMsg = document.querySelectorAll('.soldCheckMsg_');
	
	console.log("체크메세지", checkSearch);
	

	if (checkSearch === 'OK') { // 검색을 통해 페이지이동해 왔을 때 	
		console.log("메인페이지에서 검색");
	console.log('메인에서 선택한 검색타입 : ', searchType_main);
	console.log('메인에서 입력한 검색어 : ', keyword_main);
		keyword.value = keyword_main;
		
		for(let i=0; i< searchType.options.length; i++){
			if(searchType.options[i].value === searchType_main){
				searchType.options[i].selected = 'true';
				break;
			}			
		}		
	}

	else if (checkSearch === 'write') { //글 작성 후 이동해왔을 시 [전국]으로 selected 하기위한 코드
		
		console.log("글 작성");
		regionInfo.options[0].selected = "true"; //0번인덱스가 [전국]
	}

	else {
		//checkSearch의 값이 'OK' 가 아닐경우 선택된 지역이 없으므로, 페이지 접속 시 회원의 관심지역이 자동 선택되어 출력되도록 한다.	
		
		console.log("관심지역" + memberRegion);
		for (let i = 0; i < regionInfo.options.length; i++) {
			//select 태그가 갖고있는 option의 갯수(길이)만큼 반복문을 실행한다.
			if (regionInfo.options[i].value === memberRegion) {
				//option의 value 와 회원의 관심지역이 일치하는지 확인		
				regionInfo.options[i].selected = "true";
				// 일치하는 경우 그 option에 selected 속성을 주어 선택되도록 한다.
			}
		}
	}
</script>


<!-- 지역 검색 -->
<script type="text/javascript">
	
	var output_page = '';
	var output_pagerNum = '';

	/* 지역선택 이벤트  */

	function selectRegion(page) {
		console.log("selectRegion이벤트 호출");
		let searchType = document.getElementById("searchType").value;
		console.log('searchType : ',searchType);
		let keyword = document.getElementById("keyword").value;
		console.log('keyword : ', keyword);
		let selRegion = regionInfo.options[regionInfo.selectedIndex].value;
		console.log("selRegion : ", selRegion);
		//선택된 option의 value를 변수에 저장.
		$.ajax({ //ajax를 통해 선택된 지역의 목록을 가져온다.
			type : "get",
			url : "selectResellRegionList_ajax",
			dataType : "json",
			async : false,
			data : {
				"keyword" : keyword,
				"searchVal" : selRegion,
				"sellBuy" : 'B',
				"ajaxCheck" : 'REGION',
				"page" : page,
				"searchType" : searchType
			},
			success : function(result) {
				output_page = '';
				alert("성공");
				console.log("결과 : " + result);
				listOutput(result); //목록 출력용 함수
				document.getElementById("regionList").innerHTML = output_page;
			}

		})

		$
				.ajax({ // 페이지 번호 출력용 ajax
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					async : false,
					data : {
						"keyword" : keyword,
						"searchVal" : selRegion,
						"sellBuy" : 'B',
						"ajaxCheck" : 'PAGE',
						"page" : page,
						"searchType" : searchType
					},
					success : function(result) {
						alert("page_ajax");
						console.log("결과페이지 : " + result.page);
						
						let output_pageNum = "<ul class='pagination'>";
						if (result.prev) {
							output_pageNum += '<li class=\"paginate_button\" <a href=\"javascript:void(0);\" onclick=\"selectRegion('+ (result.page - 1) + ')\">[이전]</a></button>';
						} else {
							output_pageNum += "<li class='paginate_button'><span>이전</span></li>";
						}
						for (var i = result.startPage; i <= result.endPage; i++) {

							if (result.page == i) {
								output_pageNum +=  '<li><a class=\"active\">'+ i + '</a></li>';
							} else {
								output_pageNum += '<li class=\"paginate_button\"><a href=\"javascript:void(0);\" onclick=\"selectRegion('+ i + ')\">' + i + '</a></li>';
							}
						}
						if (result.next) {
							output_pageNum += '<li class=\"paginate_button\"><a href=\"javascript:void(0);\" onclick=\"selectRegion('+ (result.page + 1) + ')\">다음</a></li>';
								} 
						else {									
							output_pageNum += '<li class=\"paginate_button\"><span>다음</span></li>'
						}
						document.getElementById("pageList").innerHTML = output_pageNum;
					}
				})

	}
</script>

<!-- 검색 스크립트  -->
<script type="text/javascript">

 /* 검색버튼 클릭시 이벤트함수 */	 
function searchE(page){
console.log('searchE 호출 : ', searchE);	
let searchType = document.getElementById("searchType").value;
	console.log('searchType : ',searchType);
	let keyword = document.getElementById("keyword").value;
	console.log('keyword : ', keyword);
	let selRegion = regionInfo.options[regionInfo.selectedIndex].value;
		//검색버튼의 click 이벤트 발생시  선택된 검색타입과 작성된 검색어를 변수에 담는다.
		
	$.ajax({   // 검색타입과 검색어에 일치하는 목록을 불러오기 위한 ajax
			type : "get",
			url : "selectResellRegionList_ajax",
			dataType : "json",
			data : {"keyword" : keyword, "sellBuy" : "B", "ajaxCheck" : 'REGION', "searchVal" : selRegion, "searchType" : searchType},
			success : function(result){
				alert("검색성공");
				console.log("결과 : "+result);
				
				output_page = '';
					listOutput(result);  //목록 출력용 함수
					
				document.getElementById("regionList").innerHTML = output_page;	
			}					
	})
	
		$
				.ajax({ //검색된 목록의 페이지번호 출력을 위한 ajax
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					async : false,
					data : {
						"keyword" : keyword,
						"searchVal" : selRegion,
						"sellBuy" : 'S',
						"ajaxCheck" : 'PAGE',
						"page" : page,
						"searchType" : searchType
					},
					success : function(result) {
						alert("page_ajax");
						console.log("결과페이지 : " + result.page);
						
						let output_pageNum = "<ul class='pagination'>";
						
						if (result.prev) {
							output_pageNum += '<li class=\"paginate_button\" <a href=\"javascript:void(0);\" onclick=\"searchE('+ (result.page - 1) + ')\">[이전]</a></button>';
						} else {
							output_pageNum += "<li class='paginate_button'><span>이전</span></li>";
						}
						for (var i = result.startPage; i <= result.endPage; i++) {

							if (result.page == i) {
								output_pageNum +=  '<li><a class=\"active\">'+ i + '</a></li>';
							} else {
								output_pageNum += '<li class=\"paginate_button\"><a href=\"javascript:void(0);\" onclick=\"searchE('+ i + ')\">' + i + '</a></li>';
							}
						}
						if (result.next) {
							output_pageNum += '<li class=\"paginate_button\"><a href=\"javascript:void(0);\" onclick=\"searchE('+ (result.page + 1) + ')\">다음</a></li>';
								} 
						else {									
							output_pageNum += '<li class=\"paginate_button\"><span>다음</span></li>'
						}
						document.getElementById("pageList").innerHTML = output_pageNum;
					}
				})
	}
	
</script>

<!-- 페이지 출력 함수 -->
<script type="text/javascript">

function listOutput(result){
	
	for ( var i in result) {
				
		output_page +='<div class=\"float_\">'
			+'<a href=\"selectResellView?ubcode='+result[i].ubcode+'&ubsellbuy='+result[i].ubsellbuy+'&modifyCheck=LIST\">'
				+'<img alt=\"이미지\"	src=\"${pageContext.request.contextPath }/resources/img/resell/'+result[i].ubmainimg+'\">'
			+'</a>'
			+'<div class=\"bottom\">'
				+'<span class=\"soldCheckMsg_ bold\"></span>'
				+'<a href="selectResellView?ubcode='+result[i].ubcode+'&ubsellbuy='+result[i].ubsellbuy+'&modifyCheck=LIST">'+result[i].ubtitle+'</a>'
			+'</div>'
			+'<div class="bottom">'+result[i].ubdate+'</div>'
			+'<div class="bottom">'+result[i].ubnickname+'</div>'
			+'<input type=\"hidden\" class=\"ubstate_\" value=\"'+result[i].ubstate+'\">'
		+'</div>';
	}
}














</script>
			
				


</html>