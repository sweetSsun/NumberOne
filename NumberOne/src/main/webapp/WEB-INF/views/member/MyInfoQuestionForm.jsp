<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 1:1문의 작성 페이지</title>

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
				<!-- 재수정 -->
				<!-- 작성글 목록 -->
                <form class="user" action="insertMyInfoQuestionWrite" method="post">                                
                            <div class="row">
                                    <div>
										<h4 class="" style="color: #00BCD4; margin-left: 30px;">문의하기</h4>  
										<table style="width: 1000px;">
											<tr class="text-center" id="board_column">
											<td style="width: 200px; padding: 20px;">작성자</td>
											<td style="padding: 20px;" >
											<input style=" height: 60px; width: 800px; padding: 20px; border:0px;" readonly="readonly" rename="ctmid"
											value="${sessionScope.loginId }">
											</td>
											</tr>
											<tr class="text-center" id="board_column">
											<td style="width: 200px; padding: 20px;">제목</td> 
											<td style="padding: 20px;" >
											<input style=" height: 60px; width: 800px; padding: 20px;" name="cttitle">
											</td>
											</tr>
											<tr class="text-center" id="board_column">
											<td style="width: 200px; padding: 20px;">내용</td>
											<td style="padding: 20px;">
											<textarea  style="height: 300px; width: 800px; padding: 20px;" name="ctcontents"></textarea></td>
											</tr>											
										</table>										                                  
                                    </div>
                                   
                             </div>				
				<!-- 작성글 목록 -->
				
				<br>
                        <div class="row">
                        	<div class="col-lg-12" style="margin-left: 400px;">						
                        		<!--<button type="button" class="site-btn" style="width: 130px; border-radius: 4px;"
                        		onclick = "location.href = 'selectMyInfoQuestionListView' " >
                        		취소</button>-->
                        		<button type="submit" class="site-btn" style="width: 130px; border-radius: 4px;"> 
                        		등록</button>                        
                        	</div>
                         </div>
                         </form>
                         <br>					
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