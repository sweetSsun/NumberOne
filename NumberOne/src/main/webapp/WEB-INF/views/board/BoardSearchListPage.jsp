<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 게시판 글목록 페이지</title>
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ include file="/resources/css/CommonCss.jsp" %>
<style type="text/css">
	#board_column{
		border-bottom: solid gray 3px;
	}
	table{
		margin: 20px;
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
				<div class="row" style="margin:auto;">
					<h1 class="text-center">게시판 검색결과 페이지 : BoardSearchListPage.jsp</h1>
				</div>
				<form action="searchBoard" method="get">
				<div class="row">
					<!-- 검색기능 -->
						<div class="col-5">
								<select name="searchType">
									<option value="bdtitle">제목</option>
									<option value="bdcontents">내용</option>
									<option value="bdtitlecontents">제목+내용</option>
									<option value="bdnickname">작성자</option>
								</select>
						</div>
						<div class="col-5 input-group">
							  <input type="text" style="width:100px;" class="form-control" name="searchText" placeholder="검색 키워드를 입력하세요!">
							  <span class="input-group-btn">
							    <button class="btn btn-secondary">찾기</button>
							  </span>
						</div>
						<div class="col-2">
							<!-- 글쓰기 버튼 -->
							<button class="btn btn-primary btm-sm">글쓰기</button>
						</div>
				</div>
				</form>
				
				<div class="row mb-5">
					<!-- 검색결과 안내  -->
					<h3 class="text-center">[ <span class="text-primary">${param.searchText}</span> ] 로 검색한 결과 입니다.</h3>  
				</div>
				
				<!-- 게시글 목록 -->
				<div class="row">
				<table >
					<thead>
						<tr class="text-center fw-bold" id="board_column">
								<td>글번호</td>
								<td>말머리</td>
								<td>제목</td>
								<td>작성자</td>
								<td>날짜</td>
								<td>조회</td>
								<td>추천</td>
						</tr>
					</thead>
					<tbody >
					<c:forEach items="${searchBdList}" var="searchBd">
					<!-- 일반게시판 목록 -->
						<tr style="border-bottom: solid gray 1px;">
							<td>${searchBd.bdcode}</td>
							<td>${searchBd.bdcategory}</td>
							<td>
							 	<a href="selectNoticeBoardView">${searchBd.bdtitle}</a>
							 </td>
							<td>
								<a>${searchBd.bdnickname}</a>
							</td>
							<td>${searchBd.bddate}</td>
							<td>조회수</td>
							<td>추천수</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
						
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

	
	
</script>

</html>