<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 게시글 작성페이지</title>
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
		/* display: block; */
		
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
                    <%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
            </c:when>
            <c:otherwise>
                    <%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
            </c:otherwise>
        </c:choose>
        <!-- End of TopBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h2 class="text-center">자취방자랑 글작성 페이지</h2>
				<form action="insertRoomWrite" method="post" enctype="multipart/form-data" onsubmit="return roomRegisterCh()">
					<input type="hidden" name="bdmid" value="${sessionScope.loginId }">
				<div class="row">
					<div class="col-6">
						<span style="font-size:20px;">게시판</span><span class="text-danger">*</span>
						<select name="bdcategory"  class="bdCategoryList" >
							<option value="자랑" class="selectPlaceHolder">자랑</option>
							<option value="자랑">자랑</option>

						</select>
					</div>
					<div class="col-2">
						<span style="font-size:20px;">작성자</span>
					</div>
					<div class="col-4">
						<input class="nickname" value="${sessionScope.loginNickname}">
					</div>
				</div>
				<hr>
				<div class="row">
					<input id="bdtitle" class="bdtitle" name="bdtitle" type="text" placeholder="제목">
				</div>
				<hr>
				<div class="row">
					<textarea id="bdcontents" class="bdcontents" rows="17" cols="80" name="bdcontents"></textarea>
				</div>
				
				<!--  자취방자랑 대표사진  -->
				<div class="row" style="margin-top: 3%;">
					<div id="bdimgScreen" style="width:200px; height:150px;" class="d_none">
					<img id='previewBdmig' style="width:100%; height:100%;"></img>
					</div>
					<input type="file" id="mainImg" name="bdimgfile" accept="image/*"> 
				</div>					
				
				<!-- 자취방자랑 상세사진 -->
				<div class="row" style="margin-top: 3%;">
				<div id="bddetailimgScreen" style="width:100%;" class="row"></div>
				<input type="file" multiple="multiple" id="detailImg" name="bddetailimgfile" onclick="return mainimgCh()" accept="image/*">
				</div>
				
				<!-- 작성/취소 버튼 -->				
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
                    <button class="close btn btn-info text-white"  onclick="location.href='${pageContext.request.contextPath}/selectRoomList'" >네</button>
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

	if('${sessionScope.loginId}'==null){
		console.log("로그인 후 이용가능합니다.");
		location.href = "loadTologin?afterUrl=loadTowriteRoom";
	}
	
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
	
	function  roomRegisterCh(){
		console.log("자취방 자랑글 등록 확인");
		if($("#bdtitle").val()==""){
			alert("제목을 입력하세요");
			return false;
		} else if ($("#bdcontents").val()==""){
			alert("내용을 입력하세요");
			return false;
		} else if ($("#mainImg").val()==""){
			alert("대표 사진은 필수 사항입니다!");
			return false;
		}
		return true;
	}
</script>






</html>