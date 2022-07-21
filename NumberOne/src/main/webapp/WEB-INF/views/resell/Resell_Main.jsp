<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 메인</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"
>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>
<script src="https://kit.fontawesome.com/dadeda074b.js" crossorigin="anonymous"></script>


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
			
				<h1 class="text-center">중고거래 메인 페이지</h1>
									<div class="row">
					<!-- 검색기능 -->
					<div
						class="col-5"
						align="right"
					>
						<select
							class="searchType bigger"
							id="searchType"
						>	<option value="sell">팔구</option>
								<option value="buy">사구</option>
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
						
						</div>
					
						
						
		<div class="row">
					<div class="col mb-2">
						<h3>팔구</h3>
					</div>
					<div align="right" class="col">
						<span style="font-size:17px;"> <a href="selectResellPageList?sellBuy=S"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></span>
					</div>
				</div>

					
					</div>
				
					
				

		<div id="regionList">

				<c:forEach
					items="${SellList}"
					var="sellList"
				>
					<div class="float_">

						<a href="selectResellView?ubcode=${sellList.ubcode }&ubsellbuy=${sellList.ubsellbuy }&modifyCheck=LIST">
							<img
								alt=""
								src="${pageContext.request.contextPath }/resources/img/resell/${sellList.ubmainimg }"
							>
						</a>
						<div class="bottom">
							<span class="soldCheckMsg_ bold"></span>
							<a href="selectResellView?ubcode=${sellList.ubcode }&ubsellbuy=${sellList.ubsellbuy }&modifyCheck=LIST">${sellList.ubtitle }</a>
						</div>
						<div class="bottom">${sellList.ubdate }</div>

						<div class="bottom">${sellList.ubnickname }</div>

					</div>
				</c:forEach>

<hr>

					<!--사구 div 시작  -->

					
		<div class="row">
					<div class="col mb-2">
						<h3>사구</h3>
					</div>
					<div align="right" class="col">
						<span style="font-size:17px;"> <a href="selectResellPageList?sellBuy=B"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></span>
					</div>
				</div>

			<c:forEach
					items="${buyList}"
					var="buyList_"
				>
					<div class="float_">

						<a href="selectResellView?ubcode=${buyList_.ubcode }&ubsellbuy=${buyList_.ubsellbuy }&modifyCheck=LIST">
							<img
								alt=""
								src="${pageContext.request.contextPath }/resources/img/resell/${buyList_.ubmainimg }"
							>
						</a>
						<div class="bottom">
							<span class="soldCheckMsg_ bold"></span>
							<a href="selectResellView?ubcode=${buyList_.ubcode }&ubsellbuy=${buyList_.ubsellbuy }&modifyCheck=LIST">${buyList_.ubtitle }</a>
						</div>
						<div class="bottom">${buyList_.ubdate }</div>

						<div class="bottom">${buyList_.ubnickname }</div>

						<input
							type="hidden"
							class="ubstate_"
							value="${buyList_.ubstate }"
						>
					</div>
				</c:forEach>




			</div>
			<div style="clear: left;"></div>

					<!-- 팔구div끝  -->

			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"
	></script>
</body>

<script type="text/javascript">
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
</script>

<script type="text/javascript">

	/* 로그인된 회원인지 체크 */
	let loginCheck = '${sessionScope.loginId}';
	if (loginCheck.length == 0) {
		alert("잘못된 접근입니다.");
		location.href = "loadToLogin"

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
</script>

</html>