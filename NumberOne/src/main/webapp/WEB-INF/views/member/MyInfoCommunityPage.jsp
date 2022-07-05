<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 마이페이지 커뮤니티</title>

<%@ include file="/resources/css/CommonCss.jsp"%>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- ogani css -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">         
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style type="text/css">
	#board_column{
		border-bottom: solid gray 3px;
	}
	table{
		margin: 20px;
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
	<!-- End of TobBar -->
	
	<main>
		
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp" %>
		
		<section>
		<!-- 본문 -->
			<div class="container">
				<br>
				<div class="checkout__form"><h4>마이페이지 커뮤니티</h4></div>
				<br>
				<!-- 작성글 목록 -->
				<div class="row" style="margin:20px;">
					<br><h4 class="checkout__form" style="color: #004804;">작성글 목록 (댓글 쓴 글만 나오는중 ㅠ 수정 필요)</h4>
				</div>
				<div class="row"  style="margin:20px;">
				<table>
						<tr class="text-center" id="board_column">
							<td>글번호</td>
							<td>제목</td>
							<td>댓글수</td>
							<td>날짜</td>
						</tr>
						<c:forEach items="${board }" var="board">
							<!-- 작성글 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center;">
								<td>${board.bdcode }</td>
								<td><a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a></td>
								<td>${board.bdreply }</td>
								<td>${board.bddate }</td>								
							</tr>
						</c:forEach>
				</table>
				</div>
			
				<br><hr><br>
				
				
				<!-- 댓글작성글 목록 -->
				<div class="row" style="margin:20px;">
					<br><h4 class="checkout__form" style="color: #004804;"> 댓글 작성 글 목록</h4>
				</div>
				<div class="row"  style="margin:20px;">
				<table >
						<tr class="text-center" id="board_column">
							<td>댓글번호</td>
							<td>글제목</td>
							<td>댓글내용</td>							
							<td>날짜</td>
						</tr>
						<c:forEach items="${reply }" var="reply">
							<!-- 작성글 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center;">
								<td>${reply.rpcode }</td>
								<td><a href="selectBoardView?bdcode=${reply.rpbdcode }">${reply.rpbdtitle}</a></td>
								<td><a href="selectBoardView?bdcode=${reply.rpbdcode }">${reply.rpcontents }</a></td>
								<td>${reply.rpdate }</td>								
							</tr>
						</c:forEach>
				</table>
				</div>

				<br><hr><br>				
				
				<!-- 스크랩 목록 -->
				<div class="row" style="margin:20px;">
					<br><h4 class="checkout__form" style="color: #004804;">스크랩 목록</h4>
				</div>
				<div class="row"  style="margin:20px;">
				<table >
						<tr class="text-center" id="board_column">
							<td>글번호</td>
							<td>제목</td>
							<td>댓글수</td>
							<td>작성자</td>
							<td>날짜</td>
						</tr>
						<%-- <c:forEach items="${noticeList }" var="notice"> --%>
							<!-- 작성글 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center;">
								<td>1(예시)</td>
								<td>안녕하세요(예시)</td>
								<td>5(예시)</td>
								<td>둘리(예시)</td>
								<td>2022-07-01 11:13(예시)</td>								
							</tr>
						<%-- </c:forEach> --%>
				
				</table>
				<br>
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