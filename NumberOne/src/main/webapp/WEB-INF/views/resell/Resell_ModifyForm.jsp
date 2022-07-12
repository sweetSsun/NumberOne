<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래 수정페이지</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/resell.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>
<style type="text/css">
.product-img {
	max-width: 400px;
	max-height: 300px;
}
.line-through{
text-decoration: line-through;
}
</style>

</head>


<body>
        <!-- TopBar -->
        <c:choose>
                <c:when test="${sessionScope.loginId != 'admin'}">
                        <%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
                </c:when>
                <c:otherwise>
                        <%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
                </c:otherwise>
        </c:choose>
        <!-- End of TopBar -->
	<main>
		<!-- 사이드바 -->

		<%@ include file="/WEB-INF/views/includes/SideBar_Resell.jsp"%>
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center" id="titleMsg"></h1>

				<form action="updateResellModify" method="post" enctype="multipart/form-data" onsubmit="return checkFormData()">
					<div class="container-header">
						<div class="container-flex_1 flex_between">
							<div class="item_start">
								<span> <select class="select-size" id="boardTitle" name="ubsellbuy">
										<option value="1">판매중</option>
										<option value="0">판매완료</option>
								</select>
								</span> <span> <select class="select-size" name="ubrgcode">
										<option value="ALL">전국</option>
										<option value="SEL">서울</option>
										<option value="ICN">인천</option>
										<option value="GGD">경기</option>
										<option value="GWD">강화</option>
										<option value="CCD">충청</option>
										<option value="JLD">전라</option>
										<option value="GSD">경상</option>
										<option value="JJD">제주</option>
								</select>
								</span>
							</div>

							<div class="item_end">작성자 : ${ub_resellView.ubnickname }</div>

						</div>

						<div>
							글제목 ${ub_resellView.ubtitle }<span class="checkMsg"></span>
						</div>


						<div class="container-card_goods">

							<c:forEach items="${gd_resellView}" var="gdList">


								<div class="container-card_goods_2">
									<div class="item-basis_1 wrap">

										<select name="ubstate" id="selectOp" class="selectState">
											<option value="1">판매중</option>
											<option value="0">판매완료</option>
										</select>
									<input type="hidden" class="select_gdstate" value="${gdList.gdstate }">
									<input type="hidden" class="select_gdcode" value="${gdList.gdcode }">

									</div>
									<div class="item-basis_2" class="gd_nameList">${gdList.gdname }</div>
									<div class="item-basis_3" class="gd_priceList">${gdList.gdprice }</div>
								</div>


							</c:forEach>

						</div>


					</div>
					<div class="container-body">
						<!-- 품목명  -->


						<!-- 상품 설명  -->
						<div class="container-flex_1">
							<textarea rows="4" cols="80" style="resize: none" name="ubcontents" id="contentsCheck">${ub_resellView.ubcontents}</textarea>

						</div>

					</div>


					<!-- 파일첨부  -->
					<div class="container-footer ">
						<div class="container-flex_1">
							<div>
								<img class="product-img" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}" style="width: 100%">
							</div>
							<div>
								<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list">
									<img class="product-img" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}" style="width: 100%">
								</c:forEach>
							</div>
							<div>사진첨부</div>
							<div class="">
								<input type="file" placeholder="메인사진 1개" name="ubmainimgfile" id="mainImgCheck"> <br> <span class="checkMsg"></span>
							</div>

							<div class="">
								<input type="file" multiple="multiple" name="ubdetailimgfile">
							</div>
						</div>
					</div>
					<div class="container-flex_1 flex-end">
						<div>
							<input type="button" id="cancelModify">수정취소
						</div>

						<div>
							<button type="submit">수정하기</button>
						</div>
					</div>
				</form>


			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<!-- 페이지로드시 실행할 코드 스크립트 -->
<script type="text/javascript">
const ubstate = '${ub_resellView.ubstate}'; //글 상태 값  o or 1
const boardTitle = document.getElementById("boardTitle"); //select태그지정
const ubcode = '${ub_resellView.ubcode}';
const sellbuy = '${ub_resellView.ubsellbuy}';
const selectOp = document.querySelector("#selectOp");
const selectStates = document.querySelectorAll(".selectState");
const select_gdcode = document.querySelectorAll(".select_gdcode");
const select_gdstate = 	document.querySelectorAll(".select_gdstate");
const wrap = document.querySelector(".wrap");	
	
	//페이지로드시 무조건실행
	window.onload = function() {
		/* 로그인된 회원인지 체크 */
		var loginCheck = '${sessionScope.loginId}';
		if (loginCheck.length == 0) {
			alert("잘못된 접근입니다.");
			location.href = "loadToLogin"

		}
						

for(var i = 0; i < select_gdstate.length; i++){
	//console.log("select_gdstate[i]",select_gdstate[i]);
	if(select_gdstate[i].value==0){
		selectStates[i].selectedIndex = '1';
		
	}
	else{
		selectStates[i].selectedIndex = '0';
	}

	
	}

		
	}
</script>


<script type="text/javascript">

	 
	
	for (var i = 0; i < boardTitle.options.length; i++) {
		if (boardTitle.options[i].value == ubstate) {
			boardTitle.options[i].selected = 'true'
			ubstate == '0' ? document.getElementById("titleMsg").innerText = "판매완료된 글입니다."
			
					: document.getElementById("titleMsg").innerText = "판매중";
			break; 	
		}
	}
	
	
</script>

<!-- 상품 상태 확인 -->
<script type="text/javascript">


</script>
<!-- select태그 option선택 이벤트 -->
<script type="text/javascript">
	boardTitle.addEventListener('change', selectOp_value);

	function selectOp_value() {

		boardTitle.options[boardTitle.selectedIndex].value == '0' ? document
				.getElementById("titleMsg").innerText = "판매완료된 글입니다."
		// 판매완료체크 하면 전체디서블드 처리?

		: document.getElementById("titleMsg").innerText = "판매중";
	}
</script>


<!-- 폼데이터 입력되었는지 체크하는 코드 스크립트  -->
<script type="text/javascript">
	/* 폼태그 데이터 공백 체크  */
	/* onsubmit이벤트  false 일시 submit이벤트 취소*/
	function checkFormData() {
		let checkForm = true;
		console.log("폼데이터 핸들러 호출");
		if (document.getElementById("titleCheck").value == '') {
			document.getElementById("titleCheck").focus();
			alert("제목을 입력해주세요.");
			checkForm = false;
		} else if (document.getElementsByClassName("gdcheck_n")[0].value == '') {
			alert("품목이름을 작성해주세요.");
			document.getElementsByClassName("gdcheck_n")[0].focus();

			checkForm = false;
		} else if (document.getElementsByClassName("gdcheck_p")[0].value == '') {
			alert("품목가격을 작성해주세요.");
			document.getElementsByClassName("gdcheck_p")[0].focus();
			checkForm = false;
		} else if (document.getElementById("contentsCheck").value == '') {
			document.getElementById("contentsCheck").focus();
			alert("내용을 작성해주세요.");
			checkForm = false;
		} else if (document.getElementById("mainImgCheck").value == '') {
			alert("메인사진을 선택해주세요.");
			document.getElementById("mainImgCheck").focus();
			checkForm = false;
		}
		return checkForm;
	}
</script>

<!-- 전페이지(상세페이지)로 돌아가기 -->
<script type="text/javascript">
	
	/* 수정취소 코드 */
	
	let cancelModify = document.querySelector("#cancelModify");
	console.log(cancelModify);
	cancelModify.addEventListener("click", backPage);
	function backPage() {
		console.log("수정취소버튼 클릭이벤트");
		location.href = "selectResellView?ubcode=" + ubcode + "&sellbuy="
				+ ubsellbuy + "$modifyCheck=LIST";
	}
</script>

<!-- 상품 상태변경시 실행 스크립트  -->
<script type="text/javascript">
/* 상품 상태변경 코드 */
	var gdstate;
	var gdcode;

	selectStates.forEach(function(e){
		e.addEventListener('change', changeOp)
		
	});
		
	function changeOp(e) {
		console.log(e);
		console.log(e.target);
		console.log(e.target.value);
		


			if (e.target.value == '0') {
				gdcode = select_gdcode[selectState.selectedIndex].value;
				console.log("상품코드 : " + gdcode);
				gdstate = 0;
				gdUpdateState(ubcode, gdcode, gdstate);
			} else {
				gdcode = select_gdcode[selectState.selectedIndex].value;
				console.log("상품코드 : " + gdcode);
				gdstate = 1;
				gdUpdateState(ubcode, gdcode, gdstate);
			}
		}
	
	
		
	selectStates.forEach(function(selectState){
		selectState.addEventListener('change', changeOp)
		
	});
	
	
	function changeOp() {
		console.log("셀렉트된옵션" + selectOp.value);
		console.log("ubcode:", ubcode);


		for (var i = 0; i < selectStates.length; i++) {

			if (selectStates[i].value == '0') {
				gdcode = select_gdcode[i].value;
				console.log("상품코드 : " + gdcode);
				gdstate = 0;
				gdUpdateState(ubcode, gdcode, gdstate);
				break;
			} else {
				gdcode = select_gdcode[i].value;
				console.log("상품코드 : " + gdcode);
				gdstate = 1;
				gdUpdateState(ubcode, gdcode, gdstate);
				break;
			}
		}
	}
	 --%>
</script>


<!-- 상품 상태변경 ajax  -->
<script type="text/javascript">
	//상품 상태변경 ajax 
	function gdUpdateState(udcode, gdcode, gdstate) {
		$.ajax({
			type : 'get',
			url : 'updateResellState_ajax',
			data : {
				'gdubcode' : ubcode,
				'gdcode' : gdcode,
				'gdstate' : gdstate
			},
			success : function(result) {
				console.log(result);
				if (result == 'OK') {
					alert("변경성공")
					
				}
			}
		})
	}
</script>


</html>