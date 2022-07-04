<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style type="text/css">
/* @media(max-width: 1400px){
	.col_2-m{
	flex: 0 0 auto;
	width: 25%;
	max-width: 1340px;
	}
	}
	@media(max-width: 1000px){
	.col_2-m{
	flex: 0 0 auto;
	width: 33.333333333%;
	max-width: 960px;
	}
	}
		@media(min-width: 999px){
	.col_2-m{
	flex: 0 0 auto;
	width: 50%%;
	max-width: 899px;
	}
	}
 */

.container{
	width: 90%;
	max-width: 1240px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: auto;
	grid-gap: 20px;
}
div {
	border: solid 1px black;
}


.flex_div {

	display: flex;
	flex-flow: row nowrap;
	justify-content: space-evenly;

}
.flex-p2{
	padding: 20px;
}
.flex-p0{
	padding: 0;
}
.flex_center  {
justify-content: center;
}
.flex_space-even{
justify-content: space-around;
}
.flex_between{
justify-content:space-between;
}

.container-card_w100{
width: 100%;
}

.flex_card {
	display: flex;
	flex-direction: column;
}

.item_start {
	flex: 0 0 auto; 
	align-self: flex-start;
}

.item_end {
	flex: 0 0 auto;
	align-self: flex-end;
}

.img_size {
	max-width: 250px;
	max-height: 200px;	
}

/* .col_2 {
	flex: 0 0 auto;
	width: 25%;
} */

.padding-right{
padding-right: 10px;
}
.row_9 {
	flex-basis: 80%;
}

.row_1 {
	flex-basis: 20%;
}


.position_change {
	position: relative;
	right: 20px;
}

.select-size {
	width: 80px;
	height: 50px;
	border-radius: 5px;
}

.search-bar {
	width: 300px;
	height: 50px;
	border-radius: 5px;
	border: solid 1px rgba(0, 0, 0, 0.3);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1;
	opacity: 1;
}

.search-bar_input {
	width: 290px; border : none;
	-webkit-apprearance: none;
	text-align: left;
	margin-left: 10px;
	overflow: auto;
	z-index: -1;
	border: none; -webkit-apprearance : none; text-align : left;
	margin-left : 10px; overflow : auto; z-index : -1;
	font-size: 30px;
}

search-bar_input:focus {
	outline: none;
	width: 300px;
	text-align: left;
}

.fa-search {
	font-size: 30px;
}

.fas {
	width: 20px;
	height: 20px;
	color: gray;
	font-weight: lighter;
}
.font-s{
font-size: 15px;
}
.font-m{
font-size: 20px;
}
.font-l{
font-size: 30px;
}
.text-right{
	text-align: right;
}
.text-bold{
font-weight: bold;
}
.zzim_icon{
position: absolute;

}
.zzim_size{
width: 20px;
height: 20px;

}
.position_relative{
position: relative;
z-index: -1;
}
.position_absolute{
position: absolute;
bottom: 5px;
right: 5px;
z-index: 1;
}

</style>

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
					<div id="my_region">** 지역입니다.</div>
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