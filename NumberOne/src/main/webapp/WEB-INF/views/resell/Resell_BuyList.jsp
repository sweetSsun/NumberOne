<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 사구게시판</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/dadeda074b.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/resell.css"
	type="text/css">


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
							<select class="select-size" onchange="selectRegion()"
								id="regionInfo">
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
							<div class="row_9">
								<input class="search-bar_input" type="search" size="80"
									placeholder="검색">

							</div>
							<div class="row_1">
								<i class="fas fa-search"></i>
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

								<div class="flex_div flex-p2 ">
									<div class="position_relative">
										<a
											href="selectResellView?ubcode=${buy_List.ubcode }&ubsellbuy=${buy_List.ubsellbuy }"><img
											alt=""
											src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${buy_List.ubmainimg }"
											class="img_size"></a>
										<!--찜 기본  -->
										<i
											class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
										<!--찜하면 show  -->
										<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
									</div>

								</div>

								<div class="flex_card ">
									<div class="card_top position_relative">
										<a
											href="selectResellView?ubcode=${buy_List.ubcode }&ubsellbuy=${buy_List.ubsellbuy }">${buy_List.ubtitle }</a>
									</div>

									<div
										class="card_body font-s text-right padding-right text-bold">${buy_List.ubnickname }</div>


									<div class="card_footer font-s text-right padding-right">${buy_List.ubdate }</div>

								</div>
							</div>
						</c:forEach>



					</div>

					<div class="flex_div flex_center">

						<div class="">
							<c:choose>
								<c:when test="${ubpage.page <=1 }">
                   [이전]
                   </c:when>
								<c:otherwise>
									<a href="selectResellPageList?select_page=${ubpage.page-1 }&sell_buy=B">
										[이전]</a>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${ubpage.startPage }" end="${ubpage.endPage }"
								var="num" step="1">
								<c:choose>
									<c:when test="${ubpage.page == num }">
										<span style="font-size: 20px">&nbsp;${num }&nbsp;</span>
									</c:when>
									<c:otherwise>
										<a href="selectResellPageList?select_page=${num}&sell_buy=B">${num }</a>
									</c:otherwise>

								</c:choose>

							</c:forEach>
							<c:choose>
								<c:when test="${ubpage.page >= ubpage.maxPage }">
                       [다음]
                       </c:when>
								<c:otherwise>
									<a href="selectResellPageList?select_page=${ubpage.page+1 }&sell_buy=B">[다음]</a>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	
</script>

<script type="text/javascript">
var sell_buyCheck = 'B';
	var regionInfo = document.getElementById("regionInfo");
	console.log(regionInfo);
	var selRegion = regionInfo.options[regionInfo.selectedIndex].value;
	console.log(selRegion);
	document.getElementById("mregion").innerText = "[" + selRegion
			+ "] 지역 목록입니다.";
	/* 조회  */

	function selectRegion() {
		console.log("selectRegion이벤트 호출");
		selRegion = regionInfo.options[regionInfo.selectedIndex].value;
		$.ajax({
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					data : {
						"selRegion" : selRegion, "sell_buy" : sell_buyCheck
					},
					success : function(result) {
						alert("성공");
						console.log("결과 : " + result);

						output = '';

						for ( var i in result) {

							output += '<div class=\"flex_div\">'
									+ '<div class=\"flex_div flex-p2\">'
									+ '<div class=\"position_relative\">'
									+ '<img alt=\"메인사진\" src=\"${pageContext.request.contextPath }/resources/img/mprofileUpLoad/'+result[i].ubmainimg+'\"'
							+'class=\"img_size\">'
									+ '<i class=\"fa-solid fa-heart-circle-plus zzim_size position_absolute\"></i>'
									+ '</div>'
									+ '</div>'
									+ '<div class=\"flex_card\">'
									+ '<div class=\"card_top position_relative\">'
									+ result[i].ubtitle + '</div>'
									+'<div class=\"card_body font-s text-right padding-right text-bold\">'
									+ result[i].ubnickname
									+ '</div>'
									+ '<div class=\"card_footer font-s text-right padding-right\">'
									+ result[i].ubdate + '</div></div>'
									+ '</div>';

						}
							document.getElementById("regionList").innerHTML = output;
					}

				})
		document.getElementById("mregion").innerText = "[" + selRegion
				+ "] 지역 목록입니다.";
	}
</script>


</html>