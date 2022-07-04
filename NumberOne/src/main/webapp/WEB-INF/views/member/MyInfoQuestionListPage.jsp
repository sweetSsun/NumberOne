<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 1:1 문의 내역 페이지</title>

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
	

  summary {
    cursor: pointer;
  }

  /* 삼각형 없애기 */
  summary {
    list-style: none;
  }
  summary::-webkit-details-marker {
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
	<!-- End of TopBar -->
	
	<main>
		
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp" %>
		
		<section>
		<!-- 본문 -->
			<div class="container">
				<br>
				<div class="checkout__form"><h4>마이페이지 1:1문의</h4></div>
				<br>
				<!-- 작성글 목록 -->
				<div class="row" style="margin:20px;">
					<div class="col-lg-10">
					<h4 class="checkout__form" style="color: #004804;">문의내역</h4>
					</div>  
					<div class="col-lg-2" >					                      
					<!-- 작성하기 버튼 -->    
                        <button class="site-btn" style="border-radius: 4px;"  
                       onclick = "location.href = 'loadToMyInfoQuestionForm' " >                        
                        작성하기</button>
					</div>					
				</div> <br>
				<!-- 댓글작성글 목록 -->
				<div class="row" style="margin:20px;">
					<br><h4 class="checkout__form" style="color: #004804;"> 댓글 작성 글 목록</h4>
				</div>
				<div class="row"  style="margin:20px;">
				<table >
				
						
						<tr class="text-center" id="board_column">
							<td>글번호</td><td>제목</td><td>날짜</td>
						</tr>
												
						<c:forEach items="${contact }" var="contact">
							<!-- 작성글 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; height: 50px;">
								<td>${contact.ctcode }</td>
								<td>${contact.cttitle }</td>
								<td>${contact.ctdate }</td>								
							</tr>
							<tr style="border-bottom: solid #E0E0E0 1px; height: 50px;">
								<td colspan="3" class="fw-bold" style=" padding-left: 30px;">문의 내용 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 100px;">
								<td colspan="3" style=" padding-left: 30px;">${contact.ctcontents }</td>							
							</tr>							
							
						</c:forEach>
				
				</table>
				</div>			
			
				<br><hr><br>
				<%-- <div class="row"  style="margin:20px;">
				<table>
						<tr class="text-center" id="board_column">
							<td>글번호</td>
							<td>제목</td>
							<td>날짜</td>
						</tr>
						<c:forEach items="${contact }" var="contact">
							<!-- 작성글 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center;">
								<td>${contact.ctcode }</td>
								<td>${contact.cttitle }</td>
								<td>${contact.ctdate }</td>															
							</tr>
							
							
							<tr><td>문의 내용</td></tr>
							<tr><td>${contact.cttitle }</td></tr>
							
						</c:forEach>
				</table>
				</div> --%>

			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>


</html>