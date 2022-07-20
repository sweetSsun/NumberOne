<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
<title>1인자 - 지역글 작성페이지</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<style type="text/css">
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
	.bdcontents{
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h2 class="text-center">지역글 작성페이지 : RegionBoardWriteForm.jsp</h2>
				<form action="insertBoardWrite" method="post" enctype="multipart/form-data" onsubmit="return writeFormCheck();">
					<input type="hidden" name="bdmid" value="${sessionScope.loginId }">
				<div class="row">
					<div class="col-6">
						<span style="font-size:20px;">게시판</span><span class="text-danger">*</span>
						<select name="bdcategory" onchange="bdcategorySel(this.value)" class="bdCategoryList" required="required">
							<option value="" disabled selected class="selectPlaceHolder">필수</option>
							<option value="자유">자유</option>
							<option value="질문">질문</option>
							<option value="정보">정보</option>
							<option value="후기">후기</option>
						</select>
					</div>
					<div class="col-6">
						<span style="font-size:20px;">지역</span>
						<select name="bdrgcode" class="bdRegionSel">
							<option value="${bdrgcode }"  class="selectPlaceHolder">${bdrgname}</option>
							<option value="ALL">전국</option>
							<option value="SEL">서울</option>
							<option value="ICN">인천</option>
							<option value="GWD">강원</option>
							<option value="CCD">충청</option>
							<option value="GGD">경기</option>
							<option value="JLD">전라</option>
							<option value="GSD">경상</option>
							<option value="JJD">제주</option>
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<input id="bdtitle" class="bdtitle" name="bdtitle" type="text" >
				</div>
				<hr>
				<div class="row">
					<textarea id="bdcontents" class="bdcontents" rows="17" cols="80" name="bdcontents"></textarea>
				</div>
				
				<div class="row" style="margin-top: 3%;">
				<div class="image-container" style="width: 300px; heigth:300px;">
    				<img title="이미지 미리보기" style="width: 200px; heigth:200px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
					<!-- 파일선택 -->
					<input type="file" style="display: block;" id="input-image" name="bdimgfile" accept="image/*" >
				</div>
				</div>					
				
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
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	
	<!-- 게시글 작성 취소 확인 -->
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
                    <button class="close btn btn-info text-white" onclick="writeBoardCancel(this)" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	
</script>

<script type="text/javascript">
	//현재 로그인중인 아이디
	var loginId = '${sessionScope.loginId}';
	
	console.log('${bdrgname}');
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
</script>
<script type="text/javascript">
	
	function bdWriteCancelCheckModal(){
		/* 게시글 작성 취소버튼 클릭시 모달 출력 */
		$("#bdWriteCancelCheckModal").modal('show');
	}
	function writeBoardCancel(){
		/* 작성취소 */
		history.back();
		
	}
	
	/* 이미지 미리보기 */
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
	
	function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
	
</script>

<script type="text/javascript">
	function writeFormCheck(){
		/* 게시글 작성 submit */
		var inputTitle = $("#bdtitle").val();
		var inputContents = $("#bdcontents").val();
		
		if ( inputTitle.length == 0){
			alert("제목을 입력하세요.");
			return false;
		}
		
		if ( inputContents.length == 0 ){
			alert("내용을 입력하세요.");
			
			return false;
		}
	}
</script>



<script type="text/javascript">
	/* 후기 카테 클릭 시 후기로 이동  */
	function bdcategorySel(selVal){
		if ( selVal == "후기" ){
			location.href="loadToWriteReview";
		}
	}
</script>

</html>