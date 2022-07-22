<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<title>1인자 - 자취방 자랑 글수정</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		color : #00bcd4;
	}
	option{
		color :#00bcd4;
		font-weight: bold;
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
		resize:none;
	}
	.btn-wrapper{
		width: 100%;
		text-align: center;
		display:inline-block;
	}
	.buttons{
		margin: auto;
		display: block;
		
	}
	.selectPlaceHolder{
		display: none;
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
	.nickname{
		color : #00bcd4;
		border: none;
		font-size: 20px;
		margin-left: 20px;
	}
	
/*    		자랑방 CSS		*/
	.mainfile{
		border-style: inherit;
    	border-color: internal-light-dark;
		padding: 6px;
		background-color: #BDB4A3;	
		color: white;
		border-radius: 6px;
	}
	
	.d_none{ display:none; }
	
	.img{ height : 190px; width: 260px;}
	
	span.x{ 
		/* 사진 X 버튼 */
		background-color: #00bcd4; 
		border-radius: 100%; 
		color: white; 
		position: absolute; 
		top: 10px; 
		right: 5px; 
		cursor: pointer;
	}
	
	div.detailimageBox{ 
		/* position: relative; */
		height : 190px; width: 260px;
		display : inline-block; 
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
				<h2 class="text-center">자취방 자랑 글수정 페이지</h2>
				<form action="updateRoomView" method="post" enctype="multipart/form-data" onsubmit="return roomModifyCh(${detailCount})">
				<div class="row">
					<input type="hidden" name="bdmid" value="${board.bdmid }">
					<input type="hidden" name="bdcode" value="${board.bdcode }">
					<input type="hidden" class="fw-bold" name="bdnickname" value="${board.bdnickname }">
					<hr>
				</div>
				
				<div class="row">
					<div class="col-6">
						<span style="font-size:20px;">게시판</span><span class="text-danger">*</span>
						<select name="bdcategory" class="bdCategoryList" >
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
					<input class="bdtitle" name="bdtitle" type="text" value="${board.bdtitle }">
				</div>
				<hr>
				<div class="row">
					<textarea class="bdcontents" rows="17" cols="80" name="bdcontents">${board.bdcontents }</textarea>
				</div>
				
				<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
				
				<!-- 대표사진 -->
				<div class="row" style="height:190px; width: 260px; margin-top: 15px;">
					<img class="img" alt="대표사진" src="${pageContext.request.contextPath }/resources/img/room/${board.bdimg }" id="currentBdimg_screen"><br>
					<input type="hidden" value="${board.bdimg }" id="currentBdimg" name="bdimg">
				</div>
				
				<!-- 대표사진 수정 -->	
				<div class="row">
					<span>대표사진 수정</span> <input type="file" id="mainImg" name="bdimgfile" accept="image/*">  
				</div>
				
				<!-- 상세사진 -->
				<div class="row" style="margin-top: 15px;">
					<c:forEach items="${roomdetailimgs }" var="detail" varStatus="status">
						<div class="detailimageBox" id="${status.index }_currentDetailimg_screen" style="position: relative;">
							<img class="img" alt='상세사진' src='${pageContext.request.contextPath }/resources/img/room/${detail }'>
							<span class="x" onclick="currentImgStateUpdate('${status.index }_currentDetailimg')">&nbsp;X&nbsp;</span>
							<input type="hidden" id="${status.index }_currentDetailimg" value="${detail }">
						</div>
					</c:forEach> 	
					<input type="hidden" id="bddetailimg" name="bddetailimg" placeholder="현재상세이미지 파일명을 모을 input">
				</div>
				
				<!-- 상세사진 추가-->
				<div class="row">
					<span>상세사진 추가</span>
					<input type="file" multiple="multiple" id="detailImg" name="bddetailimgfile" accept="image/*" onclick="return mainimgCh()"> 
				</div>
				
				
				<!-- 수정/취소 버튼 -->
				<div class="row mt-4">
					<div class="col btn-wrapper">
						<input class="btn btn-lg buttons fw-bold text-white" style="background-color:#00bcd4;" type="submit" value="수정">
						<input onclick="bdWriteCancelCheckModal()" class="btn btn-lg buttons fw-bold text-white" style="background-color:#00bcd4;" type="button" value="취소">
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
                    <button class="close btn btn-info text-white" onclick="location.href='${pageContext.request.contextPath}/selectRoomList'" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>


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
	
	//메인 이미지 없이 상세 이미지 등록하는 경우(현재는 그럴 수 없음 주석처리)
	/*
	function mainimgCh(){
		console.log("메인이미지 확인 함수");
		var mainImg = $("#mainImg").val();
		console.log(mainImg);
		if(mainImg==""){
			if($("#currentBdimg").val()==""){
				alert("대표 사진을 먼저 선택하세요!");			
				return false;
			}
		}
	} 
	*/
	function  roomModifyCh(currentDetailCount){
		console.log("자취방 자랑글 수정 확인");
		console.log(currentDetailCount);
		
		var detailImg = "";
		for(var i=0; i<currentDetailCount; i++){
			detailImg += $("#"+i+"_currentDetailimg").val();
			detailImg +="___";
		}
		//console.log(detailImg);
		$("#bddetailimg").val(detailImg);
		
		if($("#bdtitle").val()==""){
			alert("제목을 입력하세요");
			return false;
		} else if ($("#bdcontents").val()==""){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>


</html>