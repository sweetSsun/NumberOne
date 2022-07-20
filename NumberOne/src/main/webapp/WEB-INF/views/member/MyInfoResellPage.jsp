<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 마이페이지 중고거래</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   

<!-- ogani css -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">         
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style type="text/css">

	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}

	#board_column{
		border-bottom: solid gray 3px;
	}

	table{
		margin: 20px;
		font-size: 18px;
		table-layout: fixed;
		border-left: 20px; 
	}
	
	td {
	overflow:hidden;		
	white-space : nowrap;		
	text-overflow: ellipsis;
	padding: 10px;
	

	}

.site-btn { background-color: #00BCD4; }	

/* .blank {

		overflow: auto;
		margin-top: 500px;
} */

	.buttonPoint {
		cursor: pointer;
		
	}
	
	.buttonPoint:hover {
		color : #00BCD4;
		font-weight: bold;
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
		<div style="min-height: 40px;" id="scroll-sellbuy"></div>
		<!-- 본문 -->
			<div class="container">
				<br>
				<div class="checkout__form" style="margin-top: 20px;"><h4>마이페이지 중고거래</h4></div>
				<br>
				<br>
				<!-- 8949 목록 -->
                            <div class="row">
                                <div class="col-lg-6" >
                                    <div>
                                    
										<!-- 팔구 목록 -->
										<h4 class="" style="color: #00BCD4; margin-left: 30px;" class ="blank">팔구</h4>  
										<table style="width: 550px;">
											<tr class="text-center" id="board_column">
											<td>글제목</td>
											</tr>											
									<c:forEach items="${sellBoard }" var="sell" varStatus="index">
									<c:choose>
										<c:when test="${sell.ubstate == 0}">
											<tr style="border-bottom: solid #E0E0E0 1px; color:gray; text-align: center;">
											<td>(정지)&nbsp;<span style="text-decoration : line-through;">${sell.ubtitle}</span></td></tr>									
										</c:when>
										<c:when test="${sell.ubstate == 2}">
											<tr style="border-bottom: solid #E0E0E0 1px; color:gray; text-align: center;">
											<td>(삭제)&nbsp;<span style="text-decoration : line-through;">${sell.ubtitle}</span></td></tr>									
										</c:when>										
										<c:otherwise>
											<tr style="border-bottom: solid #E0E0E0 1px; text-align: center;">						
											<td><a href="selectResellView?ubcode=${sell.ubcode }&ubsellbuy=S&modifyCheck=LIST">${sell.ubtitle}</a></td>					
											</tr>									
										</c:otherwise>
									</c:choose>		
										</c:forEach> 
										</table>										                                  
                                    </div>
                                </div>    
                                <div class="col-lg-6" >
                                    <div>
										<!-- 사구 목록 -->
										<h4 class="" style="color: #00BCD4; margin-left: 30px;" class ="blank">사구</h4>  
										<table style="width: 550px;">
											<tr class="text-center" id="board_column">
											<td>글제목</td>
											</tr>											
									<c:forEach items="${buyBoard }" var="buy" varStatus="index">
									<c:choose>
										<c:when test="${buy.ubstate == 0}">
											<tr style="border-bottom: solid #E0E0E0 1px; color:gray; text-align: center;">
											<td>(정지)&nbsp;<span style="text-decoration : line-through;">${buy.ubtitle}</span></td></tr>									
										</c:when>
										<c:when test="${buy.ubstate == 2}">
											<tr style="border-bottom: solid #E0E0E0 1px; color:gray; text-align: center;">
											<td>(삭제)&nbsp;<span style="text-decoration : line-through;">${buy.ubtitle}</span></td></tr>									
										</c:when>										
										<c:otherwise>
											<tr style="border-bottom: solid #E0E0E0 1px; text-align: center;">						
											<td><a href="selectResellView?ubcode=${buy.ubcode }&ubsellbuy=S&modifyCheck=LIST">${buy.ubtitle}</a></td>					
											</tr>									
										</c:otherwise>
									</c:choose>		
										</c:forEach> 
										</table>                                    

				<!-- 여백 -->				
					<div style="min-height: 500px;"></div>										
                                    </div>
                                </div> 																		                                  
                             </div>                	        
							
				<!-- 채팅 목록 -->
				<!-- 여백 -->
				<div style="min-height: 230px;" id="scroll-chat"></div>				
				<div class="row">
					<br><h4 class="checkout__form" style="color: #00BCD4;">채팅 내역 (미완성)</h4>
				</div>
				<!-- 여백 -->
				<div style="min-height: 50px;"></div>				
				<div class="row" >
				<table>
						<tr class="text-center" id="board_column">
							<td>닉네임</td>
							<td>최신채팅글</td>						
							<td>날짜</td>
						</tr>
 						<c:forEach items="${chatRoomList }" var="chat"> 
							
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; ">
								<td><div onclick="writeMemberSellbuy('${chat.crfrmnickname }')" class="buttonPoint">${chat.crfrmnickname }</div></td>
								<td><div onclick="popupChat('${chat.crcode }')" class="buttonPoint">${chat.recentCmcontents }</div></td>
								<td>${chat.recentCmdate }</td>
							</tr>
														
						</c:forEach> 
				</table>
				<!-- 여백 -->				
				<div style="min-height: 700px;"></div>
				</div>
	
				<!-- 찜 목록 -->
				<!-- 여백 -->
				<div style="min-height: 230px;" id="scroll-zzim"></div>				
				<div class="row">
					<br><h4 class="checkout__form" style="color: #00BCD4;">찜목록</h4>
				</div>
				<!-- 여백 -->
				<div style="min-height: 30px;"></div>				
				<div class="row">
				<table>
						<tr class="text-center" id="board_column">
							<td>글제목</td>
							<td>작성자</td>						
							<td>날짜</td>
						</tr>
						<c:forEach items="${zzimBoard }" var="zzim">
						
						<c:choose>
						
						<c:when test="${zzim.ubstate == 0}">
							<tr style="border-bottom: solid #E0E0E0 1px;  color:gray; text-align: center; ">
								<td>(정지)&nbsp;<span style="text-decoration : line-through;">${zzim.ubtitle }</span></td>
								<td style="text-decoration : line-through;">${zzim.mnickname }</td>
								<td style="text-decoration : line-through;">${zzim.ubdate }</td>
							</tr>						
						</c:when>

						<c:when test="${zzim.ubstate == 2}">
							<tr style="border-bottom: solid #E0E0E0 1px;  color:gray; text-align: center; ">
								<td>(삭제)&nbsp;<span style="text-decoration : line-through;">${zzim.ubtitle }</span></td>
								<td style="text-decoration : line-through;">${zzim.mnickname }</td>
								<td style="text-decoration : line-through;">${zzim.ubdate }</td>
							</tr>						
						</c:when>						
						
						<c:otherwise>
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; ">
							<c:choose>
							<c:when test="${zzim.ubsellbuy == 'S' }">
								<td><a href="selectResellView?ubcode=${zzim.zzubcode }&ubsellbuy=S&modifyCheck=LIST">${zzim.ubtitle }</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="selectResellView?ubcode=${zzim.zzubcode }&ubsellbuy=B&modifyCheck=LIST">${zzim.ubtitle }</a></td>						
							</c:otherwise>
							</c:choose> 
								<td><div onclick="writeMemberSellbuy('${zzim.mnickname }')"
								class="buttonPoint">${zzim.mnickname }</div></td>
								<td>${zzim.ubdate }</td>
							</tr>
						</c:otherwise> 
						
						</c:choose>
						 
					<!-- 찜한 목록 끝 -->
														
						</c:forEach>
				</table>
				<div style="min-height: 600px;"></div>
				</div>				
				</div>	
							
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>






</html>