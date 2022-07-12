<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공지게시판</title>
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ include file="/resources/css/BarCss.jsp" %>
<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
		background-color: white;
	}
	
	.boardList{
		margin: auto;
	}
	.tableCell{
		font-size: 20px;
	}
	#board_column{
		border-bottom: solid #E0E0E0 2px;
	}
	.boardList{
		margin: auto;
	}
	.tableCell{
		font-size: 20px;
	}
	.bdcategory{
		color : gray;
	}
	.bdCategoryList{
		color : #00bcd4;
		border: none;
		font-size: 20px;
	}
	.bdcategorySel{
		font-weight: bold;
		text-align : center;
		color : #00bcd4;
	}
	input{
		border-radius:3px;
		border: solid #E0E0E0 2px;
		height: 28px;
		font-size: 20px;
	}
	.searchType{
		text-align: center;
		border-radius: 5px;
		font-size: 20px;
		border: solid 1px #00bcd4;
	}
	.community{
		background-color: #00bcd4;
	}
	.malmeori{
		display: none;
	}
	#inputSearchText{
		font-size: 18px;
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
					<h2 class="text-center">공지게시판 : NoticeBoardList.jsp</h2>
				</div>
				<form action="selectNoticeSearchList" method="get" onsubmit="return searchTextCheck();">
					<div class="row ">
						<!-- 검색기능 -->
						<div class="col-5" align="right">
								<select name="searchType" class="searchType">
									<option value="nbtitle">제목</option>
									<option value="nbcontents">내용</option>
									<option value="nbtitlecontents">제목+내용</option>
								</select>
						</div>
						<div class="col-7 ">
							<input type="text" name="searchText" placeholder="검색어를 입력하세요" id="inputSearchText">
							<button class="btn btn-sm btn-secondary">검색</button>
						</div>
					</div>		
				</form>
						
				</div>
				<div class="row" style="margin-top: 20px;">
					
				</div>
				
				<div class="community" style="text-align:center;">
					<span style="font-size:21px;" class="fw-bold text-white">공지게시판</span>
				</div>
				
				<!-- 게시글 목록 -->
				<div class="row">
				<table class="boardList">
					<thead >
						<tr class="text-center" id="board_column">
							<td style="font-size: 17px;">글번호</td>
							<td style="font-size: 17px;">말머리</td>
							<td style="font-size: 17px;">제목</td>
							<td style="font-size: 17px;">작성자</td>
							<td style="font-size: 17px;">날짜</td>
							<td style="font-size: 17px;">조회</td>
						</tr>
						
						<c:forEach items="${noticeList }" end="2" var="notice">
							<!-- 공지게시판 : 상위에 띄울 공지-->
							<tr class="fw-bold" style="border-bottom: solid #E0E0E0 1px;">
								<td class="text-center tableCell">${notice.nbcode}</td>
								<td class="text-center tableCell">공지</td>
								<td class="tableCell">
									<a href="selectNoticeBoardView?nbcode=${notice.nbcode }">${notice.nbtitle}</a>
								</td>
								<td class="text-center tableCell">관리자</td>
								<td class="text-center tableCell">${notice.nbdate}</td>
								<td class="text-center tableCell">${notice.nbhits }</td>
							</tr>
						</c:forEach>
					</thead>
					
					<tbody id="bdCategoryList">
					<c:forEach items="${noticeList }" begin="3" var="notice">
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td class="text-center tableCell">${notice.nbcode}</td>
							<td class="bdcategory text-center tableCell">공지</td>
							<td class="tableCell">
							 	<a href="selectNoticeBoardView?nbcode=${notice.nbcode }">${notice.nbtitle} 
							 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;"></span> </a>
							 </td>
							<td class="text-center tableCell">
								관리자
							</td>
							<td class="text-center tableCell">${notice.nbdate}</td>
							<td class="text-center tableCell">${notice.nbhits }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<%-- <div align="right" class="col mt-2">
					<c:if test="${sessionScope.loginId == 'admin' }">
						<button  onclick="loadToBoardWrite()" style="background-color:gray;" class="btn btm-sm fw-bold text-white writeButton">글작성</button>
					</c:if>
				</div> --%>
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

	
	
</script>
<script type="text/javascript">
	function searchTextCheck(){
		/* 검색어 입력유무 확인 */
		var inputSearchText = $("#inputSearchText").val();
		
		if( inputSearchText.length == 0 ){//검색어를 입력하지 않았으면 
			alert("검색어를 입력해주세요!");
		
			return false;
		}
	}
</script>

</html>