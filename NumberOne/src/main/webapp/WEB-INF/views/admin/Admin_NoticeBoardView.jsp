<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<!-- Css Styles -->
<%@ include file="/resources/css/BarCss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<title>${noticeBoard.nbtitle} - 1인자:관리자 공지게시판</title>

<style type="text/css">
	.textarea-NbView{
		border: none;
		resize: none;
		width: -webkit-fill-available;
		min-height: 25em;
	}
	textarea:focus {
    	outline: none;
	}
	.idDateHits{
		border-bottom: solid #E0E0E0 3px;
	}
	.boardDate{
		color: gray;
		font-size: 20px;
		text-align: left;
	}
	.boardCategory{
		color : #004804;
		font-size: 25px;
	}
	.boardTitle{
		font-size: 35px;
	}
	.boardContents{
		border-bottom: solid #E0E0E0 3px;
	}
	.commentDate{
		color: gray;
		font-size: 20px;
	}
</style>

<script type="text/javascript">
	var checkMsg = "${msg}"
	console.log(checkMsg.length);
	if(checkMsg.length > 0){
		alert(checkMsg);
	}
</script>

</head>
<body>
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file= "/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">관리자 공지글 상세페이지 : Admin_NoticeBoardView.jsp</h1>
				
				<form action="">
					<div class="row">
						<div class="col">
							<a href="#"><span class="fw-bold boardCategory"> | 공지게시판</span></a> 
						</div>
					</div>
					<div class="row mb-2" >
						<div class="col">
							<span class="fw-bold boardTitle">${noticeBoard.nbtitle }</span>  
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col-6">
							<!-- 닉네임 출력으로 바꾸기 -->
							<a href="#"><span class="">${noticeBoard.nbnickname }</span></a> 
						</div>
						
						<div class="col-3 offset-md-3">
							<span class="boardDate">${noticeBoard.nbdate } | </span> 
							<span class="commentDate" style="right:0;"><i class="fa-regular fa-eye"></i>${noticeBoard.nbhits}</span> 
						</div>
					</div>
					
					<!-- 본문 글 내용-->
					<div class="row mt-3 mb-3 boardContents">
						<div class="col">
							<c:if test="${noticeBoard.nbimg != null }">
								<img alt="" src="${pageContext.request.contextPath }/resources/img/noticeUpLoad/${noticeBoard.nbimg}" style="max-width:100%; max-height:500px;">
							</c:if>
							<textarea rows="10%" class="textarea-NbView" readonly>${noticeBoard.nbcontents }</textarea>
						</div>
					</div>
				</form>
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row">
					<div class="col-2">
						<a href="#"><input type="button" style="left:0;" class="middelBtn btn btn-lg bg-success fw-bold text-white" value="글목록"></a> 
					</div>
					<div class="col-4 offset-md-6" >
						<input type="button" style="float:right;" class="btn btn-lg bg-success fw-bold text-white" 
							id="deleteBtn"  value="삭제">
						<input type="button" style="float:right; margin-right: 5px;" class="btn btn-lg bg-success fw-bold text-white"
							id="modifyBtn" value="수정">
					</div>
				</div>
				
			</div>
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
	// 공지글 삭제 요청 (nbstate 0으로 변경)
	$("#deleteBtn").click(function(){
		console.log("공지 삭제 요청");
		var nbstate = 2;
		var nbcode = '${noticeBoard.nbcode}';
		console.log("nbcode : " + nbcode);
		location.href="admin_updateNbstate?nbcode="+nbcode+"&nbstate="+nbstate;
	});
	
	$("#modifyBtn").click(function(){
		console.log("공지 수정 요청");
		var nbcode = '${noticeBoard.nbcode}';
		console.log("nbcode : " + nbcode);
		location.href="admin_selectNoticeModify?nbcode="+nbcode;
	});

</script>

</body>

</html>