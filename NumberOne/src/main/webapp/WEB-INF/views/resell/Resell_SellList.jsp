<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 팔구게시판</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/dadeda074b.js" crossorigin="anonymous"></script>

<style type="text/css">


.container{
	width: 90%;
	max-width: 1240px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: auto;
	grid-gap: 20px;
}

.list_grid{
display: grid;
margin: 0 auto;
grid-template-columns: 1fr 1fr;
	grid-template-rows: auto;

}

div {
	border: solid 1px black;
}


.flex_div {

	display: flex;
	flex-flow: row nowrap;

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
.flex_space-around{
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
	margin-top: 5%;
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
	max-width: 350px;
	max-height: 300px;	
}

.grid_m{
margin-left: 3%;
margin-right: 3%
}
.grid_m-t{
margin-top: 3%;
}
.grid_m-b{
margin-bottom: 5%;
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

.text-left{
	text-align: left;
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
				<h1 class="text-center">중고거래 팔구게시판</h1>
				<div class="d_top">
					
					<div class="flex_div flex-p0 flex_between">
	<div class="item_start"><span>				<select class="select-size" onclick="selectRegion(this)">
								<option value="ALL">전체</option>
								<option value="SEL">서울</option>
								<option value="ICN">인천</option>
								<option value="GGD">경기도</option>
								<option value="GWD">강화도</option>
								<option value="CCD">충청도</option>
								<option value="JLD">전라도</option>
								<option value="GSD">경상도</option>
								<option value="JJD">제주도</option>
							</select></span><span>** 지역입니다.</span></div>
	
						<div class="item_end"><a href="loadToResellWriteForm?titleCheck=S">글작성</a></div>
						</div>
								
								<div class="flex_div flex-p0 flex_center">
						<div class="search-bar">
							<div class="row_9">
								<input class="search-bar_input" type="search" size="80" placeholder="검색">
						
							</div>
							<div class="row_1">
								<i class="fas fa-search"></i>
							</div>
						</div>


					</div>
				</div>
				
				<div class="d_body">
					<div class="text-left">
						팔구게시판

					</div>
					
					<div class="list_grid grid_m grid_m-t">
					
					
					<div class="flex_div">
					<div class="flex_div flex-p2 ">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
											<div class="flex_div flex_center">
					<div class="flex_div flex-p2">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
						</div>
						
						
<!--  -->
					<div class="list_grid grid_m grid_m-t">
					
					
					<div class="flex_div">
					<div class="flex_div flex-p2 ">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
											<div class="flex_div flex_center">
					<div class="flex_div flex-p2">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
						</div>
<!--  -->
					<div class="list_grid grid_m grid_m-t">
					
					
					<div class="flex_div">
					<div class="flex_div flex-p2 ">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
											<div class="flex_div flex_center">
					<div class="flex_div flex-p2">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
						</div>
						<!--  -->
											<div class="list_grid grid_m grid_m-t">
					
					
					<div class="flex_div">
					<div class="flex_div flex-p2 ">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
											<div class="flex_div flex_center">
					<div class="flex_div flex-p2">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
						</div>
						
						<!--  -->
											<div class="list_grid grid_m grid_m-b">
					
					
					<div class="flex_div">
					<div class="flex_div flex-p2 ">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
											<div class="flex_div flex_center">
					<div class="flex_div flex-p2">
<div class="position_relative">
							<img alt="" src="${pageContext.request.contextPath }/resources/img/logo.jpg"
									class="img_size">
											<!--찜 기본  -->
								<i class="fa-solid fa-heart-circle-plus zzim_size position_absolute"></i>
								<!--찜하면 show  -->
								<!-- <i class="fa-solid fa-heart-circle-check zzim_size position_absolute"></i> -->
							</div>
							
							</div>

						<div class="flex_card ">
							<div class="card_top position_relative">
							제목
							</div>
							<div class="card_body font-s text-right padding-right text-bold">작성자 - 날짜</div>
							<div class="card_footer font-s text-right padding-right">가격</div>

						</div>
						</div>
						
						</div>
												
<!-- 스크롤확인용  -->



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
</html>