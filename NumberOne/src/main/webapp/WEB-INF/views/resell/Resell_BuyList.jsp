<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 사구게시판</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/dadeda074b.js" crossorigin="anonymous"></script>
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
				<h1 class="text-center">중고거래 사구게시판</h1>
				<div class="d_top">

					<div class="flex_div flex-p0 flex_between">
						<div class="item_start">
							<select class="select-size" onchange="selectRegion(1)" id="regionInfo">
								<option value="전국">전국</option>
								<option value="서울">서울</option>
								<option value="인천">인천</option>
								<option value="경기">경기</option>
								<option value="충청">충청</option>
								<option value="전라">전라</option>
								<option value="경상">경상</option>
								<option value="제주">제주</option>

							</select> <span class="regionCheck" id="mregion">전국목록</span>
						</div>

						<c:if test="${sessionScope.loginId != null }">
							<div class="item_end">
								<a href="loadToResellWriteForm?sell_buy=B">글작성</a>
							</div>
						</c:if>
					</div>

					<div class="flex_div flex-p0 flex_center">
						<div class="search-bar">
							<div class="flex_div flex-p0 flex_between">
								<div class="item_start">
									<select id="searchType">
										<option value="ubtitle">제목</option>
										<option value="ubmid">작성자</option>
										<option value="total">제목+내용</option>

									</select>
								</div>
								<div>
									<input class="search-bar_input" type="search" placeholder="검색" id="keyword">
								</div>
							</div>
							<div class="">
								<button onclick="searchKeyword(1)">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>


					</div>
				</div>

				<div class="d_body">
					<div class="text-left">
						사구게시판
						<div></div>
					</div>

					<div class="list_grid grid_m grid_m-t" id="regionList">

						<c:forEach items="${sell_buyList}" var="buy_List">

							<div class="flex_div">
<a href="selectResellView?ubcode=${buy_List.ubcode }&ubsellbuy=${buy_List.ubsellbuy }">이동</a>
								<div class="flex_div flex-p2 ">
									<div class="position_relative">
										<a href="selectResellView?ubcode=${buy_List.ubcode }&ubsellbuy=${buy_List.ubsellbuy }"> 
										<img alt=""
											src="${pageContext.request.contextPath }/resources/img/resell/${buy_List.ubmainimg }" class="img_size"></a>
										<!--찜 기본  -->
										<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
										<!--찜하면 show  -->
										<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
									</div>

								</div>

								<div class="flex_card ">
									<div class="card_top position_relative">
										<a href="selectResellView?ubcode=${buy_List.ubcode }&ubsellbuy=${buy_List.ubsellbuy }">${buy_List.ubtitle }</a>
									</div>

									<div class="card_body font-s text-right padding-right text-bold">${buy_List.ubnickname }</div>


									<div class="card_footer font-s text-right padding-right">${buy_List.ubdate }</div>

								</div>
							</div>
						</c:forEach>

					</div>

					<div class="flex_div flex_center">

						<div id="pageNumber">
							<c:choose>
								<c:when test="${paging.page <=1 }">
                   [이전]
                   </c:when>
								<c:otherwise>
									<a href="selectResellPageList?page=${paging.page-1 }&sellBuy=B"> [이전]</a>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" step="1">
								<c:choose>
									<c:when test="${paging.page == num }">
										<span style="font-size: 20px">&nbsp;${num }&nbsp;</span>
									</c:when>
									<c:otherwise>
										<a href="selectResellPageList?page=${num}&sellBuy=B">${num }</a>
									</c:otherwise>

								</c:choose>

							</c:forEach>
							<c:choose>
								<c:when test="${paging.page >= paging.maxPage }">
                       [다음]
                       </c:when>
								<c:otherwise>
									<a href="selectResellPageList?page=${paging.page+1 }&sellBuy=B">[다음]</a>
								</c:otherwise>

							</c:choose>

						</div>

					</div>
				</div>

				<!-- 팔구div끝  -->

			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>


<script type="text/javascript">
	var checkMsg = '${msg}';
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
	var checkSearch = '${checkSearch}';
	var loginRegion = '${sessionScope.loginRegion}';
	var regionInfo = document.getElementById("regionInfo");
	var selRegion = regionInfo.options[regionInfo.selectedIndex].value;

	if (checkSearch == 'OK') {
		console.log("checkSearch : " + checkSearch);
		console.log("checkSearch길이 : " + checkSearch.length);
		document.getElementById("mregion").innerText = "[" + selRegion
				+ "] 지역 목록입니다.";

	} else {

		selRegion = loginRegion;
		document.getElementById("mregion").innerText = "[" + selRegion
				+ "] 지역 목록입니다.";
		for (var i = 0; i < regionInfo.options.length; i++) {
			console.log("for문확인");
			if (regionInfo.options[i].value == loginRegion) {

				console.log("regionInfo.options[i].value : "
						+ regionInfo.options[i].value);

				regionInfo.options[i].selected = "true";
			}
		}
	}
	console.log("loginRegion :" + loginRegion);
	console.log("regionInfo : " + regionInfo);
	console.log("loginRegion.length : " + loginRegion.length);
	console.log("selRegion : " + selRegion);

	var output_page = '';
	var output_pagerNum = '';
	/* 조회  */

	function selectRegion(page) {
		console.log("selectRegion이벤트 호출");
		selRegion = regionInfo.options[regionInfo.selectedIndex].value;

		/* 지역별조회 */
		$.ajax({
			type : "get",
			url : "selectResellRegionList_ajax",
			dataType : "json",
			data : {
				"searchVal" : selRegion,
				"sellBuy" : 'B',
				"ajaxCheck" : 'REGION',
				"page" : page
			},
			success : function(result) {
				output_page = '';
				alert("성공");
				console.log("결과 : " + result);
				listOutput(result);
				document.getElementById("regionList").innerHTML = output_page;
			}

		})

		/* 지역별조회 페이지번호 ajax */
		$
				.ajax({
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					data : {
						"searchVal" : selRegion,
						"sellBuy" : 'B',
						"ajaxCheck" : 'PAGE',
						"page" : page
					},
					success : function(result) {
						alert("page_ajax");
						console.log("결과페이지 : " + result.page);
						output_pagerNum = '';
						if (result.page <= 1) {
							output_pagerNum = '[이전]';
						} else {
							output_pagerNum = '<button onclick="selectRegion('
									+ (result.page - 1) + ')">[이전]</button>';
						}
						for (var i = 1; i <= result.endPage; i++) {

							if (result.endPage == i) {
								output_pagerNum += '<span style=\"font-size: 20px\">&nbsp;'
										+ i + '&nbsp;</span>';
							} else {
								output_pagerNum += '<button onclick="selectRegion('
										+ i + ')">' + i + '</button>';
							}
						}
						if (result.page >= result.maxPage) {
							output_pagerNum += '[다음]';
						} else {
							output_pagerNum += '<button onclick="selectRegion('
									+ (result.page + 1) + ')">[다음]</button>';
						}
						document.getElementById("pageNumber").innerHTML = output_pagerNum;
					}
				})

		document.getElementById("mregion").innerText = "[" + selRegion
				+ "] 지역 목록입니다.";
	}

	/* 페이지출력 ajax output */
	function listOutput(result) {

		for ( var i in result) {

			output_page += '<div class=\"flex_div\">'
					+ '<div class=\"flex_div flex-p2\">'
					+ '<div class=\"position_relative\">'
					+ '<img alt=\"메인사진\" src=\"${pageContext.request.contextPath }/resources/img/resell/'+result[i].ubmainimg+'\"'
	+'class=\"img_size\">'
					+ '<i class=\"fa-solid fa-heart-circle-plus zzim_size position_absolute\"></i>'
					+ '</div>'
					+ '</div>'
					+ '<div class=\"flex_card\">'
					+ '<div class=\"card_top position_relative\">'
					+ result[i].ubtitle
					+ '</div>'
					+ '<div class=\"card_body font-s text-right padding-right text-bold\">'
					+ result[i].ubnickname
					+ '</div>'
					+ '<div class=\"card_footer font-s text-right padding-right\">'
					+ result[i].ubdate + '</div></div>' + '</div>';
		}
	}
</script>

<script type="text/javascript">
	/* 검색 */

	function searchKeyword(page) {
		var searchType = document.getElementById("searchType").value;
		console.log(searchType);
		var keyword = document.getElementById("keyword").value;
		console.log(keyword);
		$.ajax({
			type : "get",
			url : "selectResellRegionList_ajax",
			dataType : "json",
			data : {
				"keyword" : keyword,
				"sellBuy" : "B",
				"ajaxCheck" : 'REGION',
				"searchVal" : selRegion,
				"searchType" : searchType
			},
			success : function(result) {
				console.log("결과 : " + result);
				output_page = '';
				listOutput(result);

				document.getElementById("regionList").innerHTML = output_page;
			}
		})

		$
				.ajax({
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					data : {
						"keyword" : keyword,
						"searchVal" : selRegion,
						"sellBuy" : 'B',
						"ajaxCheck" : 'PAGE',
						"page" : page,
						"searchType" : searchType
					},
					success : function(result) {
						output_pagerNum = '';
						alert("page_ajax");
						console.log("결과페이지 : " + result.page);

						if (result.page <= 1) {
							output_pagerNum = '[이전]';
						} else {
							output_pagerNum = '<button onclick="searchKeyword('
									+ (result.page - 1) + ')">[이전]</button>';
						}
						for (var i = 1; i <= result.endPage; i++) {

							if (result.endPage == i) {
								output_pagerNum += '<span style=\"font-size: 20px\">&nbsp;'
										+ i + '&nbsp;</span>';
							} else {
								output_pagerNum += '<button onclick="searchKeyword('
										+ i + ')">' + i + '</button>';
							}
						}
						if (result.page >= result.maxPage) {
							output_pagerNum += '[다음]';
						} else {
							output_pagerNum += '<button onclick="searchKeyword('
									+ (result.page + 1) + ')">[다음]</button>';
						}
						document.getElementById("pageNumber").innerHTML = output_pagerNum;
					}
				})
	}
</script>



</html>