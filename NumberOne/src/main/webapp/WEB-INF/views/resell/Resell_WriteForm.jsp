<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래 상세페이지</title>

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

				<form action="insertResellWrite" method="post" enctype="multipart/form-data" onsubmit="return checkFormData()">
					<div class="container-header">
						<div class="container-flex_1 flex_between">
							<div class="item_start">
								<span> <select class="select-size" id="boardTitle" name="ubsellbuy">
										<option value="S">팔구</option>
										<option value="B">사구</option>
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

							<div class="item_end">작성자 : ${mNickname }</div>

						</div>

						<div>
							글제목 <input type="text" size="60" style="margin-left: 40px;" id="titleCheck" name="ubtitle"> <span class="checkMsg"></span>
						</div>


						<div class="container-card_goods">

							<div class="container-card_goods_2">
								<div class="item-basis_7 flex-shrink">
									<input type="text" name="gd_names" size="60" placeholder="품목명" class="gdcheck_n">
								</div>
								<div class="item-basis_3 flex-shrink">
									<input type="text" size="20" placeholder="가격" name="gd_price" class="gdcheck_p">
								</div>

							</div>
							<div class="container-flex_1 flex-end flex-shrink">
								<div class="addBtn">+추가</div>
							</div>

							<div class="d_none btn_d-none">
								<div class="container-card_goods_2">
									<div class="item-basis_7 flex-shrink">
										<input type="text" size="60" placeholder="품목명" class="gdcheck_n">
									</div>
									<div class="item-basis_3 flex-shrink">
										<input type="text" size="20" placeholder="가격" class="gdcheck_p">
									</div>

								</div>

								<div class="container-flex_1 flex-end">
									<div class="addBtn">+추가</div>
									<div class="removeBtn">제거</div>
								</div>
							</div>

							<div class="d_none btn_d-none">
								<div class="container-card_goods_2">
									<div class="item-basis_7 flex-shrink">
										<input type="text" size="60" placeholder="품목명" class="gdcheck_n">
									</div>
									<div class="item-basis_3 flex-shrink">
										<input type="text" size="20" placeholder="가격" class="gdcheck_p">
									</div>


								</div>
								<div class="container-flex_1 flex-end flex-shrink">
									<div class="addBtn">+추가</div>
									<div class="removeBtn">제거</div>
								</div>
							</div>

							<div class="d_none btn_d-none">

								<div class="container-card_goods_2">
									<div class="item-basis_7 flex-shrink">
										<input type="text" size="60" placeholder="품목명" class="gdcheck_n">
									</div>
									<div class="item-basis_3 flex-shrink">
										<input type="text" size="20" placeholder="가격" class="gdcheck_p">
									</div>
								</div>
								<div class="container-flex_1 flex-end">
									<div class="addBtn">+추가</div>
									<div class="removeBtn">제거</div>
								</div>
							</div>

							<div class="d_none btn_d-none">
								<div class="container-card_goods_2">
									<div class="item-basis_7 flex-shrink">
										<input type="text" size="60" placeholder="품목명" class="gdcheck_n">
									</div>
									<div class="item-basis_3 flex-shrink">
										<input type="text" size="20" placeholder="가격" class="gdcheck_p">
									</div>
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
							<textarea rows="4" cols="80" style="resize: none" name="ubcontents" id="contentsCheck">상품상세설명</textarea>

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
								<input type="file" class="chooseFile" id="chooseFile_id"  accept="image/*" onchange="loadFile(this)" name="ubmainimgfile">
								<div id="image-show"></div>
								<div id="fileName"></div>
							</div>

							<div class="">
								<div class="button">
									<label for="chooseMultiFile"> 👉 CLICK HERE! 👈 </label>
								</div>
								<input type="file" id="chooseMultiFile" class="chooseFile" onchange="loadMultiFile(this)" multiple="multiple" name="ubdetailimgfile">
								<div id="image-show_multi"></div>
								<div id="fileName_multi"></div>
							</div>
						</div>
					</div>
					<div class="container-flex_1 flex-end">
						<div>취소</div>
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
	//페이지로드시 무조건실행
	window.onload = function() {
		/* 로그인된 회원인지 체크 */
		var loginCheck = '${sessionScope.loginId}';
		if (loginCheck.length == 0) {
			alert("잘못된 접근입니다.");
			location.href = "loadToLogin";
		}

		var boardTitle = document.getElementById("boardTitle"); //select태그지정

		/* 페이지이동 시 어느게시판에서 넘어왔는지 파라메터를 통해 확인 */
		var sell_buy = '${sell_buy}'; // 'S'  or  'B'

		/* 사구, 팔구 중 어느게시판에서 글작성눌렀는지 확인해서 출력  */
		for (var i = 0; i < boardTitle.options.length; i++) {
			// select태그의 option태그 갯수(길이)만큼 for문 반복 실행
			if (boardTitle.options[i].value == sell_buy) {
				//option태그의 value 가 sell_buy 변수 값과 일치하는 option 찾기
				boardTitle.options[i].selected = 'true'
				//일치하는 option에 selected 속성을 준다.
				sell_buy == 'B' ? document.getElementById("titleMsg").innerText = "사구게시판 글작성"
						: document.getElementById("titleMsg").innerText = "팔구게시판 글작성";
				//그리고 sell_buy의 값에 따라 Text를 다르게 출력한다. 
				break;
				//일치하는 값을 찾으면 break 로 for문 종료
			}
		}
	}
</script>


<!-- select태그 option선택 이벤트 -->
<script type="text/javascript">
	boardTitle.addEventListener('change', selectSB);

	function selectSB() {

		boardTitle.options[boardTitle.selectedIndex].value == 'B' ? document
				.getElementById("titleMsg").innerText = "사구게시판 글작성" : document
				.getElementById("titleMsg").innerText = "팔구게시판 글작성";
	}
</script>


<!-- 품목추가,제거 이벤트 -->
<script type="text/javascript">
	/* 추가버튼 변수 */
	var addBtn0 = document.getElementsByClassName("addBtn")[0];
	var addBtn1 = document.getElementsByClassName("addBtn")[1];
	var addBtn2 = document.getElementsByClassName("addBtn")[2];
	var addBtn3 = document.getElementsByClassName("addBtn")[3];

	/* 제거버튼 변수*/
	var removeBtn0 = document.getElementsByClassName("removeBtn")[0];
	var removeBtn1 = document.getElementsByClassName("removeBtn")[1];
	var removeBtn2 = document.getElementsByClassName("removeBtn")[2];
	var removeBtn3 = document.getElementsByClassName("removeBtn")[3];

	/* input태그의 부모div */
	var dsiplay_btn0 = document.getElementsByClassName("btn_d-none")[0];
	var dsiplay_btn1 = document.getElementsByClassName("btn_d-none")[1];
	var dsiplay_btn2 = document.getElementsByClassName("btn_d-none")[2];
	var dsiplay_btn3 = document.getElementsByClassName("btn_d-none")[3];

	/* 품목이름 변수 */
	var gdcheck_n1 = document.getElementsByClassName("gdcheck_n")[1];
	var gdcheck_n2 = document.getElementsByClassName("gdcheck_n")[2];
	var gdcheck_n3 = document.getElementsByClassName("gdcheck_n")[3];
	var gdcheck_n4 = document.getElementsByClassName("gdcheck_n")[4];

	/* 품목가격 변수  */
	var gdcheck_p1 = document.getElementsByClassName("gdcheck_p")[1];
	var gdcheck_p2 = document.getElementsByClassName("gdcheck_p")[2];
	var gdcheck_p3 = document.getElementsByClassName("gdcheck_p")[3];
	var gdcheck_p4 = document.getElementsByClassName("gdcheck_p")[4];

	/* 추가, 제거 버튼 클릭시 이벤트 */
	addBtn0.onclick = function() {
		console.log("addBtn0 호출");
		dsiplay_btn0.classList.remove("d_none");
		gdcheck_n1.setAttribute("name", "gd_names");
		gdcheck_p1.setAttribute("name", "gd_price");

	};
	addBtn1.onclick = function() {
		dsiplay_btn1.classList.remove("d_none");
		gdcheck_n2.setAttribute("name", "gd_names");
		gdcheck_p2.setAttribute("name", "gd_price");
	};
	addBtn2.onclick = function() {
		dsiplay_btn2.classList.remove("d_none");
		gdcheck_n3.setAttribute("name", "gd_names");
		gdcheck_p3.setAttribute("name", "gd_price");
	};
	addBtn3.onclick = function() {
		dsiplay_btn3.classList.remove("d_none");
		gdcheck_n4.setAttribute("name", "gd_names");
		gdcheck_p4.setAttribute("name", "gd_price");
	};
	removeBtn3.onclick = function() {
		dsiplay_btn3.classList.add("d_none");
		gdcheck_n4.removeAttribute("name", "gd_names");
		gdcheck_p4.removeAttribute("name", "gd_price");
	}
	removeBtn2.onclick = function() {
		dsiplay_btn2.classList.add("d_none");
		gdcheck_n3.removeAttribute("name", "gd_names");
		gdcheck_p3.removeAttribute("name", "gd_price");
	}
	removeBtn1.onclick = function() {
		dsiplay_btn1.classList.add("d_none");
		gdcheck_n2.removeAttribute("name", "gd_names");
		gdcheck_p2.removeAttribute("name", "gd_price");
	}
	removeBtn0.onclick = function() {
		dsiplay_btn0.classList.add("d_none");
		gdcheck_n1.removeAttribute("name", "gd_names");
		gdcheck_p1.removeAttribute("name", "gd_price");
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

<!-- 이미지파일 미리보기 스크립트 -->
<script type="text/javascript">
/*<!-- 이미지파일 미리보기 이벤트핸들러 호출 -->  */
	function loadFile(input) { // 함수가 호출된 태그를 인자로 받는다.( 여기선 input태그)
		
		let file = input.files[0]; //선택된 파일 가져오기 (하나의 파일만 업로드가능하므로 첫번째 인덱스인 0번을 사용)

		
		let name = document.getElementById('fileName');
		name.textContent = file.name;	//미리 만들어 놓은 div에 text(파일 이름) 추가  () 

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
		container.appendChild(newImage);   //appendChild는 하나의 노드만 사용가능. 멀티플에는 사용하기어려움
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
</html>