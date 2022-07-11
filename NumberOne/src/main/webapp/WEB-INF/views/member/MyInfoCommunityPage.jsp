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

<!-- Jquery -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 -->


<style type="text/css">
	#board_column{
		border-bottom: solid gray 3px;
	}
	table{
		margin: 20px;
		font-size: 20px;
	}
	
.site-btn {

background-color: #00BCD4;

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
					<br><h4 class="checkout__form" style="color: #00BCD4;">작성글 목록</h4>
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
								<td>
									<c:choose>
										<c:when test="${board.bdcategory.equals('자랑') }">
											<!-- 자랑글 상세 -->
											<a href="loadToRoomViewPage?bdcode=${board.bdcode }">${board.bdtitle}</a>
										</c:when>
										<c:otherwise>
											<!-- 일반글 상세 -->										
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a>
										</c:otherwise>
									</c:choose>
								</td>	
								<td>${board.bdreply }</td>
								<td>${board.bddate }</td>								
							</tr>
						</c:forEach>
				</table>
				</div>
			
				<br><hr><br>
				
				
				<!-- 댓글작성글 목록 -->
				<div class="row" style="margin:20px;">
					<br><h4 class="checkout__form" style="color: #00BCD4;"> 댓글 작성 글 목록</h4>
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
								<td>
									<c:choose>
										<c:when test="${reply.rpbdcategory.equals('자랑') }">
											<!-- 자랑글 상세 -->
											<a href="loadToRoomViewPage?bdcode=${reply.rpbdcode }">${reply.rpbdtitle}</a>
										</c:when>
										<c:otherwise>
											<!-- 일반글 상세 -->										
											<a href="selectBoardView?bdcode=${reply.rpbdcode }">${reply.rpbdtitle}</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${reply.rpbdcategory.equals('자랑') }">
											<!-- 자랑글 상세 -->
											<a href="loadToRoomViewPage?bdcode=${reply.rpbdcode }">${reply.rpcontents }</a>
										</c:when>
										<c:otherwise>
											<!-- 일반글 상세 -->										
											<a href="selectBoardView?bdcode=${reply.rpbdcode }">${reply.rpcontents }</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${reply.rpdate }</td>								
							</tr>
						</c:forEach>
				</table>
				</div>

				<br><hr><br>				
				
				<!-- 스크랩 목록 -->
				<div class="row" style="margin:20px;">
					<br><h4 class="checkout__form" style="color: #00BCD4;">스크랩 목록 (작성자 상세보기 test 중)</h4>
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
						<c:forEach items="${scrap }" var="scrap">
							<!-- 스크랩 목록(스크랩은 자랑글만 가능함 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; ">
								<td>${scrap.scbdcode }</td>
								<td><a href="loadToRoomViewPage?bdcode=${scrap.scbdcode }">${scrap.bdtitle }</a></td>
								<td>${scrap.bdreply }</td>
								<td><input type="text" value="${scrap.mnickname }" readonly="readonly" onclick="writeMember('${scrap.mnickname }');"
								style="border: 0px; text-align: center; cursor: pointer;"></td>
								<td>${scrap.bddate }</td>								
							</tr>
														
						</c:forEach>
				
				</table>
				<br>
				</div>



						
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
>
<!-- 팝업 -->
 <script type="text/javascript">

  function writeMember(nickname) { 
	  var url = 'selectWriteMemberInfo?nickname='+nickname;
	  window.open(url, 'memberInfo', 'width=600%, height=650%, left=500, top=50 '); 
	  console.log("nickname : " + nickname);
	  }
  </script>



</body>



</html>