<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공구게시판</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	.textarea-GbView{
		resize: none;
		width: -webkit-fill-available;
		min-height: 20rem;
	}
	.bdtitle{
		border: none;
		font-weight: bold;
		font-size: 20px;
		height: 22px;
		margin: auto;
	}
	.bdcontents{
		border-radius: 5px;
		border: solid gray 2px;
		font-size: 19px;
	}
	.btn-wrapper{
		width: 100%;
		text-align: center;
		display:inline-block;
	}	
	textarea:focus {
 	   outline: none;
	}
	input:focus{
	   outline: none;	
	}
	.d_none{
		display: none;
	}
</style>

</head>

<!-- jquery -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

<body>

	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
		<!-- 본문 -->
						<div class="container" style="margin-top: 10px">
				<!-- 페이지 제목 -->
                <div class="checkout__form">공구게시판 - 글수정</div>
				<div>
 				<form action="admin_updateGonguModify${paging.makeQueryPage(gonguBoard.gbcode, paging.page)}" method="post" enctype="multipart/form-data" onsubmit="return inputCheck()">
 				<!-- 수정 불가능한 값 숨기고 submit에는 데이터 넘겨주는 변수 -->
 				<input type="hidden" name="gbcode" value="${gonguBoard.gbcode }">
 				<input type="hidden" name="originImg_gb" value="${gonguBoard.gbimg }">
 				
 				<div class="row">
					<input type="text" id="title" class="bdtitle" name="gbtitle" maxlength="50" value="${gonguBoard.gbtitle }">
				</div>
				<hr>
				<div class="row">
					<textarea id="contents" class="bdcontents textarea-gbView" rows="17" cols="40" name="gbcontents"  
						maxlength="2000" placeholder="내용을 입력하세요">${gonguBoard.gbcontents }</textarea>
				</div>
				<div class="row" style="padding:2vh;">
					<input type="text" id="item_name" name="gbitemname" placeholder="공동구매 제목 또는 상품 이름을 입력하세요" style="margin-bottom:2vh" value="${gonguBoard.gbitemname }"><br>
					<input type="text" id="item_price" name="gbitemprice" placeholder="가격을 입력하세요" value="${gonguBoard.gbitemprice }">
				</div>
				<div class="row mt-4">
					<!-- 기존 이미지가 있으면 -->
					<c:if test="${gonguBoard.gbimg != null }">
						<div id="originImgScreen" style="width:200px; height:200px;" class="">
							<img src="${pageContext.request.contextPath }/resources/img/gonguUpLoad/${gonguBoard.gbimg}" style="width:100%; height:100%;"
								id="originImg">
						</div>
					</c:if>
					<!-- 이미지 변경시 -->
					<div id="imgScreen" style="width:200px; height:200px;" class="d_none">
						<img id='previewImg' style="width:100%; height:100%;"></img>
					</div>
					<input type="file" id="gbImg" name="gbimgfile" class="" accept="image/*" onchange="readImg(this)"> 
				</div>
				<div class="row mt-4 mb-2">
					<div class="col btn-wrapper">
						<input class="btn-numberone btn fw-bold text-white" type="submit" value="수정">
						<input onclick="$('#gbWriteCancelCheckModal').modal('show')" class="btn-numberone btn fw-bold text-white" type="button" value="취소">
					</div>
				</div>	
 				
				</form>
            </div>

			</div>
		</section>
	</main>
	
	
	<!-- 게시글 작성 취소 확인 -->
	<div class="modal fade" id="gbWriteCancelCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 공구글 작성 취소 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	<span class="fw-bold">공구글 작성을 취소하시겠습니까?</span>
                	<br>
                	<span class="">이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.</span>
                </div>	
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn-numberone text-white" onclick="writeBoardCancel()" style="padding: 0.375rem 0.75rem;" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
    
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
	// 공구글 수정 취소 경고 모달창 close 하는 스크립트
		var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#gbWriteCancelCheckModal").modal("hide");
		});
	}
</script>

<script type="text/javascript">
	// 공구글 수정 취소
	function writeBoardCancel(){
		console.log("취소 버튼 클릭");
		location.href="admin_selectGonguBoardView${paging.makeQueryPage(gonguBoard.gbcode, paging.page)}";
	}
	
	// 제목, 내용 입력됐는지 확인
	function inputCheck(){
		var titleObj = $("#title");
		var contentsObj = $("#contents");
		var itemNameObj = $("#item_name");
		var itemPriceObj = $("#item_price");
		
		console.log(titleObj.val());
		console.log(contentsObj.val());
		console.log(itemNameObj.val());
		console.log(itemPriceObj.val());
		
		if (titleObj.val().length == 0){
			alert("제목을 입력해주세요.");
			titleObj.focus();
			return false;
		}
		if (contentsObj.val().length == 0){
			alert("내용을 입력해주세요.");
			contentsObj.focus();
			return false;
		}
		if (itemNameObj.val().length == 0){
			alert("공동구매 제목 또는 상품 이름을 입력해주세요.");
			itemNameObj.focus();
			return false;
		}
		if (itemPriceObj.val().length == 0){
			alert("가격을 입력해주세요.");
			itemPriceObj.focus();
			return false;
		}
	}
	
	// 이미지 파일을 업로드 했는지 확인하고 이미지 미리보기
	function readImg(obj) {
		if(obj.files && obj.files[0]){
			var reader = new FileReader();
			
			reader.onload = (e) => {
				console.log(obj.files[0].type);
				// 이미지 파일인지 검사
				if (!obj.files[0].type.match("image.*")){
					console.log("이미지 파일이 아님");
					alert('이미지 파일만 선택할 수 있습니다.');
					$("#previewImg").attr("src","");
					$("#imgScreen").addClass("d_none");
					return;
				}
				$("#previewImg").attr("src",e.target.result);
				$("#originImgScreen").addClass("d_none");
				$("#imgScreen").removeClass("d_none");
			}
			reader.readAsDataURL(obj.files[0]);
		}
		
		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind+1, obj.length);
		var file_type = file_name.toLowerCase();

		var checkType = new Array();
		checkType = ['jpg','gif','png','jpeg','bmp'];
		
		if(checkType.indexOf(file_type) == -1){
			alert('이미지 파일만 선택할 수 있습니다.');
			$("#gbImg").val("");
			$("#gbImg").replaceWith($("#gbImg").clone(true));
			return false;
		}
	}
	
</script>

</body>
</html>