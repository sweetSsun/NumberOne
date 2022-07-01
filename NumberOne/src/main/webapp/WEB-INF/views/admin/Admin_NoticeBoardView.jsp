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
	}
	
	
</style>
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
				<h1 class="text-center">공지글 상세페이지 : Admin_NoticeBoardView.jsp</h1>
				
				<form action="">
					<div class="row mt-5 mb-3" id="table">
						<div class="col-6">
							<span class="fw-bold">글번호</span> <span>${noticeBoard.nbcode}</span> 
						</div>
						<div class="col-6">
							<span class="fw-bold">조회수</span> <span>예정</span>
						</div>
					</div>
					<div class="row mb-3" id="table">
						<div class="col-6">
							<span class="fw-bold">게시판</span> <span>공지</span> 
						</div>
						<div class="col-6">
							<span class="fw-bold">작성일</span> <span>${noticeBoard.nbdate }</span> 
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<span class="fw-bold">작성자</span> <span>${noticeBoard.nbmid }</span>
						</div>
					</div>
					<div class="row mb-4" style="border-bottom: solid #E0E0E0 3px;">
						<div class="col">
							<span class="fw-bold">&nbsp;&nbsp;&nbsp;제목</span> <span>${noticeBoard.nbtitle }</span>
						</div>
					</div>
					<!-- 본문 글 내용-->
					<div class="row mb-3" style="border-bottom: solid #E0E0E0 3px;">
						<div class="col">
							<textarea rows="10%" cols="100%" readonly>${noticeBoard.nbcontents }</textarea>
						</div>
					</div>
				</form>
				
				<!-- 공지는 댓글작성 없음 -->
				<div class="row">
					<div class="col-2">
						<a href="#"><input type="button" style="left:0;" class="btn btn-lg bg-success " value="글목록"></a> 
					</div>
					<div class="col-4 offset-md-6" >
						<!-- 관리자계정으로만 로그인 시 보이도록 설정하기! -->
						<input type="button" style="float:right;" class="btn btn-lg bg-success " value="삭제">
						<input type="button" style="float:right;" class="btn btn-lg bg-success " value="수정">
					</div>
				</div>
				
			</div>
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>