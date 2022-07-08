<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 자유게시판</title>
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
	.sidebar{
		position: sticky;
		top: 0px;
		height: 100%;
		width: 200px;
		margin-bottom: 5px;
		z-index: 1;
	}
	
	#board_column{
		border-bottom: solid #E0E0E0 2px;
	}
	table{
		margin: auto;
	}
	td{
		font-size: 20px;
	}
	.bdcategory{
		color : #00bcd4;
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
				<form action="selectBoardSearchList" method="get">
				<input type="hidden" name="bdcategory" value="자유">
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
					
				</div>
				
				<div class=" community" style="text-align:center;">
					<span style="font-size:21px;" class="fw-bold text-white">게시판</span>
				</div>
				
				<!-- 게시글 목록 -->
				<div class="row">
				<table >
					<thead >
						<tr class="text-center" id="board_column">
							<td style="font-size: 17px;">글번호</td>
							<td style="font-size: 17px;">말머리</td>
							<td style="font-size: 17px;">제목</td>
							<td style="font-size: 17px;">작성자</td>
							<td style="font-size: 17px;">날짜</td>
							<td style="font-size: 17px;">조회</td>
							<td style="font-size: 17px;">추천</td>
						</tr>
						
						<c:forEach items="${noticeList }" var="notice">
							<!-- 공지게시판 -->
							<tr class="fw-bold" style="border-bottom: solid #E0E0E0 1px;">
								<td class="text-center">${notice.nbcode}</td>
								<td></td>
								<td>
									<a href="selectNoticeBoardView?nbcode=${notice.nbcode }">${notice.nbtitle}</a>
								</td>
								<td class="text-center">관리자</td>
								<td class="text-center">${notice.nbdate}</td>
								<td class="text-center">${notice.nbhits }</td>
								<td></td>
							</tr>
						</c:forEach>
					</thead>
					
				</table>
				<div align="right" class="col mt-2">
					<c:if test="${sessionScope.loginId == 'admin'}">
						<button  onclick="loadToBoardWrite()" style="background-color:#00bcd4;" class="btn btm-sm fw-bold text-white writeButton">글작성</button>
					</c:if>
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

	/* 게시판 말머리 선택 */
	function bdCategorySel(categorySel){
		console.log("categorySel: " + categorySel);
		
		var output = "";
		$.ajax({
			type : "get",
			url : "getBoardCategoryList_ajax",
			data : { "bdcategory" : categorySel},
			dataType : "json",
			async : false,
			success : function(bdCategoryList){
				console.log(bdCategoryList);
				
				for(var i = 0; i< bdCategoryList.length; i++ ){
					output += "<tr style=\"border-bottom: solid #E0E0E0 1px;\">";
					output += "<td class=\"text-center\">" + bdCategoryList[i].bdcode + "</td>";
					output += "<td class=\"bdcategory text-center\">" + bdCategoryList[i].bdcategory + "</td>";
					output += "<td><a href='selectBoardView?bdcode=" + bdCategoryList[i].bdcode + "'>" + bdCategoryList[i].bdtitle + "</a>"
					output += "<span class=\"fw-bold\" style=\"font-size:15px; color:#00bcd4;\">&nbsp;" + bdCategoryList[i].bdrpcount + "</span></td>"
					output += "<td class=\"text-center\"><a href=\"#\">" + bdCategoryList[i].bdnickname + "</a></td>";
					output += "<td class=\"text-center\">" + bdCategoryList[i].bddate + "</td>";
					output += "<td class=\"text-center\">" + bdCategoryList[i].bdhits + "</td>";
					output += "<td class=\"text-center text-info fw-bold\">" + bdCategoryList[i].bdrccount + "</td>";
					output += "</tr>";
				}
			}
		});
		$("#bdCategoryList").html(output);
	}
	
</script>

</html>