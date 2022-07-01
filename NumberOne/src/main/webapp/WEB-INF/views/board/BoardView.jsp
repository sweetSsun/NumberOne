<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/CommonCss.jsp" %>
<title>${board.bdtitle } - 1인자:게시판 게시판 글상세 페이지</title>

<style type="text/css">
	textarea{
		border: none;
	}
	.commentDate{
		color: gray;
		font-size: 20px;
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
</style>
</head>
<body>
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">게시판 글상세페이지 : BoardView.jsp</h1>
				
				<form action="">
					<%-- <div class="row mt-5 mb-3" id="table">
						<div class="col-6">
							<span class="fw-bold">글번호</span> <span>${board.bdcode}</span> 
						</div>
						<div class="col-6">
							<span class="fw-bold">조회수</span> <span>예정</span> 
						</div>
					</div>
					<div class="row mb-3" id="table">
						<div class="col">
							<span class="fw-bold">게시판</span> <span>${board.bdcategory }</span>  
						</div>
						<div class="col-6">
							<span class="fw-bold">작성일</span> <span>${board.bddate }</span>  
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-6">
							<span class="fw-bold">작성자</span> <a href="#"><span>${board.bdnickname }</span></a> 
						</div>
						<div class="col-6">
							<span class="fw-bold">추천수</span> <span>예정</span>  
						</div>
					</div>
					<div class="row mb-4" style="border-bottom: solid #E0E0E0 3px;">
						<div class="col">
							<span class="fw-bold">&nbsp;&nbsp;&nbsp;제목</span> <span>${board.bdtitle }</span>  
						</div>
					</div> --%>
					
					<!-- 실험 --><!--  -->
					<div class="row">
						<%-- <div class="col">
							<a href="#"><span class="fw-bold boardCategory">${board.bdcategory }게시판</span></a>
						</div> --%>
					</div>
					<div class="row mb-2" >
						<div class="col">
							<span class="fw-bold boardTitle">${board.bdtitle }</span>  
							<a href="#"><span class="fw-bold boardCategory"> | ${board.bdcategory }게시판</span></a> 
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<a href="#"><span class="">${board.bdnickname }</span></a> 
						</div>
						<div class="col-6 text-center">
							<span class="boardDate">${board.bddate }</span> 
						</div>
						<div class="col-3">
							<span class="commentDate" style="right:0;">조회수 15</span> 
							<span class="commentDate" style="right:0;">추천수 10</span> 
						</div>
					</div>
					<div class="row mb-4" style="border-bottom: solid #E0E0E0 3px;">
						
						<!-- <div class="col-4 offset-md-8">
							<span class="commentDate" style="right:0;">조회수 15</span> 
							<span class="commentDate" style="right:0;">추천수 10</span> 
						</div> -->
					</div>
					<!-- 실험 --><!--  -->
					
					
					<!-- 본문 글 내용-->
					<div class="row mb-3" style="border-bottom: solid #E0E0E0 3px;">
						<div class="col">
							<textarea rows="10%" cols="100%" readonly>${board.bdcontents }</textarea>
						</div>
					</div>
				</form>
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row">
					<div class="col-2">
						<a href="#"><input type="button" style="left:0;" class="btn btn-lg bg-success " value="글목록"></a> 
					</div>
					<div class="col-4 offset-md-6" >
						<c:if test="${sessionScope.loginId == board.bdmid}">
							<!-- 사용자계정으로만 로그인 시 보이도록 설정하기 -->
							<input type="button" style="float:right;" class="btn btn-lg bg-success " value="삭제">
							<input type="button" style="float:right;" class="btn btn-lg bg-success " value="수정">
						</c:if>
					</div>
				</div>
				
				<!-- 댓글 -->
				<div id="commentBox">
					<div class="row">
						<div class="col bg-info">
							<!-- 댓글목록 -->
							<table id="commentList">
								<tr>
									<th>강동원</th>
									<td class="commentDate" >2022.06.30 17:53</td>
								</tr>
								<tr>
									<td>네이버카페 댓글 참고</td>
								</tr>
								<tr>
									<th>유재석</th>
									<td class="commentDate">2022.06.30 17:50</td>
								</tr>
								<tr>
									<td>팀 프로젝트 D-29.....</td>
								</tr>
				
							</table>
						</div>
					</div>
				</div>
				
				
			</div>
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>