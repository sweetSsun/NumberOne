<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 마이페이지 중고거래</title>


<!--jquery & bootstrap(5css)-->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">        
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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

	.text_leng {
	
	text-overflow: ellipsis;
	overflow:hidden;
	white-space : nowrap;	
	text-decoration: none; !important
	color:black;
	}
	
	.text_leng:hover {
		color : #00BCD4;
		font-weight: bold;
		cursor: pointer;
		text-decoration: none;!important
	}

	.write:hover {
		color : #00BCD4;
		font-weight: bold;
		text-decoration: none;	!important
	}
	
	.delete_leng {
	
	text-overflow: ellipsis;
	overflow:hidden;
	white-space : nowrap;	
	text-decoration: none;!important
	color:gray;
	}	
	
	.buttonPoint {
	
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
		<div style="min-height: 60px;" id="scroll-sellbuy"></div>
		<!-- 본문 -->
			<div class="container">
				<br>
				<div class="checkout__form" style="margin-top: 20px;"><h4>마이페이지 공구</h4></div>
				<br>
				<br>
				<!-- 참여 공구 목록 -->
				<div class="row" >				
					<h4 class="checkout__form" style="color: #00BCD4; margin-left: 30px;">참여 공구 목록</h4>
				</div>
				<div class="row"  style="margin:20px; ">
				<!-- 여백 -->
				<div style="min-height: 30px;"></div>				
				<div class="row">
				<table>
						<tr class="text-center" id="board_column">
							<td>글번호</td>
							<td>제목</td>
							<td>결제일</td>						
							<td>진행사항</td>
						</tr>
						<c:forEach items="${gonguList }" var="gongu">
						
						<c:choose>
						
						<c:when test="${gongu.gnbstate == 2}">
							<tr style="border-bottom: solid #E0E0E0 1px;  color:gray; text-align: center; ">
								<td style="text-decoration : line-through;">${gongu.gnbcode }</td>
								<td><span style="text-decoration : line-through;" class="delete_leng">${gongu.gnbtitle }</span></td>
								<td style="text-decoration : line-through;">${gongu.gdate }</td>
								<td>진행완료</td>
							</tr>						
						</c:when>					
						
						<c:otherwise>
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; ">
							<td>${gongu.gnbcode }</td>
							<td><a href="" class="text_leng">${gongu.gnbtitle }</a></td>
							<td>${gongu.gdate }</td>
							<td>진행중</td>
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
<!--jquery & bootstrap(5js)-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>






</html>