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
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"
>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/resell.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"
></script>
<style type="text/css">
.product-img {
	max-width: 30%;
	max-height: 30%;
	objetFit: contain;
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
				<h1 class="text-center" id="titleMsg"></h1>

				<form action="updateResellModify" method="post" enctype="multipart/form-data" onsubmit="return checkFormData()">
					<input type="hidden" name="ubcode" value="${ub_resellView.ubcode}"> <input type="hidden" name="ubmid" value="${ub_resellView.ubmid}">
					<input type="hidden" name="ubsellbuy" value="${ub_resellView.ubsellbuy}">

					<div class="container-header">
						<div class="container-flex_1 flex_between">
							<div class="item_start">
								<span> <select class="select-size" id="totalOp" name="ubstate" onchange="resellState(this,'${gd_resellView}')">
										<option value="1">판매중</option>
										<option value="9">판매완료</option>
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

										<select class="selectState" name="gd_state" onchange="select_option(this, '${gdList.gdcode }','')">
											<option value="1">판매중</option>
											<option value="0">판매완료</option>
										</select>

									</div>
									<input type="hidden" class="select_gdcode" name="gd_code" value="${gdList.gdcode }"> <input type="hidden" class="select_gdstate"
										value="${gdList.gdstate }"
									>
									<div class="item-basis_2 gd_nameList">${gdList.gdname }</div>
									<div class="item-basis_3 gd_priceList">${gdList.gdprice }</div>
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
						<div>
							<div>사진첨부</div>
							<div class="">
								<div class="button">
									<label for="chooseFile_id"> 👉 CLICK HERE! 👈 </label>
								</div>
								<input type="file" class="chooseFile" id="chooseFile_id" name="chooseFile" accept="image/*" onchange="loadFile(this)" name="ubmainimgfile">
								<div id="image-show">
									<img src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg }" class="product-img">
								</div>
								<div id="fileName">${ub_resellView.ubmainimg }</div>
							</div>

							<div class="">
								<div class="button">
									<label for="chooseMultiFile"> 👉 CLICK HERE! 👈 </label>
								</div>
								<input type="file" id="chooseMultiFile" class="chooseFile" onchange="loadMultiFile(this)" multiple="multiple" name="ubdetailimgfile">


								<div id="image-show_multi">
									<c:forEach items="${ub_resellView.ubdetailimg_list }" var="ubdetailimg_list" begin="1" varStatus="status">
										<img src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}" class="product-img" id="detailimg${status.count }">
										<input type="button" onclick="hide_Img(this,'${ubdetailimg_list}','${status.count }')" value="삭제">

									</c:forEach>
								</div>
								<div id="fileName_multi">

									<c:forEach items="${ub_resellView.ubdetailimg_list }" var="ubdetailimg_list" begin="1">

										<span>${ubdetailimg_list }</span>
									</c:forEach>
								</div>

							</div>
						</div>
					</div>
					<div class="container-flex_1 flex-end">
						<div>
							<input type="button" id="cancelModify" value="취소">
						</div>

						<div>
							<button type="submit">등록</button>
						</div>
					</div>
				</form>


			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"
	></script>
</body>
<!-- 페이지로드시 실행할 코드 스크립트 -->
<script type="text/javascript">
	const ubstate = '${ub_resellView.ubstate}'; // 글 상태 값 
	const totalOp = document.getElementById("totalOp"); // 글 상태 select태그
	const ubcode = '${ub_resellView.ubcode}'; //글번호
	const sellbuy = '${ub_resellView.ubsellbuy}'; //사구,팔구 확인
	const selectStates = document.querySelectorAll(".selectState"); // 상품 상태 select태그 (복수 , c:forEach태그안에 있음) 
	const select_gdcode = document.querySelectorAll(".select_gdcode"); //상품코드	(복수 , c:forEach태그안에 있음) 
	const select_gdstate = document.querySelectorAll(".select_gdstate");//상품상태 (복수 , c:forEach태그안에 있음) 
	const gd_nameList = document.querySelectorAll(".gd_nameList"); //상품명 (복수 , c:forEach태그안에 있음)
	const gd_priceList = document.querySelectorAll(".gd_priceList"); //상품가격 (복수 , c:forEach태그안에 있음))
</script>


<script type="text/javascript">
	//페이지로드시 무조건실행
	window.onload = function() {
		/* 로그인된 회원인지 체크 */
		let loginCheck = '${sessionScope.loginId}';
		if (loginCheck.length == 0) {
			alert("잘못된 접근입니다.");
			location.href = "loadToLogin"

		}

		/* 페이지로드시 글의 판매상태체크 */

		for (var i = 0; i < totalOp.options.length; i++) {
			if (totalOp.options[i].value == ubstate) {
				/* 글의 판매상태 option (9:판매완료 ,1:판매중)와 
				페이지 이동시 넘어온 글의 상태값 파라메터가 같을 경우 그 option에 selected 속성 추가*/
				totalOp.options[i].selected = 'true';

				if (ubstate == '9') { // 글의 상태값이 9(판매완료)이면 실행.
					document.getElementById("titleMsg").innerText = "판매완료된 글입니다.";

					for (var j = 0; j < select_gdstate.length; j++) {

						selectStates[j].selectedIndex = '0';
						// 모든 상품들의 상태 값을 0(판매완료)으로 변경.
					}

				} else { //글의 상태값이 1(판매중)이면 실행
					document.getElementById("titleMsg").innerText = "판매중";

					for (var j = 0; j < select_gdstate.length; j++) {
						console.log("selectStates[j].selectedIndex : ",
								selectStates[j].selectedIndex);
						console.log("select_gdstate[j].value : ",
								select_gdstate[j].value);

						//상품별로 상태값에 따라 option을 selected

						if (select_gdstate[j].value == 0) {
							// 클래스가 select_gdstate 인 태그들 중 value가 0(판매완료)인 태그 찾고
							// 그 인덱스인 [j]를 select태그의 클래스인 selectStates에 사용하여
							// 같은 인덱스[j]에 있는 select태그를 지정한다. 
							// 그 태그의 1번인덱스( 0번인덱스는 1(판매중), 1번인덱스는 0(판매종료)) 가 selected 되도록한다.
							selectStates[j].selectedIndex = '1';

							//css속성 주기
							gd_nameList[j].classList.add('line-through');
							gd_priceList[j].classList.add('line-through');

						} else {
							selectStates[j].selectedIndex = '0';
							//0번인덱스를 selected	(판매중)

						}
					}
				}
				break;
			}
		}
	}
</script>



<!-- select태그 option선택 이벤트 -->
<script type="text/javascript">
	totalOp.addEventListener('change', selectOp_value);

	function selectOp_value(e) {
		console.log("e", e.target.value);
		let gd_state = [];
		let gd_code = [];
		let select_ubstate = e.target.value;

		for ( var i in select_gdstate) {
			console.log(select_gdstate[i].value);
			console.log(select_gdcode[i].value);
			if (select_gdstate[i].value != undefined) {

				gd_state.push(select_gdstate[i].value);

				gd_code.push(select_gdcode[i].value);

			}
		}
		console.log("상품의 상태 : ", gd_state);
		console.log("상품의 번호 : ", gd_code);
		console.log("글 번호 : ", ubcode);
		console.log("글 상태 : ", select_ubstate)
		$
				.ajax({
					type : 'get',
					url : 'updateResellState_usedBoardAjax',
					data : {
						'ubcode' : ubcode,
						'ubstate' : select_ubstate
					},

					success : function(result) {
						console.log("결과", result);
						if (result == 'SOLD') {
							alert("변경성공 = 판매완료");
							document.getElementById("titleMsg").innerText = "판매완료된 글입니다.";

							for (let i = 0; i < selectStates.length; i++) {

								gd_nameList[i].classList.add('line-through');
								gd_priceList[i].classList.add('line-through');
								selectStates[i].setAttribute('disabled',
										'disabled');
							}

						} else {
							alert("변경성공 = 판매중");
							document.getElementById("titleMsg").innerText = "판매중";
							for (let i = 0; i < selectStates.length; i++) {
								selectStates[i].removeAttribute('disabled');
								gd_nameList[i].classList.remove('line-through');
								gd_priceList[i].classList
										.remove('line-through');
								if (select_gdstate[i].value == 0) {
									console.log("상품판매완료");
									selectStates[i].selectedIndex = '1';

									gd_nameList[i].classList
											.add('line-through');
									gd_priceList[i].classList
											.add('line-through');

								} else {
									console.log("상품판매중");
									selectStates[i].selectedIndex = '0';
									gd_nameList[i].classList
											.remove('line-through');
									gd_priceList[i].classList
											.remove('line-through');

								}
							}
						}
					}
				})

		totalOp.options[totalOp.selectedIndex].value == '9' ? document
				.getElementById("titleMsg").innerText = "판매완료된 글입니다."

		: document.getElementById("titleMsg").innerText = "판매중";
	}

	//		시간나면 연습용. 	이건 객체를 통째로 받아와서 스플릿 많이 해야함.   
	function resellState(selOP, geTest) {

		console.log("글상태값 :", selOP.value);
		console.log("코드 :", geTest);
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
				+ sellbuy + "&modifyCheck=LIST";
	}
</script>


<!-- 상품 상태변경시 실행 스크립트  -->
<script type="text/javascript">
	/* 상품 상태변경 코드 */

	function select_option(sel_tag, gd_code) {

		console.log('매개변수확인(sel_tag) :', sel_tag.value);
		console.log('매개변수확인(gd_code) :', gd_code);

	}
</script>


<!-- 상품 상태변경 ajax  -->
<script type="text/javascript">
	//상품 상태변경 ajax 

	function gdUpdateState(gdcode, sel_tag) {
		let gdstate = sel_tag.value;

		$.ajax({
			type : 'get',
			url : 'updateResellState_GoodsAjax',
			data : {

				'gdcode' : gdcode,
				'gdstate' : gdstate
			},
			success : function(result) {
				console.log(result);
				if (result == 'SOLD') {
					alert("상품판매완료")
					sel_tag.selectedIndex = '1';

					for (let i = 0; i < select_gdcode.length; i++) {
						if (select_gdcode[i].value === gdcode) {
							gd_nameList[i].classList.add('line-through');
							gd_priceList[i].classList.add('line-through');

						}
					}
				} else {
					alert("상품판매중")
					for (let i = 0; i < select_gdcode.length; i++) {
						if (select_gdcode[i].value === gdcode) {
							gd_nameList[i].classList.remove('line-through');
							gd_priceList[i].classList.remove('line-through');

						}
					}
				}
			}
		})
	}
</script>


<!-- 이미지파일 미리보기 스크립트 -->
<script type="text/javascript">
	/*<!-- 이미지파일 미리보기 이벤트핸들러 호출 -->  */
	function loadFile(input) { // 함수가 호출된 태그를 인자로 받는다.( 여기선 input태그)

		let file = input.files[0]; //선택된 파일 가져오기 (하나의 파일만 업로드가능하므로 첫번째 인덱스인 0번을 사용)

		let name = document.getElementById('fileName');
		name.textContent = file.name; //미리 만들어 놓은 div에 text(파일 이름) 추가  () 

		//새로운 이미지 div 추가 (img태그 생성)
		let newImage = document.createElement("img");

		// img태그에 'class'를 key로, 'img'를 value 로 준다.
		newImage.setAttribute("class", 'img');

		//이미지 source 가져오기
		newImage.src = URL.createObjectURL(file);

		newImage.style.width = "30%";
		newImage.style.height = "30%";
		newImage.style.objectFit = "contain";

		//이미지를 image-show div에 추가
		let container = document.getElementById('image-show');
		container.appendChild(newImage); //appendChild는 하나의 노드만 사용가능. 멀티플에는 사용하기어려움
	};
</script>

<!-- 멀티플파일 이미지 미리보기 -->
<script type="text/javascript">
	/* 멀티플파일 이미지 미리보기 */
	function loadMultiFile(input) {
		console.log('loadMultiFile호출 인자 : ', input);

		let name = document.getElementById('fileName_multi');
		let container = document.getElementById('image-show_multi');

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

<script type="text/javascript">


function hide_Img(selectTag, detailImg, selectIndex) {
	console.log('detailImgHide 호출 ');
	
	let detailImg = document.getElementById('detailImg' + ${selectIndex});
	
	
	console.log('selectTag 호출 : ', selectTag);
	console.log('detailImg 호출 : ', detailImg);
	console.log('selectIndex 호출 : ', selectIndex);
	console.log(' detailImg+selectIndex 호출 : ',  detailImg+selectIndex);
	
	
	
}

</script>


</html>