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
<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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

  .d_none{
  		display : none;
  		}

	.buttonPoint {
		cursor: pointer;
		
	}
	
	.buttonPoint:hover {
		color : #00BCD4;
		font-weight: bold;
	}
	
	.textareaSt {
		border: solid #E0E0E0 1px;
		margin: 20px;
		padding: 10px;
		
	}	
	
.site-btn {

background-color: #00BCD4;

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
				<div class="row">
					<div class="col-lg-9"   style="margin:0px; padding-left: 50px;">
					<h4 class="checkout__form" style="color: #00BCD4;">문의내역</h4>
					</div>  
					<div class="col-lg-3"  style=" margin:0px; padding-right: 50px;">					                      
					<!-- 작성하기 버튼 -->    
                       <button class="site-btn" style="border-radius: 4px; float: right;"
                       onclick = "location.href = 'loadToMyInfoQuestionForm' " >                        
                        작성하기</button>
					</div>					
				</div> <br>

				<div class="row" >
				<table >
				
						
						<tr class="text-center" id="board_column">
							<td style="width: 200px;">글번호</td>
							<td>제목</td>
							<td style="width: 250px;">날짜</td>
						</tr>
												
						<c:forEach items="${contact }" var="contact">
							<!-- 작성글 목록 -->
							
							<!-- 글번호 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; height: 50px;">
								<td>${contact.ctcode }</td>
							<!-- 글제목 -->
							<c:choose>
							<c:when test="${contact.ctans !=null}">
								<td onclick="showContents('${contact.ctcode }')" class="buttonPoint">${contact.cttitle } &nbsp;
								<i class="fa-solid fa-comment-dots"></i></td>
							</c:when>
							<c:otherwise>
								<td onclick="showContents('${contact.ctcode }')" class="buttonPoint">${contact.cttitle }</td>
							</c:otherwise>
							</c:choose>	
							<!-- 문의날짜 -->	
								<td>${contact.ctdate }</td>								
							</tr>
							<!-- 문의내용 -->
							<tr style="border-bottom: solid #E0E0E0 1px; height: 50px;" class="d_none" id="${contact.ctcode }_title">
								<td colspan="3" class="fw-bold" style=" padding-left: 30px; background-color: #EAEAEA;">
								문의 내용 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 100px;" class="d_none" id="${contact.ctcode }_contents">
								<td colspan="3" style=" padding-left: 30px;" >${contact.ctcontents }</td>							
							</tr>
							<!-- 답변 -->							
								<c:choose>
									<c:when test="${contact.ctans !=null}">
							<tr style="border-bottom: solid #E0E0E0 1px; height: 50px; margin-bottom:30px; " class="d_none" id="${contact.ctcode }_replytitle">
								<td colspan="3" class="fw-bold" style=" padding-left: 30px; background-color: #EAEAEA;"> ⤷ 답변 </td>							
							</tr>
										<tr style="border-bottom: solid #E0E0E0 1px; height: 100px; background-color: #EAEAEA;" 
										class="d_none"  id="${contact.ctcode }_replycontents">
										<td colspan="2" style=" padding-left: 50px; color: #00BCD4; font-weight: bold;" >${contact.ctans }</td>
										<td colspan="1" style=" padding-left: 30px; color: #00BCD4; font-weight: bold;" >${contact.ctansdate }</td>						
										</tr>
									</c:when>														
							</c:choose>																												
						</c:forEach>				
					</table>
				</div>				
				<br><br>
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	function showContents(ctcode){
		console.log(ctcode);
		$("#"+ctcode+"_title").toggleClass("d_none");
		$("#"+ctcode+"_contents").toggleClass("d_none");
		$("#"+ctcode+"_replytitle").toggleClass("d_none");
		$("#"+ctcode+"_replycontents").toggleClass("d_none");		
		
	}



</script>


</html>