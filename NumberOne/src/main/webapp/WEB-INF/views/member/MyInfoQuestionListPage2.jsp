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
				<div class="row" >
					<div class="col-lg-6">
					<h4 class="checkout__form" style="color: #00BCD4; padding-left: 30px;">문의내역22</h4>
					</div>  
					<div class="col-lg-6" style="padding-left: 20px;">					                      
					<!-- 작성하기 버튼 -->    
                        <button class="site-btn" style="border-radius: 4px; "  
                       onclick = "location.href = 'loadToMyInfoQuestionForm' " >                        
                        작성하기</button>
					</div>					
				</div> <br>

				<div class="row"  style="margin:20px;">
				<table >
				
						
						<tr class="text-center" id="board_column">
							<td style="width: 200px;">글번호</td>
							<td>제목</td>
							<td style="width: 250px;">날짜</td>
						</tr>
												
						<c:forEach items="${contact }" var="contact">
							<!-- 작성글 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; height: 50px;">
								<td>${contact.ctcode }</td>
								<td onclick="showContents('${contact.ctcode }')" class="buttonPoint">${contact.cttitle }</td>
								<td>${contact.ctdate }</td>								
							</tr>
							<tr style="border-bottom: solid #E0E0E0 1px; height: 50px;" class="d_none" id="${contact.ctcode }_title">
								<td colspan="3" class="fw-bold" style=" padding-left: 30px; background-color: #EAEAEA;">
								문의 내용 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 100px;" class="d_none" id="${contact.ctcode }_contents">
								<td colspan="3" style=" padding-left: 30px;" >${contact.ctcontents }</td>							
							</tr>
							<!-- 답변 -->							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 50px;" class="d_none" id="${contact.ctcode }_replytitle">
								<td colspan="3" class="fw-bold" style=" padding-left: 30px; background-color: #EAEAEA;"> 답변 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 100px;" class="d_none" id="${contact.ctcode }_replycontents">
								<td colspan="2">
									<div class="commentWriteForm">
										<textarea id="inputComment" class="textareaSt" rows="3" cols="80" placeholder="답변을 조금만 기다려주세요 :)"></textarea>
									</div>	
								</td>
								<td  style="padding-left: 50px;">
									<input type="button" onclick="insertReply()" value="등록" 
									class="site-btn" style="width: 130px; border-radius: 4px;">
								</td>															
							</tr>							
						</c:forEach>
				
				</table>
				</div>			

				<br><hr><br>

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