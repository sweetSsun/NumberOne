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
<%@ include file="/resources/css/BarCss.jsp" %>
<style type="text/css">
	#board_column{
		border-bottom: solid gray 3px;
	}
	table{
		margin: 20px;
	}
	.bdcategory{
		color : #00bcd4;
	}
	.bdCategoryList{
		
		color : #00bcd4;
		border: none;
	}
	.bdcategorySel{
		font-weight: bold;
		text-align : center;
		color : #00bcd4;
	}
	input{
		border-radius:5px;
		border: solid #E0E0E0 3px;
		height: 32px;
		font-size: 20px;
	}
	.searchType{
		text-align: center;
		border-radius: 5px;
	}
	.community{
		background-color: #00bcd4;
	}
	.malmeori{
		display: none;
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
					<h1 class="text-center">게시판 글목록 페이지 : BoardListPage.jsp</h1>
				</div>
				<form action="selectBoardSearchList" method="get">
					<div class="row ">
						<!-- 검색기능 -->
						<div class="col-5" align="right">
								<select name="searchType" class="searchType">
									<option value="bdtitle">제목</option>
									<option value="bdcontents">내용</option>
									<option value="bdtitlecontents">제목+내용</option>
									<option value="bdnickname">작성자</option>
								</select>
						</div>
						<div class="col-7 ">
							<input type="text" name="searchText" placeholder="검색어를 입력하세요">
							<button class="btn btn-sm btn-secondary">검색</button>
						</div>
					</div>		
				</form>
						
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col">
						<!-- 말머리 정렬 -->
						<select class="bdCategoryList" onchange="bdCategorySel(this.value)">
							<option class="bdcategorySel malmeori" value="" disabled selected >말머리 선택</option>
							<option class="bdcategorySel" value="자유">자유</option>
							<option class="bdcategorySel" value="질문">질문</option>
							<option class="bdcategorySel" value="정보">정보</option>
							<option class="bdcategorySel" value="후기">후기</option>
						</select>
					</div>
				</div>
				<div class=" community" style="text-align:center;">
					<span class="fw-bold text-white">커뮤니티</span>
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
						
						<c:forEach items="${noticeList }" end="2" var="notice">
							<!-- 공지게시판 -->
							<tr class="fw-bold" style="border-bottom: solid #E0E0E0 1px;">
								<td>${notice.nbcode}</td>
								<td></td>
								<td>
									<a href="selectNoticeBoardView?nbcode=${notice.nbcode }">${notice.nbtitle}</a>
								</td>
								<td>${notice.nbmid}</td>
								<td>${notice.nbdate}</td>
								<td>${notice.nbhits }</td>
								<td></td>
							</tr>
						</c:forEach>
					</thead>
					
					<tbody id="bdCategoryList">
					<!-- 일반게시판 목록 -->
					
					<c:forEach items="${boardList }" var="board">
						<c:if test="${board.bdcategory != '자랑' }">
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td>${board.bdcode}</td>
							<td class="bdcategory">${board.bdcategory}</td>
							<td>
							 	<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle} 
							 		<span class="fw-bold" style="font-size:18px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span> </a>
							 </td>
							<td>
								<a>${board.bdnickname}</a>
							</td>
							<td>${board.bddate}</td>
							<td>${board.bdhits }</td>
							<td class="fw-bold" style="color: #00bcd4;">${board.bdrccount}</td>
						</tr>
						</c:if>
					</c:forEach>
					
					</tbody>
				</table>
				<div align="right" class="row">
					<div class="col">
						<c:if test="${sessionScope.loginId != null }">
								<button  onclick="loadToBoardWrite()" class="btn btn-info btm-sm fw-bold text-white">글작성</button>
						</c:if>
					</div>
				</div>
				</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	
</script>

<script type="text/javascript">

	/* 글쓰기 버튼 클릭 */
	function loadToBoardWrite(){
		//글작성 페이지로 이동 
		location.href= "loadToBoardWrite";
	}

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
					output += "<td class=\"bdcategory\">" + bdCategoryList[i].bdcategory + "</td>";
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