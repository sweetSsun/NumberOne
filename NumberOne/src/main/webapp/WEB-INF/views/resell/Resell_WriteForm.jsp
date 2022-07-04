<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.d_none{
display: none;
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
				<h1 class="text-center" id="boardTitle">중고거래 글작성페이지</h1>


<form action="insertResellWrite">
				<div class="container-header">
				<div class="container-flex_1 flex_between">
				<div class="item_start">
							<span id="selectSB_Value"> 작성게시판을 선택해주세요</span>
							
							<select class="position_change select-size" onchange="selectSB(this)">
								<option value="" selected="selected" >선택</option>
								<option value="S">팔구</option>
								<option value="B">사구</option>
							</select>
							
						</div>
						
				<div class="item_end">작성자 : 닉네임</div>
				
				</div>
				
				<div>글제목 <input type="text" size="60" style="margin-left: 40px;"></div>
				
				
<div class="container-card_goods">

						<div class="container-card_goods_2">
							<div class="item-basis_7 flex-shrink"><input type="text" name="gd_names" size="60" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="20" placeholder="가격"></div>
							
						</div>
				<div class="container-flex_1 flex-end flex-shrink">		
<div class="addBtn">+추가</div>
</div>

<div class="d_none btn_d-none">
						<div class="container-card_goods_2">
						<div class="item-basis_7 flex-shrink"><input type="text" name="gd_names" size="60" placeholder="품목명" ></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="20" placeholder="가격"></div>
							
						</div>
							<div class="container-flex_1 flex-end">	
							<div class="addBtn">+추가</div><div class="removeBtn">제거</div>
						</div>
	</div>					
						
						<div class="d_none btn_d-none">
						<div class="container-card_goods_2">
						<div class="item-basis_7 flex-shrink"><input type="text" name="gd_names" size="60" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="20" placeholder="가격"></div>
							
						</div>
	<div class="container-flex_1 flex-end flex-shrink" >	
							<div class="addBtn">+추가</div><div class="removeBtn">제거</div>
						</div>
						</div>
						
						<div class="d_none btn_d-none">
						
							<div class="container-card_goods_2">
						<div class="item-basis_7 flex-shrink"><input type="text" name="gd_names" size="60" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="20" placeholder="가격"></div>
						</div>
							<div class="container-flex_1 flex-end">	
							<div class="addBtn">+추가</div><div class="removeBtn">제거</div>
						</div>
						</div>
							
						<div class="d_none btn_d-none">
						
						<div class="container-card_goods_2">
					<div class="item-basis_7 flex-shrink"><input type="text" name="gd_names" size="60" placeholder="품목명"></div>
							<div class="item-basis_3 flex-shrink"><input type="text" size="20" placeholder="가격"></div>
						</div>
							<div class="container-flex_1 flex-end">	
							<div class="removeBtn">제거</div>
						</div>
</div>
					</div>
				</div>



				<div class="container-body">
					<!-- 품목명  -->
					


<!-- 상품 설명  -->
					<div class="container-flex_1">
						<textarea rows="4" cols="80" style="resize: none" readonly>상품상세설명</textarea>

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
</form>


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


/* var boardTitle = document.getElementById("boardTitle");
var titleCheck = '${titleCheck}';
console.log("타이틀체크 : "+titleCheck);
console.log(typeof titleCheck);
(titleCheck == 'B') ? boardTitle.innerText = "중고거래게시판- 사구 글 작성" : "중고게시판 - 팔구 글 작성";*/


 
</script>

<script type="text/javascript">
/* 추가버튼 변수 */
var addBtn0 = document.getElementsByClassName("addBtn")[0];
var addBtn1 = document.getElementsByClassName("addBtn")[1];
var addBtn2 = document.getElementsByClassName("addBtn")[2];
var addBtn3 = document.getElementsByClassName("addBtn")[3];
var removeBtn0 = document.getElementsByClassName("removeBtn")[0];
var removeBtn1 = document.getElementsByClassName("removeBtn")[1];
var removeBtn2 = document.getElementsByClassName("removeBtn")[2];
var removeBtn3 = document.getElementsByClassName("removeBtn")[3];
var remove_btn =document.getElementsByClassName("removeBtn")[3];
var dsiplay_btn0 =document.getElementsByClassName("btn_d-none")[0];
var dsiplay_btn1 =document.getElementsByClassName("btn_d-none")[1];
var dsiplay_btn2 =document.getElementsByClassName("btn_d-none")[2];
var dsiplay_btn3 =document.getElementsByClassName("btn_d-none")[3];

/* 판매, 구매 메시지 출력함수 */
 /* 셀렉트옵션 선택하면 함수 에러 수정하기   셀렉티드옵션을 주고 페이지 이동하자마자 그거에 맞춰서 타이틀메세지 변경해볼까?*/
/* function selectSB(selectVal){
	
	console.log("선택된 옵션의 value : " +selectVal.value);
	console.log("선택된옵션의 text : " + selectVal.options[selectVal.selectedIndex].text);
	let sellBuy_Msg = (selectVal.value =='B') ? '구매글 작성중입니다.':
		'판매글 작성중입니다.';					
	console.log(sellBuy_Msg);
document.getEelementById("selectSB_Value").innerText = sellBuy_Msg;
} 
 */

addBtn0.onclick = function(){
	console.log("addBtn0 호출");	
	dsiplay_btn0.classList.remove("d_none");
	};
	addBtn1.onclick = function(){
		console.log("addBtn1 호출");
		dsiplay_btn1.classList.remove("d_none");
		};
		addBtn2.onclick = function(){
			console.log("addBtn2 호출");
			dsiplay_btn2.classList.remove("d_none");
			};
			addBtn3.onclick = function(){
				console.log("addBtn3 호출");
				dsiplay_btn3.classList.remove("d_none");
				};
				/* display:none 속성 추가  */
				removeBtn3.onclick= function(){
					console.log("removeBtn3 호출");
					dsiplay_btn3.classList.add("d_none");		
				}
				removeBtn2.onclick= function(){
					console.log("removeBtn2 호출");
					dsiplay_btn2.classList.add("d_none");	;					
				}
				removeBtn1.onclick= function(){
					console.log("removeBtn1 호출");
					dsiplay_btn1.classList.add("d_none");			
				}
				removeBtn0.onclick= function(){
					console.log("removeBtn0 호출");
					dsiplay_btn0.classList.add("d_none");				
				}
	
	
	
	
	
	

</script>



</html>