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
				<h1 class="text-center">중고거래 메인 페이지</h1>
				<div class="d_top">
					<div id="my_region"></div>
					<div class="flex_div flex_center flex-p0">

						<div>
							<select class="position_change select-size" id="searchType">
								<option value="sell">팔구</option>
								<option value="buy">사구</option>
							</select>
						</div>
						<div class="search-bar">
							<div class="row_9">
								<input class="search-bar_input" type="search" placeholder="검색" id="keyword">

							</div>
							<div class="row_1">
								<button onclick="searchKeyword()">
									<i class="fas fa-search"></i>
								</button>
							</div>


						</div>
					</div>
					
					<div class="d_body">
						<div class="flex_div flex_between flex-p0">
							<div class="item_start font-l">팔구</div>
							<div id="mregion"></div>
							<div class="item_end font-m">
								<a href="selectResellPageList?sellBuy=S"> 더보기+</a>
							</div>

						</div>
						
						<div class="flex_div flex_space-even flex-p2">

							<c:forEach items="${SellList }" var="sList">
								<div class="col_2-m flex_card">
									<div class="card_top position_relative">
										<a href="selectResellView"><img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${sList.ubmainimg}"
											class="img_size"></a>
										<!--찜 기본  -->
										<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
										<!--찜하면 show  -->
										<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
									</div>
									<div class="card_body font-s text-right padding-right text-bold">${sList.ubtitle }</div>
									<div class="card_body font-s text-right padding-right text-bold">${sList.ubnickname }</div>
									<div class="card_footer font-s text-right padding-right">${sList.ubdate }</div>

								</div>
							</c:forEach>


						</div>


					</div>
					<!-- 팔구div끝  -->

					<!--사구 div 시작  -->
					<div class="d_footer">
					
						<div class="flex_div flex_between flex-p0">
							<div class="item_start font-l">사구</div>
							<div class="item_end font-m">
								<a href="selectResellPageList?sellBuy=B">더보기+</a>
							</div>

						</div>

						<div class="flex_div flex_space-even flex-p2">

							<c:forEach items="${buyList }" var="bList">
								<div class="col_2-m flex_card">
									<div class="card_top">
										<img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${bList.ubmainimg }" class="img_size">
									</div>
									<div class="card_body font-s text-right padding-right text-bold">${bList.ubtitle }</div>
									<div class="card_body font-s text-right padding-right text-bold">${bList.ubnickname }</div>
									<div class="card_footer font-s text-right padding-right">${bList.ubdate }</div>

								</div>
							</c:forEach>


						</div>

					</div>
				</div>
			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
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
</script>

</html>