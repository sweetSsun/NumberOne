<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래 수정페이지</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>


<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"
	>
	
<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<style type="text/css">
.product-img {
	max-width: 30%;
	max-height: 30%;
	objetFit: contain;
}

.d_none {
	display: none;
}

.line-through {
	text-decoration: line-through;
	font-size: 20px;
}
/* label 스타일 조정 */
.button {
	display: flex;
	justify-content: center;
}

label {
	cursor: pointer;
	font-size: 1em;
}

/* 못생긴 기존 input 숨기기 */
.chooseFile {
	visibility: hidden;
}
/*  */
section {
	max-width: 70%;
	margin: auto;
	margin-top: 0%;
}

select {
	width: 200px;
	text-align: center;
	border: none;
	color: #00bcd4;
}

option {
	color: #00bcd4;
	font-weight: bold;
}

.bdtitle {
	border: none;
	font-weight: bold;
	font-size: 20px;
	height: 22px;
	margin: auto;
}

.bdcontents {
	border-radius: 5px;
	border: solid gray 2px;
	font-size: 19px;
	resize: none;
}

.container-gd {
	border: 2px solid #00bcd4;
	border-radius: 7px;
	
}

.gdtitle {
	border: none;
	font-size: 20px;
	height: 22px;
	margin: auto;
	width:100%;
	vertical-align: middle
}

.gd-header{
	display: block;
	border-radius: 5px 5px 0 0;
	background-color: #00bcd4;
	font-size: 18px;
	color: white;
	font-weight: bold;
	text-align: center;
}

input[type="text"]:disabled {
 	background-color: white;
}

.btn-wrapper {
	width: 100%;
	text-align: center;
	display: inline-block;
}

.selectPlaceHolder {
	display: none;
}

textarea:focus {
	outline: none;
}

input:focus {
	outline: none;
}

.bdCategoryList {
	color: #00bcd4;
	border: none;
	font-size: 20px;
}

.nickname {
	color: #00bcd4;
	border: none;
	font-size: 20px;
	margin-left: 20px;
}

/*    		자랑방 CSS		*/
.mainfile {
	border-style: inherit;
	border-color: internal-light-dark;
	padding: 6px;
	background-color: #BDB4A3;
	color: white;
	border-radius: 6px;
}

.d_none {
	display: none;
}

.img {
	height: 190px;
	width: 260px;
}

span.x {
	/* 사진 X 버튼 */
	background-color: #00bcd4;
	border-radius: 100%;
	color: white;
	position: absolute;
	top: 10px;
	right: 5px;
	cursor: pointer;
}

div.detailimageBox {
	/* position: relative; */
	height: 190px;
	width: 260px;
	display: inline-block;
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
				<h2 class="text-center">중고거래 글수정페이지 : Resell_ModifyForm.jsp</h2>
				<h1
					class="text-center"
					id="titleMsg"
				></h1>

				<form
					action="updateResellModify"
					method="post"
					enctype="multipart/form-data"
					onsubmit="return roomModifyCh('${detailLength}')"
				>
				
					<input
									type="hidden"
									name="ubcode"
									value="${ub_resellView.ubcode }"
								>
					<input
									type="hidden"
									name="ubmid"
									value="${ub_resellView.ubmid }"
								>
							<input
									type="hidden"
									name="ubsellbuy"
									value="${ub_resellView.ubsellbuy }"
								>
									<input
									type="hidden"
									name="ubdate"
									value="${ub_resellView.ubdate }"
								>
								
										
				
				
					<div class="container-header">
						<div class="row">
							<div class="col-6">
								<span style="font-size:20px;">글상태 </span><span class="text-danger">*</span>
								<select
									class="bdCategoryList"
									id="totalOp"
									name="ubstate"
									onchange="resellState(this,'${gd_resellView}')">
									<option value="1">거래중</option>
									<option value="9">거래완료</option>
								</select>
							</div>
							<div class="col-6">
								<span style="font-size:20px;">지역 </span><span class="text-danger">*</span>
								<select
									class="bdCategoryList"
									id = "ubrgOp"
									name="ubrgcode">
									<option value="SEL">서울</option>
									<option value="ICN">인천</option>
									<option value="GGD">경기</option>
									<option value="GWD">강원</option>
									<option value="CCD">충청</option>
									<option value="JLD">전라</option>
									<option value="GSD">경상</option>
									<option value="JJD">제주</option>
								</select>
							</div>
<%-- 
							<div class="col-2">작성자</div>
							<div class="col-4">${ub_resellView.ubnickname }</div>
 --%>
 						</div>
						<hr>
						
						<!-- 글 제목  -->
						<div class="row">
							<input
								type="text"
								<%-- 
								size="60"
								style="margin-left: 40px;"
								 --%>
								class="bdtitle" 
								id="titleCheck"
								name="ubtitle"
								value="${ub_resellView.ubtitle }"
							>
							<span class="checkMsg"></span>
						</div>
						<hr>
						
						<!-- 품목 -->
						<div class="container-gd mb-3">
							<!-- <span class="gd-header">거래물품</span> -->
						
							<c:forEach
								items="${gd_resellView}"
								var="gdList"
							>
								<div class="row my-3" style="">
									<div class="col-2">
										<select
											class="bdCategoryList selectStates"
											name="gd_state"
											onchange="gdUpdateState('${gdList.gdcode }',this)"
											style="width:130px;"
										>
											<option value="1">거래중</option>
											<option value="0">거래완료</option>
										</select>
	
									</div>
									<div class="col-7">
										<input
											type="text"
											class="gdtitle"
											name="gd_names"
											value="${gdList.gdname }"
										>
										<input disabled class="d_none gdtitle gd_nameList line-through"
											type="text" value="${gdList.gdname }">
									</div>
	
									<div class="col-3" style="display:flex;">
										<!-- 한화 표시 -->
										<span style="vertical-align: middle; margin: auto;">&#8361; </span>
										<input
												type="text"
												class="gdtitle"
												name="gd_price"
												value="${gdList.gdprice }"
											>
										<input disabled class="d_none gdtitle gd_priceList line-through" 
											 type="text" value="${gdList.gdprice }">
									</div>
	
	
	
									<input
										type="hidden"
										class="select_gdcode"
										name="gd_code"
										value="${gdList.gdcode }"
									>
									<input
										type="hidden"
										class="select_gdstate"
										value="${gdList.gdstate }"
									>
	
								</div>
	
							</c:forEach>
						</div>


					</div>




					<!-- 상품 설명  -->
					<div class="row" style="width:100%; margin-left:0;">
						<textarea
							class="bdcontents"
							rows="17"
							cols="80"
							name="ubcontents"
							id="ubcontents"
						>${ub_resellView.ubcontents}</textarea>
					</div>

					<!-- 파일첨부  -->
			

					<!-- 대표사진 -->
					<div
						class="row"
						style="height: 190px; width: 260px; margin-top: 15px;"
					>
						<img
							class="img"
							alt="대표사진"
							src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg }"
							id="currentBdimg_screen"
						><br>
						<input
							type="hidden"
							value="${ub_resellView.ubmainimg }"
							id="currentBdimg"
							name="ubmainimg"
						>
					</div>

					<!-- 대표사진 수정 -->
					<div class="row">
						<span>대표사진 수정</span>
						<input
							type="file"
							id="mainImg"
							name="ubmainimgfile"
							accept="image/*"
						>
					</div>

					<!-- 상세사진 -->
					<div
						class="row"
						style="margin-top: 15px;"
					>
						<c:forEach
							items="${ub_resellView.ubdetailimg_list }"
							var="ubdetailimg_list"
							begin="1"
							varStatus="status"
						>
							<div
								class="detailimageBox"
								id="${status.index }_currentDetailimg_screen"
								style="position: relative;"
							>
								<img
									class="img"
									alt='상세사진'
									src='${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}'
								> <span
									class="x"
									onclick="currentImgStateUpdate('${status.index }_currentDetailimg')"
								>&nbsp;X&nbsp;</span>
								<input
									type="hidden"
									id="${status.index }_currentDetailimg"
									value="${ubdetailimg_list }"
								>
							</div>
						</c:forEach>
						<input
							type="hidden"
							id="ubdetailimg"
							name="ubdetailimg"
							placeholder="현재상세이미지 파일명을 모을 input"
						>
					</div>

					<!-- 상세사진 추가-->
					<div class="row">
						<span>상세사진 추가</span>
						<input
							type="file"
							multiple="multiple"
							id="detailImg"
							name="ubdetailimgfile"
							accept="image/*"
							onclick="return mainimgCh()"
						>
					</div>


					<!-- 수정/취소 버튼 -->
					<div class="row mt-4">
						<div class="col btn-wrapper">
							<input
								class="btn btn-numberone btn-lg fw-bold"
								type="submit"
								value="수정"
							>
							<input
								onclick="bdWriteCancelCheckModal()"
								class="btn btn-numberone btn-lg fw-bold"
								type="button"
								value="취소"
							>
						</div>
					</div>



				</form>


			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>


	<!-- 게시글 작성 취소 확인 -->
	<div
		class="modal fade"
		id="bdWriteCancelCheckModal"
		tabindex="-1"
		role="dialog"
		aria-labelledby="exampleModalLabel"
		aria-hidden="true"
	>
		<div
			class="modal-dialog"
			role="document"
		>
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시글 작성 취소</h5>
					<button
						class="close"
						type="button"
						data-dismiss="modal"
						aria-label="Close"
					>
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<span class="fw-bold">게시글 작성을 취소하시겠습니까?</span> <br> <span class="fw-bold">이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.</span>
				</div>
				<div class="modal-footer">
					<input type="hidden">
					<button
						class="close btn btn-numberone"
						onclick="cancelBtn()"
					>네</button>
					<button
						class="close btn btn-secondary"
						type="button"
						data-dismiss="modal"
					>아니오</button>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"
	></script>
</body>
<!-- 페이지로드시 실행할 코드 스크립트 -->
<script type="text/javascript">
	const ubstate = '${ub_resellView.ubstate}'; // 글 상태 값 
	const totalOp = document.getElementById("totalOp"); // 글 상태 select태그
	const ubrgcode = '${ub_resellView.ubrgcode}'; // 지역코드
	const ubrgOp = document.getElementById("ubrgOp") // 지역 select태그
	const ubcode = '${ub_resellView.ubcode}'; //글번호
	const ubsellbuy = '${ub_resellView.ubsellbuy}'; //사구,팔구 확인
	const selectStates = document.querySelectorAll(".selectStates"); // 상품 상태 select태그 
	const select_gdcode = document.querySelectorAll(".select_gdcode"); //상품코드	
	const select_gdstate = document.querySelectorAll(".select_gdstate");//상품상태 
	const gd_nameList = document.querySelectorAll(".gd_nameList"); //상품명  (거래완료시) 
	const gd_priceList = document.querySelectorAll(".gd_priceList"); //상품가격 (거래완료시)
	const gd_names = document.getElementsByName('gd_names');	// input 상품명	(거래중)
	const gd_price = document.getElementsByName('gd_price');	// input 상품가격	(거래중)
</script>



<script type="text/javascript">
/* 로그인된 회원인지 체크 */
let loginCheck = '${sessionScope.loginId}';
if (loginCheck.length == 0) {	   
   alert("로그인 후 이용가능합니다");
   location.href = "loadToLogin"
}
</script>



<script type="text/javascript">
	// 게시글 삭제 경고 모달창 close 하는 스크립트
 	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#bdWriteCancelCheckModal").modal("hide");
		});
	}
</script>

<script type="text/javascript">
	/* 페이지로드시 기존 글 지역 select */
	for (let i = 0; i < ubrgOp.options.length; i++){
		if (ubrgOp.options[i].value === ubrgcode) {
			ubrgOp.options[i].selected = 'true';
		}
		
	}

	/* 페이지로드시 글의 거래상태체크 */
		for (let i = 0; i < totalOp.options.length; i++) {
			if (totalOp.options[i].value === ubstate) {
				console.log('totalOp.options[i].value',
						totalOp.options[i].value);
				/* 글의 거래상태 option (9:거래완료 ,1:거래중)와 
				페이지 이동시 넘어온 글의 상태값 파라메터가 같을 경우 그 option에 selected 속성 추가*/
				totalOp.options[i].selected = 'true';

				if (ubstate === '9') { // 글의 상태값이 9(거래완료)이면 실행.
					console.log('ubstate', ubstate);
					document.getElementById("titleCheck").classList.add("line-through")
					document.getElementById("titleCheck").setAttribute("disabled", "disabled");

					for (let i = 0; i < gd_nameList.length; i++) {
						gd_nameList[i].classList.remove('d_none');
						gd_priceList[i].classList.remove('d_none');
						
						gd_names[i].classList.add('d_none');
						gd_price[i].classList.add('d_none');
						
						selectStates[i].setAttribute('disabled', 'disabled');
					}
					
				} else { //글의 상태값이 1(거래중)이면 실행
					document.getElementById("titleCheck").classList.remove("line-through")
					document.getElementById("titleCheck").removeAttribute("disabled");
					selectStates[i].removeAttribute('disabled');
				}
				
				for (let j = 0; j < select_gdstate.length; j++) {
					console.log("selectStates[j].selectedIndex : ",
							selectStates[j].selectedIndex);
					console.log("select_gdstate[j].value : ",
							select_gdstate[j].value);
					
					
					//상품별로 상태값에 따라 option을 selected

					if (select_gdstate[j].value === '0') {
						// 클래스가 select_gdstate 인 태그들 중 value가 0(거래완료)인 태그 찾고
						// 그 select태그와 인덱스 번호가 같은 selectStates 를 찾는다.
						// 찾은 selectStates의 option중 1번인덱스를 selected되도록 한다. 
						// 0번인덱스는 value 가 '1'(거래중), 1번인덱스는 value가 '0'(거래종료) 이다.  
				
						selectStates[j].selectedIndex = '1';  //(거래종료선택)

						//css속성 주기
						gd_nameList[j].classList.remove('d_none');
						gd_priceList[j].classList.remove('d_none');
						
						gd_names[j].classList.add('d_none');
						gd_price[j].classList.add('d_none');						
					
					} else {
						selectStates[j].selectedIndex = '0';
						//0번인덱스를 selected	(거래중선택)
									
					}
				}
				break;
			}
		}
</script>


<!-- 글상태 option선택 이벤트 -->
<script type="text/javascript">
	totalOp.addEventListener('change', selectOp_value);

	function selectOp_value(e) {
		console.log("e", e.target.value);		
		let select_ubstate = e.target.value;
		console.log("선택된 글의 상태값 : ", select_ubstate);
	

						if (select_ubstate === '9') {
							document.getElementById("titleCheck").classList.add("line-through")
							document.getElementById("titleCheck").setAttribute("disabled", "disabled");
							
							for (let i = 0; i < gd_nameList.length; i++) {

								gd_nameList[i].classList.remove('d_none');
								gd_priceList[i].classList.remove('d_none');
								
								gd_names[i].classList.add('d_none');
								gd_price[i].classList.add('d_none');
								
								//selectStates[i].selectedIndex = '1';
								selectStates[i].setAttribute('disabled', 'disabled');
							}

						} else {
							document.getElementById("titleCheck").classList.remove("line-through")
							document.getElementById("titleCheck").removeAttribute("disabled");
						
							
							for (let i = 0; i < gd_nameList.length; i++) {
							
								selectStates[i].removeAttribute('disabled');
															
								if (select_gdstate[i].value === '0') {
									console.log("상품거래완료");
									//selectStates[i].selectedIndex = '1';
									
									gd_nameList[i].classList.remove('d_none');
									gd_priceList[i].classList.remove('d_none');
									
									gd_names[i].classList.add('d_none');
									gd_price[i].classList.add('d_none');									
									

								} else {
									console.log("상품거래중");
									//selectStates[i].selectedIndex = '0';
									
									gd_nameList[i].classList.add('d_none');
									gd_priceList[i].classList.add('d_none');
									
									gd_names[i].classList.remove('d_none');
									gd_price[i].classList.remove('d_none');

								}
							}
						}
				

		if (totalOp.options[totalOp.selectedIndex].value == '9'){
			document.getElementById("titleCheck").classList.add("line-through")
			document.getElementById("titleCheck").setAttribute("disabled", "disabled");
		} else {
			document.getElementById("titleCheck").classList.remove("line-through")
			document.getElementById("titleCheck").removeAttribute("disabled");
		}
	}

	
	//		시간나면 연습용. 	이건 객체를 통째로 받아와서 스플릿 많이 해야함.   
	function resellState(selOP, geTest) {

		//console.log("글상태값 :", selOP.value);
		//console.log("코드 :", geTest);
	}
</script>


<%--
<!-- 상품 상태변경시 실행 스크립트  -->
<script type="text/javascript">
	/* 상품 상태변경 코드 */

	function select_option(sel_tag, gd_code) {

		console.log('매개변수확인(sel_tag) :', sel_tag.value);
		console.log('매개변수확인(gd_code) :', gd_code);

	}
</script>

<!-- 전페이지(상세페이지)로 돌아가기 -->
<script type="text/javascript">
	/* 수정취소 코드 */

	let cancelModify = document.querySelector("#cancelModify");
	cancelModify.addEventListener("click", backPage);
	function backPage() {
		console.log("수정취소버튼 클릭이벤트");
		location.href = "selectResellView?ubcode=" + ubcode + "&ubsellbuy="
				+ ubsellbuy + "&modifyCheck=LIST";
	}
</script>
 --%>

<!-- 상품 상태변경 ajax  -->
<script type="text/javascript">
	//상품 상태변경 ajax 

	function gdUpdateState(gdcode, sel_tag) {
		let gdstate = sel_tag.value;
		console.log('gdstate', gdstate);
		
				if (gdstate === '0') {
					sel_tag.selectedIndex = '1';

					for (let i = 0; i < select_gdcode.length; i++) {
						if (select_gdcode[i].value === gdcode) {
							
							gd_nameList[i].classList.remove('d_none');
							gd_priceList[i].classList.remove('d_none');
							
							gd_names[i].classList.add('d_none');
							gd_price[i].classList.add('d_none');
							
						}
					}
				} else {
					for (let i = 0; i < select_gdcode.length; i++) {
						if (select_gdcode[i].value === gdcode) {
							
							gd_nameList[i].classList.add('d_none');
							gd_priceList[i].classList.add('d_none');
							
							gd_names[i].classList.remove('d_none');
							gd_price[i].classList.remove('d_none');
						}
					}
				}
	}
</script>

<%--
<!-- 폼데이터 입력되었는지 체크하는 코드 스크립트  -->
<script type="text/javascript">
	/* 폼태그 데이터 공백 체크  */
	/* onsubmit이벤트  false 일시 submit이벤트 취소*/
	function checkFormData() {
		let checkForm = true;		
		console.log("폼데이터 핸들러 호출");
	
		
		if (document.getElementById("contentsCheck").value == '') {
			document.getElementById("contentsCheck").focus();
			alert("내용을 작성해주세요.");
			checkForm = false;

		} else if (document.getElementById("fileName").value == '') {
			alert("메인사진을 선택해주세요.");
			document.getElementById("chooseFile_id").focus();
			checkForm = false;
		} 
		
		return checkForm;
	}
</script>
 --%>
<script type="text/javascript">
	function bdWriteCancelCheckModal(){
	/* 게시글 작성 취소버튼 클릭시 모달 출력 */
	$("#bdWriteCancelCheckModal").modal('show');
}
</script>

<script type="text/javascript">
	// 게시글 삭제 경고 모달창 close 하는 스크립트
 	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#bdWriteCancelCheckModal").modal("hide");
		});
	}
</script>

<script type="text/javascript">

	function currentImgStateUpdate(id){
		console.log(id+"현재 이미지 파일 변경 요청");
		var imgname = $("#"+id).val();
		console.log(imgname);
		$("#"+id).val("del_"+imgname);
		$("#"+id+"_screen").css("display", "none");
		
	}

	
	$("#mainImg").change(function(){
		var mainImg = $("#mainImg").val().split("path")[1];
		mainImg = mainImg.substring(1);
		console.log("선택된메인이미지: "+mainImg);
		$("#mainImgScreen").val(mainImg);
	})
		
	$("#detailImg").change(function(){
		
		var detailImg = $("#detailImg")[0].files;
		console.log(detailImg);
		var output = "";
		for(var i=0; i<detailImg.length; i++){
			output += "<div>"+detailImg[i].name+"</div>";
		}
		$("#detailImgList").html(output);
	})
	
	function withdraw(){
		console.log("취소 버튼 클릭");
	}
	
	function cancelBtn() {
		console.log('취소버튼');
	location.href = 'selectResellView?ubcode='+ubcode+'&ubsellbuy='+ubsellbuy+'&modifyCheck=LIST'
	}

	function  roomModifyCh(currentDetailCount){
	
		console.log("자취방 자랑글 수정 확인");
		console.log(currentDetailCount);
	
		// 글상태를 거래완료로 변경했을 때 disabled 되어있던 상품상태값 value를 넘겨주기 위해 disabled 속성 삭제
		for (let i = 0; i < gd_nameList.length; i++) {
			selectStates[i].removeAttribute('disabled');
		}
		
		let detailImg = "";
		for(var i=0; i<currentDetailCount; i++){
			if($("#"+i+"_currentDetailimg").val() !== undefined){
				
			detailImg +="___";
			detailImg += $("#"+i+"_currentDetailimg").val();
			}
		}
		console.log(detailImg);
		
		$("#ubdetailimg").val(detailImg);
		
		if($("#ubtitle").val()==""){
			alert("제목을 입력하세요");
			return false;
		} else if ($("#ubcontents").val()==""){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>

<%--    나중에 시간있으면 수정
<!-- 이미지파일 미리보기 스크립트 -->
<script type="text/javascript">
	/*<!-- 이미지파일 미리보기 이벤트핸들러 호출 -->  */
	function loadFile(input) { // 함수가 호출된 태그를 인자로 받는다.( 여기선 input태그)
		
		let container =document.getElementById('image-show');	 
		let newImage = document.createElement("img");
		newImage.setAttribute("class", 'img');
		
		 
		if(container.hasChildNodes()){
			console.log("확인");
			console.log("container.hasChildNodes ", container.hasChildNodes());
			
		}
	
		let mainImg = document.getElementById('mainImg');
		mainImg.setAttribute('class', 'd_none');	
		 file = input.files[0]; //선택된 파일 가져오기 (하나의 파일만 업로드가능하므로 첫번째 인덱스인 0번을 사용)

		let name = document.getElementById('fileName');
		name.textContent = file.name; //미리 만들어 놓은 div에 text(파일 이름) 추가  () 

		//새로운 이미지 div 추가 (img태그 생성)

		// img태그에 'class'를 key로, 'img'를 value 로 준다.
	
		//이미지 source 가져오기
		newImage.src = URL.createObjectURL(file);

		newImage.style.width = "30%";
		newImage.style.height = "30%";
		newImage.style.objectFit = "contain";
		
		//이미지를 image-show div에 추가
		container.appendChild(newImage); //appendChild는 하나의 노드만 사용가능. 멀티플에는 사용하기어려움
		

		
	};
</script>


<!-- 멀티플파일 이미지 미리보기 -->
<script type="text/javascript">
	/* 멀티플파일 이미지 미리보기 */
	function loadMultiFile(input) {
		console.log('loadMultiFile호출 인자 : ', input);

		let name = document.getElementById('fileName_multi'); 	//이미지 명 div
		let container = document.getElementById('image-show_multi'); 	//이미지 출력 div
		let detailImg = document.getElementsByClassName('detailImg_');	//
		for(detailImgHide of detailImg){
			detailImgHide.setAttribute('class', 'd_none');	
					}
		
		let newImage_ = [];

		// input태그(type속성의 value가 files인 경우  
		for (let i = 0; i < input.files.length; i++) {
			
			
			
			name.append(input.files[i].name + ' ');

			//배열에 push
			newImage_.push(document.createElement("img"));

			//만들어진 img 태그에 인덱스별로 class속성과 img 값을 준다.
			//그리고 소스를 담아주고, 스타일도 지정해준다.

			newImage_[i].setAttribute("class", 'img');
			newImage_[i].src = URL.createObjectURL(input.files[i]);
			newImage_[i].style.width = "30%";
			newImage_[i].style.height = "30%";
			newImage_[i].style.objectFit = "contain";

			//img 태그를 모두출력
			container.append(newImage_[i]);

			console.log('newImage_ : ', newImage_[i]);
			console.log('input.files : ', input.files[i]);
			
			
		}

	};

 <%--  --%>

<%-- 
		let input_detailImgTag = [];
		for(let i = 0; i < deleteImage.length; i++{
			input_detailImgTag.push(document.createElement('input'));  // 배열길이 만큼 input태그만들기
			input_detailImgTag[i].value = deleteImage[i];
			console.log("input태그 VALUE : " , input_detailImgTag[i].value);
			
		}
		
</script>


<!-- 이미지 삭제 스크립트 -->
<script type="text/javascript">
/* 삭제 버튼 클릭 이벤트핸들러 */
	function hide_Img(selectTag, detailName) {
		let detailImg_Arry = document.getElementsByClassName('detailImg_Arry');
		let deleteImage = [];
		console.log('detailImgHide 호출 ');
		console.log('selectTag 선택된태그 : ', selectTag);
		console.log('detailImg 선택된이미지명 : ', detailName);
		
	
		for(let i = 0; i< detailImg_Arry.length; i++){
			console.log('detailImg_Arry 상세이미지명 : ', detailImg_Arry[i].innerText);
			if(detailImg_Arry[i].innerText===detailName){
							
				deleteImage.push(detailName);
				
			}
			
		}
for(dImage of deleteImage){		 //배열에 데이터 들어갔는지 확인
			console.log("dImage 전송안할 이미지: ", dImage);
}
	
	}
	
	
	
	
</script>
--%>


</html>