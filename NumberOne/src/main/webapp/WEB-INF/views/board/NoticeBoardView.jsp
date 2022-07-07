<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/CommonCss.jsp" %>
<title>${noticeBoard.nbtitle} - 1인자:게시판 공지글 상세페이지</title>

<style type="text/css">
	textarea{
		border: none;
		height: auto;
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
</head>
<body>
	<!-- TobBar -->
	<c:choose>
		<c:when test="${sessionScope.loginId != 'admin'}">
			<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
		</c:otherwise>
	</c:choose>
	<!-- End of TobBar -->
	
	<main>
	
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">공지글 상세페이지 : NoticeBoardView.jsp</h1>
				
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
							<a href="#"><span class="">${noticeBoard.nbmid }</span></a> 
						</div>
						
						<div align="right" class="col-3 offset-md-3">
							<span class="boardDate">${noticeBoard.nbdate } | </span> 
							<span class="commentDate" style="right:0;"><i class="fa-regular fa-eye"></i> ${noticeBoard.nbhits} </span> 
						</div>
					</div>
					
					<!-- 본문 글 내용-->
					<div class="row mt-3 mb-3 boardContents">
						<div class="col">
							<textarea rows="10%" cols="100%" readonly>${noticeBoard.nbcontents }</textarea>
						</div>
					</div>
				</form>
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row">
					<div class="col-2">
						<a href="#"><input type="button" style="left:0;" class="middelBtn btn btn-lg bg-success fw-bold text-white" value="글목록"></a> 
					</div>
					<div class="col-4 offset-md-6" >
						<!-- 관리자계정으로만 로그인 시 보이도록 설정하기! -->
						<c:if test="${sessionScope.loginId == 'admin'}">
							<input type="button" style="float:right;" class="btn btn-lg bg-success fw-bold text-white" value="삭제">
							<input type="button" style="float:right; margin-right: 5px;" class="btn btn-lg bg-success fw-bold text-white" value="수정">
						</c:if>
					</div>
				</div>
				
			</div>
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>