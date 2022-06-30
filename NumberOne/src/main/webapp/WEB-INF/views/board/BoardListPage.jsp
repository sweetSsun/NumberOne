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
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
		<!-- 본문 -->
			<div class="container">
				<div class="row" style="margin:auto;">
					<h1 class="text-center">게시판 글목록 페이지 : BoardListPage.jsp</h1>
				</div>
				<form action="selectBoardSearchList" method="get">
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
						<div class="col-2 mb-5">
							<!-- 글쓰기 버튼 -->
							<button class="btn btn-primary btm-sm">글쓰기</button>
						</div>
				</div>
				</form>
				<div class="row" style="margin-top: 20px;">
					<div class="col">
						<!-- 말머리 정렬 -->
						<select id="bdCategory" onchange="bdCategorySel(this.value)">
							<option value="">카테고리 선택</option>
							<option value="자유">자유</option>
							<option value="질문">질문</option>
							<option value="정보">정보</option>
							<option value="후기">후기</option>
							<option value="지역">지역</option>
						</select>
					</div>
				</div>
				
				<!-- 게시글 목록 -->
				<div class="row">
				<table >
					<thead >
						<tr class="text-center" id="board_column">
							<td>글번호</td>
							<td>말머리</td>
							<td>제목</td>
							<td>작성자</td>
							<td>날짜</td>
							<td>조회</td>
							<td>추천</td>
						</tr>
						<c:forEach items="${noticeList }" var="notice">
							<!-- 공지게시판 -->
							<tr class="fw-bold" style="border-bottom: solid #E0E0E0 1px;">
								<td>${notice.nbcode}</td>
								<td></td>
								<td>
									<a href="selectNoticeBoardView?nbcode=${notice.nbcode }">${notice.nbtitle}</a>
								</td>
								<td>${notice.nbmid}</td>
								<td>${notice.nbdate}</td>
								<td>조회수</td>
								<td>추천수</td>
							</tr>
						</c:forEach>
					</thead>
					
					<tbody id="bdCategoryList">
					<!-- 일반게시판 목록 -->
					
					<c:forEach items="${boardList }" var="board">
						<c:if test="${board.bdcategory != '자랑' }">
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td>${board.bdcode}</td>
							<td>${board.bdcategory}</td>
							<td>
							 	<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a>
							 </td>
							<td>
								<a>${board.bdnickname}</a>
							</td>
							<td>${board.bddate}</td>
							<td>조회수</td>
							<td>추천수</td>
						</tr>
						</c:if>
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

<script type="text/javascript">
	/* 게시판 카테고리 선택 */
	function bdCategorySel(categorySel){
		console.log("categorySel: " + categorySel);
		
		var output = "";
		$.ajax({
			type : "get",
			url : "getBoardCategoryList",
			data : { "bdcategory" : categorySel},
			dataType : "json",
			async : false,
			success : function(bdCategoryList){
				console.log(bdCategoryList);
				
				for(var i = 0; i< bdCategoryList.length; i++ ){
					output += "<tr style=\"border-bottom: solid gray 1px;\">";
					output += "<td>" + bdCategoryList[i].bdcode + "</td>";
					output += "<td>" + bdCategoryList[i].bdcategory + "</td>";
					output += "<td>" + bdCategoryList[i].bdtitle + "</td>";
					output += "<td>" + bdCategoryList[i].bdnickname + "</td>";
					output += "<td>" + bdCategoryList[i].bddate + "</td>";
					output += "</tr>";
				}
			
			}
		});
		console.log(output);
		$("#bdCategoryList").html(output);
	}
	
	
</script>

</html>