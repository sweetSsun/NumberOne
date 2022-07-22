<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래 상세페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"
></script>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"
>
<style type="text/css">
		div .d_none{
	display: none;
	}
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	select{
		width: 200px;
		text-align : center;
		border : none;
		color : #004804;
	}
	option{
		color : #00bcd4;
		font-weight: bold;
	}
	.bdtitle{
		border: none;
		font-weight: bold;
		font-size: 20px;
		margin: auto;
		height: 22px;
	}
	.ubcontents{
		border-radius: 5px;
		border: solid gray 2px;
		font-size: 19px;
		resize: none;
	}
	.btn-wrapper{
		width: 100%;
		text-align: center;
		display:inline-block;
		
		
	}
	.buttons{
		margin: auto; /* 수평 */
		display: block; /* 수직 */
		
	}
	.selectPlaceHolder{
		display: none;
	}
	textarea{
		spellcheck: false;
		resize: none;
		
	}
	textarea:focus {
 	   outline: none;
	}
	input:focus{
	   outline: none;	
	}
	.bdCategoryList{
		color : #00bcd4;
		border: none;
		font-size: 20px;
	}
	.bdRegionSel{
		color : #00bcd4;
		border: none;
		font-size: 20px;
	}
	.nickname{
		color : #00bcd4;
		border: none;
		font-size: 20px;
		margin-left: 20px;
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
					<div class="row">
					<div class="col-6">
								<span> <select class="bdCategoryList" id="resellTitle" name="ubsellbuy">
										<option value="S">팔구</option>
										<option value="B">사구</option>
								</select>
								</span>  <select class="bdCategoryList" name="ubrgcode" id="regionCheck">
										<option value="" selected>필수</option>
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

							<div class="col-2">작성자  </div>

						

						<div class="col-4">
							${mNickname }
						</div>

</div>
<hr>
	<div class="row">
<input type="text" size="60" style="margin-left: 40px;" id="titleCheck" name="ubtitle"> <span class="checkMsg"></span> 
</div>
<hr>
	<div class="row">
		<div class="col-8">
		<input type="text" name="gd_names" size="60" placeholder="품목명">
		</div>
		
		<div class="col-4">
		<input type="text" size="20" placeholder="가격" name="gd_price">
						</div>
	<hr>
	<div id="addBtn">+추가</div>
		
	</div>
		<div class="row d_none btn_d-none">
		<div class="col-8">
		<input type="text" name="" size="60" placeholder="품목명" class="gdcheck_n">
		</div>
		
		<div class="col-4">
		<input type="text" size="20" placeholder="가격" name="" class="gdcheck_p">
						</div>
			<div class="removeBtn">제거</div>
	</div>
		<div class="row d_none btn_d-none">
		<div class="col-8">
		<input type="text" name="" size="60" placeholder="품목명" class="gdcheck_n">
		</div>
		
		<div class="col-4">
		<input type="text" size="20" placeholder="가격" name="" class="gdcheck_p">
						</div>
			<div class="removeBtn">제거</div>
	</div>
		<div class="row d_none btn_d-none">
		<div class="col-8">
		<input type="text" name="" size="60" placeholder="품목명" class="gdcheck_n">
		</div>
		
		<div class="col-4">
		<input type="text" size="20" placeholder="가격" name="" class="gdcheck_p">
						</div>
	<hr>
			<div class="removeBtn">제거</div>
	</div>
		<div class="row d_none btn_d-none">
		<div class="col-8">
		<input type="text" name="" size="60" placeholder="품목명" class="gdcheck_n">
		</div>
		
		<div class="col-4 ">
		<input type="text" size="20" placeholder="가격" name="" class="gdcheck_p">
						</div>
	<hr>
			<div class="removeBtn">제거</div>
	</div>
	<hr>
	
	
	
	
	<div class="row">
				<textarea rows="17" cols="80" name="ubcontents" id="contentsCheck" class="ubcontents" placeholder="상품상세설명"></textarea>
				</div>		
						
					</div>





					<!-- 이미지첨부  -->
					<!-- 메인사진 -->
							<div class="row" style="margin-top: 3%;">
					<div id="bdimgScreen" style="width:200px; height:150px;" class="d_none">
					<img id='previewBdmig' style="width:100%; height:100%;"></img>
					</div>
					<input type="file" id="mainImg" name="ubmainimgfile" accept="image/*"> 
				</div>	
				
				
				<!-- 상세사진 -->
					<div class="row" style="margin-top: 3%;">
				<div id="bddetailimgScreen" style="width:100%;" class="row"></div>
				<input type="file" multiple="multiple" id="detailImg" name="ubdetailimgfile" onclick="return mainimgCh()" accept="image/*">
				</div>
				
				<!-- 작성취소버튼 -->
					<div class="row mt-4">
					<div class="col btn-wrapper">
						<input class="btn btn-lg buttons fw-bold text-white" style="background-color:#00bcd4;" type="submit" value="작성">
						<input onclick="bdWriteCancelCheckModal()" style="background-color:#00bcd4;" class="btn btn-lg buttons fw-bold text-white" type="button" value="취소">
					</div>
				</div>
			</form>
				
	

			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

<div class="modal fade" id="bdWriteCancelCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 게시글 작성 취소 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	<span class="fw-bold">게시글 작성을 취소하시겠습니까?</span>
                	<br>
                	<span class="fw-bold">이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.</span>
                </div>	
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn btn-info text-white"  onclick="cancelBtn()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"
	></script>
</body>
<!-- 페이지로드시 실행할 코드 스크립트 -->
<script type="text/javascript">
		// 게시글 작성 취소 경고 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#bdWriteCancelCheckModal").modal("hide");
			});
		}
	function bdWriteCancelCheckModal(){
		/* 게시글 작성 취소버튼 클릭시 모달 출력 */
		$("#bdWriteCancelCheckModal").modal('show');
	}
</script>
<script type="text/javascript">
//bdimg 미리보기
function readBdimg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = (e) => {
        	console.log(input.files[0].type)
        	if(! input.files[0].type.match("image.*")){
        		console.log("이미지 파일 아님");
            	alert("이미지 파일만 등록 가능합니다!");
            	$("#mainImg").val("");
            	$("#previewBdimg").attr("src", "");
            	$("#bdimgScreen").addClass("d_none");
            	return;
            	//$("#detailImg").replaceWith($("#detailImg").clone(true));
        	}
            var previewImage = document.getElementById('previewBdmig');
            previewImage.src = e.target.result;
            //previewImage.alt = input.files[0].name();
            $("#bdimgScreen").removeClass("d_none");
            
        }
        reader.readAsDataURL(input.files[0]);
    }
}

//bdmig input 파일 업로드 시 readBdimg 함수 호출하기
document.getElementById('mainImg').addEventListener('change', (e) => {
	readBdimg(e.target);
})

//bddetailimg input 파일 업로드 시 미리보기 보여주기
function readMultipleImage(input) {
	console.log("readMultipleImage() 호출");
    const multipleContainer = document.getElementById("bddetailimgScreen");
    $("#bddetailimgScreen").html("");
    
    // 인풋 태그에 파일들이 있는 경우
    if(input.files) {
        // 이미지 파일 검사 (생략)
        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
        const fileArr = Array.from(input.files);
        
        const $colDiv = document.createElement("div")
        $colDiv.style.display = "inline-block";
        
        fileArr.forEach((file, index) => {
        	console.log(file.type);
            if(! file.type.match("image.*")){
            	console.log("이미지 파일 아님");
            	alert("이미지 파일만 등록 가능합니다!");
            	$("#detailImg").val("");
            	//$("#detailImg").replaceWith($("#detailImg").clone(true));
            	return;
            }
        	
        	const reader = new FileReader()
            
            const $imgDiv = document.createElement("div")   
            $imgDiv.style.width = "200px";
            $imgDiv.style.height = "150px";
            $imgDiv.style.display = "inline-block";
            const $img = document.createElement("img");
            $imgDiv.appendChild($img)
            
            reader.onload = e => {
                $img.src = e.target.result;
                $img.alt = file.name;
                $img.title = file.name;
                $img.style.width = "100%";
                $img.style.height = "100%";
            }
            
            //console.log(file.name)
            $colDiv.appendChild($imgDiv);

            reader.readAsDataURL(file);
        })
        
        multipleContainer.appendChild($colDiv);

    }
}

const inputMultipleImage = document.getElementById("detailImg");
inputMultipleImage.addEventListener("change", e => {
    readMultipleImage(e.target);
})

</script>

<script type="text/javascript">
$("#mainImg").change(function(){
	var mainImg = $("#mainImg").val().split("path")[1];
	mainImg = mainImg.substring(1);
	console.log("선택된메인이미지: "+mainImg);
	$("#mainImgScreen").val(mainImg);
})

/*
$("#detailImg").change(function(){
	
	var detailImg = $("#detailImg")[0].files;
	console.log(detailImg);
	var output = "";
	for(var i=0; i<detailImg.length; i++){
		output += "<div>"+detailImg[i].name+"</div>";
	}
	$("#detailImgList").html(output);
})
*/
function withdraw(){
	console.log("취소 버튼 클릭");
}

function mainimgCh(){
	console.log("메인이미지 확인 함수");
	var mainImg = $("#mainImg").val();
	console.log(mainImg);
	if(mainImg==""){
		alert("대표 사진을 먼저 선택하세요!");
		return false;
	}
} 


</script>

<script type="text/javascript">
		/* 로그인된 회원인지 체크 */
		let loginCheck = '${sessionScope.loginId}';
		if (loginCheck.length == 0) {
			alert("잘못된 접근입니다.");
			location.href = "loadToLogin";
		}

		
		
		
		const resellTitle = document.getElementById("resellTitle"); //select태그지정

		/* 페이지이동 시 어느게시판에서 넘어왔는지 파라메터를 통해 확인 */
		let sell_buy = '${sell_buy}'; // 'S'  or  'B'

		/* 사구, 팔구 중 어느게시판에서 글작성눌렀는지 확인해서 출력  */
		for (let i = 0; i < resellTitle.options.length; i++) {
			// select태그의 option태그 갯수(길이)만큼 for문 반복 실행
			if (resellTitle.options[i].value == sell_buy) {
				//option태그의 value 가 sell_buy 변수 값과 일치하는 option 찾기
				resellTitle.options[i].selected = 'true'
				//일치하는 option에 selected 속성을 준다.
				sell_buy == 'B' ? document.getElementById("titleMsg").innerText = "사구게시판 글작성"
						: document.getElementById("titleMsg").innerText = "팔구게시판 글작성";
				//그리고 sell_buy의 값에 따라 Text를 다르게 출력한다. 
				break;
				//일치하는 값을 찾으면 break 로 for문 종료
			}
		}
</script>


<!-- 타이블메세지 변경 option선택 이벤트 -->
<script type="text/javascript">
	resellTitle.addEventListener('change', selectSB);

	function selectSB() {
if(resellTitle.options[resellTitle.selectedIndex].value == 'B'){
	document.getElementById("titleMsg").innerText = "사구게시판 글작성";
	sell_buy = 'B';
}else{
	 document.getElementById("titleMsg").innerText = "팔구게시판 글작성";
	 sell_buy = 'S';
}
	
	}
</script>
<script type="text/javascript">
		// 게시글 작성 취소 경고 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#bdWriteCancelCheckModal").modal("hide");
			});
		}
	function bdWriteCancelCheckModal(){
		/* 게시글 작성 취소버튼 클릭시 모달 출력 */
		$("#bdWriteCancelCheckModal").modal('show');
	}
</script>

<!-- 품목추가,제거 이벤트 -->
<script type="text/javascript">
	/* 추가버튼 변수 */
	let addBtn = document.getElementById("addBtn");

	/* 제거버튼 변수*/
	let removeBtn0 = document.getElementsByClassName("removeBtn")[0];
	let removeBtn1 = document.getElementsByClassName("removeBtn")[1];
	let removeBtn2 = document.getElementsByClassName("removeBtn")[2];
	let removeBtn3 = document.getElementsByClassName("removeBtn")[3];

	/* input태그의 부모div */
	let dsiplay_btn = document.getElementsByClassName("btn_d-none");
	
	let dsiplay_btn1 = document.getElementsByClassName("btn_d-none")[1];
	let dsiplay_btn2 = document.getElementsByClassName("btn_d-none")[2];
	let dsiplay_btn3 = document.getElementsByClassName("btn_d-none")[3];

	/* 품목이름 변수 */
	let gdcheck_n = document.getElementsByClassName("gdcheck_n");
	
	let gdcheck_n2 = document.getElementsByClassName("gdcheck_n")[2];
	let gdcheck_n3 = document.getElementsByClassName("gdcheck_n")[3];
	let gdcheck_n4 = document.getElementsByClassName("gdcheck_n")[4];

	/* 품목가격 변수  */
	let gdcheck_p = document.getElementsByClassName("gdcheck_p");
	
	let gdcheck_p2 = document.getElementsByClassName("gdcheck_p")[2];
	let gdcheck_p3 = document.getElementsByClassName("gdcheck_p")[3];
	let gdcheck_p4 = document.getElementsByClassName("gdcheck_p")[4];

	/* 추가, 제거 버튼 클릭시 이벤트 */
	addBtn.addEventListener('click',addBtnFunction);
	
	function addBtnFunction(){
		console.log('추가버튼 이벤트호출');
		for(let i = 0; i<dsiplay_btn.length; i++){
		if(dsiplay_btn[i].classList.contains('d_none')){
			dsiplay_btn[i].classList.remove("d_none");
			
			gdcheck_n[i].setAttribute("name", "gd_names");
			gdcheck_p[i].setAttribute("name", "gd_price");
			break;
		}			
		}		
	}
	
	removeBtn.addEventListener('click',addBtnFunction);
	
	
	
	
	<%-- 
	addBtn0.onclick = function() {
		console.log("addBtn0 호출");
		dsiplay_btn0.classList.remove("d_none");
		
		gdcheck_n1.setAttribute("name", "gd_names");
		gdcheck_p1.setAttribute("name", "gd_price");

	}
	addBtn1.onclick = function() {
		dsiplay_btn1.classList.remove("d_none");
		gdcheck_n2.setAttribute("name", "gd_names");
		gdcheck_p2.setAttribute("name", "gd_price");
	}
	addBtn2.onclick = function() {
		dsiplay_btn2.classList.remove("d_none");
		gdcheck_n3.setAttribute("name", "gd_names");
		gdcheck_p3.setAttribute("name", "gd_price");
	}
	addBtn3.onclick = function() {
		dsiplay_btn3.classList.remove("d_none");
		gdcheck_n4.setAttribute("name", "gd_names");
		gdcheck_p4.setAttribute("name", "gd_price");
	}
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
	--%>
</script>


<!-- 폼데이터 입력되었는지 체크하는 코드 스크립트  -->
<script type="text/javascript">
	/* 폼태그 데이터 공백 체크  */
	/* onsubmit이벤트  false 일시 submit이벤트 취소*/
	function checkFormData() {
		let checkForm = true;
		console.log("폼데이터 핸들러 호출");
		if (document.getElementById("titleCheck").value === '') {
			document.getElementById("titleCheck").focus();
			alert("제목을 입력하세요.");
			checkForm = false;
		} else if (document.getElementById("contentsCheck").value === '') {
			document.getElementById("contentsCheck").focus();
			alert("내용을 입력하세요");
			checkForm = false;
		} else if(document.getElementById('regionCheck').value===''){
			alert("지역을 선택하세요");
			document.getElementById("regionCheck").focus();
			checkForm = false;
		}		
		else if (document.getElementById("mainImg").value === '') {
			alert("대표 사진은 필수 사항입니다!");
			document.getElementById("mainImg").focus();
			checkForm = false;
		}
		
		return checkForm;
	}
</script>


<script type="text/javascript">

function cancelBtn() {
	console.log('취소버튼');
location.href = "selectResellPageList?sellBuy=" + sell_buy;
}
		</script>


<%--
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
  --%>
</html>