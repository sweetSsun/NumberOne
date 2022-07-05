<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 메인</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
					<div id="my_region">${sessionScope.loginRegion } 지역입니다.</div>
					<div class="flex_div flex_center flex-p0">

						<div>
							<select class="position_change select-size">
								<option>팔구</option>
								<option>사구</option>
							</select>
						</div>
						<div class="search-bar">
							<div class="row_9">
								<input class="search-bar_input" type="search" placeholder="검색">
						
							</div>
							<div class="row_1">
								<i class="fas fa-search"></i>
							</div>
						</div>


					</div>
				</div>
				<div class="d_body">
					<div class="flex_div flex_between flex-p0">
						<div class="item_start font-l">팔구</div>
						<div class="item_end font-m"><a href="selectResellSellList"> 더보기+</a></div>

					</div>
					<div class="flex_div flex_space-even flex-p2 container-card_w100">


						<div class="col_2-m flex_card">
							<div class="card_top position_relative">
								<a href="selectResellView"><img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size"></a>
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

						<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
							<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>
						</div>

						<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
					<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

						<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
					<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
					</div>

					<div class="flex_div flex_space-even flex-p2">


							<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
					<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

					<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
		<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>
						</div>

						<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
		<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>
						</div>

					<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
			<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
					</div>
				</div>
				<!-- 팔구div끝  -->

				<!--사구 div 시작  -->
				<div class="d_footer">
					<div class="flex_div flex_between flex-p0">
						<div class="item_start font-l">사구</div>
						<div class="item_end font-m"><a href="selectResellBuyList">더보기+</a></div>

					</div>
					
					<div class="flex_div flex_space-even flex-p2">


					<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
					<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

					<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
				<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

							<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
	<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

							<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
					</div>

					<div class="flex_div flex_space-even flex-p2">

	<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
			<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

						<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
				<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

					<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
				<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>

						<div class="col_2-m flex_card">
							<div class="card_top">
								<img alt=""
									src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
							</div>
				<div class="card_body font-s text-right padding-right text-bold">제목</div>
							<div class="card_footer font-s text-right padding-right">가격</div>
						</div>
					</div>
				</div>
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
/*session에서 로그인한 회원의 지역정보 가져오기 */
var getRegion = '${sessionScope.m_region}';
console.log(getRegion);
document.getElementById("my_region").innerText = getRegion;



</script>

</html>