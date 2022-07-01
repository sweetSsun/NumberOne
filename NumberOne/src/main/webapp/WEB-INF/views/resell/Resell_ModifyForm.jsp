<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래 상세페이지</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style type="text/css">
div {
	border: 1px solid black;
}

.container {
	width: 90%;
	max-width: 1240px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: auto;
	grid-gap: 20px;
}

.container-card_goods {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: space-evenly;
}

.container-card_w100 {
	width: 100%;
}

.container-card_goods_2 {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-evenly;
}

.container-card_goods-item {
	display: block;
	flex-basis: 20%;
}

.container-flex_1 {
	display: flex;
	flex-flow: row nowrap;
}

.container-flex_2 {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-evenly;
}

.container-flex_3 {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-evenly;
}

.flex-end{
justify-content: flex-end
}

/* 지워도 될듯?  보류 */
.flex-shrink{
flex-basis:auto;
flex-shrink: 1;
}

.flex_between{
justify-content:space-between;
}
.item-basis_1 {
	flex-basis: 10%
}

.item-basis_2 {
	flex-basis: 60%
}

.item-basis_3 {
	flex-basis: 30%
}

.item-basis_4 {
	flex-basis: 15%
}

.item-basis_5 {
	flex-basis: 40%
}

.item-basis_6 {
	flex-basis: 25%
}
.item-basis_7 {
	flex-basis: 70%
}

.font-s {
	font-size: 15px;
}

.font-m {
	font-size: 20px;
}

.font-l {
	font-size: 30px;
}

.text-right {
	text-align: right;
}

.text-bold {
	font-weight: bold;
}
.text-right{
text-align: right;
}

.dis_block{
display: inline-block;
}

.item_start {
	flex: 0 0 auto; 
	align-self: flex-start;
}

.item_end {
	flex: 0 0 auto;
	align-self: flex-end;
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
				<h1 class="text-center">중고거래 글작성페이지</h1>


				<div class="container-header">
				<div class="container-flex_1 flex_between">
				<div class="item_start">
							<select class="position_change select-size">
								<option>팔구</option>
								<option>사구</option>
							</select>
						</div>
						
				<div class="item_end">작성자 : 닉네임</div>
				
				</div>
				
				<div>글제목 <input type="text" size="60" style="margin-left: 40px;"></div>
				
				

						<div class="container-card_goods_2">
							<div class="item-basis_2 flex-shrink"><input type="text" size="50" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="15" placeholder="가격"></div>
							<div class="item-basis_1 flex-shrink">상태</div>
						</div>

						<div class="container-card_goods_2">
							<div class="item-basis_2 flex-shrink"><input type="text" size="50" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="15" placeholder="가격"></div>
							<div class="item-basis_1 flex-shrink">상태</div>
						</div>
						
						
					<div class="container-card_goods_2">
							<div class="item-basis_2 flex-shrink"><input type="text" size="50" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="15" placeholder="가격"></div>
							<div class="item-basis_1 flex-shrink">상태</div>
						</div>
	
						<div class="container-card_goods_2">
							<div class="item-basis_2 flex-shrink"><input type="text" size="50" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="15" placeholder="가격"></div>
							<div class="item-basis_1 flex-shrink">상태</div>
						</div>
						
						<div class="container-card_goods_2">
							<div class="item-basis_2 flex-shrink"><input type="text" size="50" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="15" placeholder="가격"></div>
							<div class="item-basis_1 flex-shrink">상태</div>
						</div>
					</div>
				</div>



				<div class="container-body">
					<!-- 품목명  -->
					


<!-- 상품 설명  -->
					<div class="container-flex_1">
						<textarea rows="2" cols="80" style="resize: none" readonly>상품상세설명</textarea>

					</div>

				</div>


<!-- 파일첨부  -->
				<div class="container-footer ">
		<div>
		<div>사진첨부</div>
		<div class=""><input type="file" placeholder="메인사진 1개"></div>
		
		<div class=""><input type="file" placeholder="그 외 상세 사진"></div>
				</div>
				</div>
				<div class="container-flex_1 flex-end">
				<div>취소</div>
				 <div>등록</div>
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


</html>