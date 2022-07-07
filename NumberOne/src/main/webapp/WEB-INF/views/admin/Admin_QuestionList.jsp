<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 문의관리</title>

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
  	#pageList button{
 		display: none;
	}
	label{
		cursor: pointer;
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
		<!-- 본문 -->
		<form action="admin_selectQuestionList" method="get">
			<div class="container">
				<br>
				<div class="checkout__form"><h4>문의 관리페이지 - Admin_QuestionList.jsp</h4></div>
				<br>
				<!-- 작성글 목록 -->
<!--				<div class="row" >
 					<div class="col-lg-6">
					<h4 class="checkout__form" style="color: #00BCD4; padding-left: 30px;">문의내역22</h4>
					</div>  
					<br> -->
                <!-- 상태값 정렬 -->
	            <div class="row" style="margin-top: 20px;">
	               <div class="col">
	                   <select name="searchVal" id="searchValSel" onchange="ctSearchState(this.value)">
	                     <option value="all">전체</option>
	                     <option value="standBy">대기</option>
	                     <option value="finish">완료</option>
	                  </select>
	               </div>
	            </div>
	            
				<div class="row"  style="margin:20px;">
				<table >
					<thead>
						<tr class="text-center" id="board_column">
							<td style="width: 200px;">글번호</td>
							<td>제목</td>
							<td style="width: 250px;">작성자</td>
							<td style="width: 200px;">날짜</td>
							<td style="width: 50px;">답변</td>
						</tr>												
					</thead>					
					<tbody id="ctListTbody">
			 			<c:forEach items="${contactList }" var="contact">
							<!-- 문의 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; height: 50px;">
								<td>${contact.ctcode }</td>
								<td onclick="showContents('${contact.ctcode }')" class="buttonPoint">${contact.cttitle }</td>
								<td>${contact.ctnickname }</td>
								<td>${contact.ctdate }</td>
								<c:choose>
									<c:when test="${contact.ctans != null}">
										<td>완료</td>								
									</c:when>
									<c:otherwise>
										<td id="${contact.ctcode }_state">대기</td>								
									</c:otherwise>
								</c:choose>								
							</tr>
							<tr style="border-bottom: solid #E0E0E0 1px; height: 50px;" class="replyForm d_none" id="${contact.ctcode }_title">
								<td colspan="5" class="fw-bold" style=" padding-left: 30px; background-color: #EAEAEA;">
								문의 내용 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 100px;" class="replyForm d_none" id="${contact.ctcode }_contents">
								<td colspan="5" style=" padding-left: 30px;" >${contact.ctcontents }</td>							
							</tr>
							<!-- 답변 -->							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 50px;" class="replyForm d_none" id="${contact.ctcode }_replytitle">
								<td colspan="5" class="fw-bold" style=" padding-left: 30px; background-color: #EAEAEA;"> 답변 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 100px;" class="replyForm d_none" id="${contact.ctcode }_replycontents">
								<td colspan="4">
									<div class="commentWriteForm">
										<textarea id="${contact.ctcode }_ctans" class="textareaSt" rows="3" cols="80" style="width:100%;" placeholder="문의글에 대한 답변을 작성해주세요."></textarea>
									</div>	
								</td>
								<td  style="padding-left: 50px;">
									<input type="button" onclick="insertReply('${contact.ctcode}')" value="등록" 
									class="site-btn" style="width: 130px; border-radius: 4px;">
								</td>															
							</tr>		
												
						</c:forEach>
					</tbody>
				</table>
				</div>			

				<br>
				<!-- 페이징 -->
	  			<div class="block text-center" id="pageList">
	               	<c:choose>
	               		<c:when test="${paging.prev }">
	               			<button type="submit" name="page" value="${paging.page -1 }" id="btn0"></button>
	               			<label for="btn0">[이전]</label>
	               		</c:when>
	               		<c:otherwise>
	               			[이전]
	               		</c:otherwise>
	               	</c:choose>
	               	
	               	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" step="1">
	                	<c:choose>
	                		<c:when test="${paging.page == num }">
	                			<span style="color:#00bcd4;">${num }</span>
	                		</c:when>
	                		<c:otherwise>
	                			<button type="submit" name="page" value="${num }" id="btn${num }"></button>
	               				<label for="btn${num }">${num }</label>
	                		</c:otherwise>
	                	</c:choose>
	               	</c:forEach>
	
	               	<c:choose>
	               		<c:when test="${paging.next }">
	               			<button type="submit" name="page" value="${paging.page +1 }" id="btn6"></button>
	               			<label for="btn6">[다음]</label>
	               		</c:when>
	               		<c:otherwise>
	               			[다음]
	               		</c:otherwise>
	               	</c:choose>
	            </div>
            
				<hr><br>

			</div>
		</form>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">

	// 문의글 클릭하면 답변폼 출력
	function showContents(ctcode){
		console.log(ctcode);
		// 보고 있던 문의글이 있다가 다른 문의글을 누를 경우, 모두 d_none 속성 부여 후 toggle
		if ( $("#"+ctcode+"_title").hasClass("d_none") ){
			$(".replyForm").addClass("d_none");
		}
		$("#"+ctcode+"_title").toggleClass("d_none");
		$("#"+ctcode+"_contents").toggleClass("d_none");
		$("#"+ctcode+"_replytitle").toggleClass("d_none");
		$("#"+ctcode+"_replycontents").toggleClass("d_none");		
	}

	// 답변 insert
	function insertReply(ctcode){
		console.log("insertReply() 실행");
		console.log("문의코드 : " + ctcode);
		var ctans = $("#"+ctcode+"_ctans").val();
		console.log("답변 : " + ctans);
		
		
		
		
		
		var output = "<td colspan='5' style='padding-left: 30px;'>";
		output += $("#"+ctcode+"_ctans").val().replaceAll("\r\n", "<br>");
		output += "</td>";
		
		$("#"+ctcode+"_replycontents").text("")		
			.html(output);
		$("#"+ctcode+"_state").text("완료");
	}
	

</script>

<script type="text/javascript">
	// 선택한 정렬 select option으로 선택되도록 하기
	var searchValOption = $("#searchValSel option");
	var searchVal = "${paging.searchVal}";
	if (searchVal.length > 0) {
		for (var i = 0; i < searchValOption.length; i++){
			if (searchValOption.eq(i).val() == searchVal){
				searchValOption.eq(i).attr("selected", "selected");
			}
		}
	}
	
	// 정렬 select하면 ajax로 회원목록 받고 출력을 바꿔주는 함수
	function ctSearchState(searchVal){
		console.log("ctSearchState() 실행");
		console.log("정렬 선택 : " + searchVal);
		$.ajax({
			type: "get",
			data: {"searchVal":searchVal, "ajaxCheck":"list"},
			url: "admin_selectQuestionList_ajax",
			dataType: "json",
			success: function(result){
				var output = "";
				console.log(result);					
				for (var i = 0; i < result.length; i++){
					output += "<tr style='border-bottom: solid #E0E0E0 1px; text-align: center; height: 50px;'>";
					output += "<td>" + result[i].ctcode + "</td>";
					output += "<td onclick='showContents(\"" + result[i].ctcode + "\")' class='buttonPoint'>" + result[i].cttitle + "</td>";
					output += "<td>" + result[i].ctnickname + "</td>";
					output += "<td>" + result[i].ctdate + "</td>";
					if (result[i].ctans != null){
						output += "<td>완료</td>";
					} else {
						output += "<td id='" + result[i].ctcode + "_state'>대기</td>";
					}
					output += "</tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; height: 50px;' class='replyForm d_none' id='" + result[i].ctcode + "_title'>"
							+ "<td colspan='5' class='fw-bold' style='padding-left: 30px; background-color: #EAEAEA;'>문의 내용 </td></tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; height: 100px;' class='replyForm d_none' id='" + result[i].ctcode + "_contents'>"
							+ "<td colspan='5' style='padding-left: 30px;'>" + result[i].ctcontents + "</td></tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; height: 50px;' class='replyForm d_none' id='" + result[i].ctcode + "_replytitle'>"
							+ "<td colspan='5' class='fw-bold' style='padding-left: 30px; background-color: #EAEAEA;'> 답변 </td></tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; height: 100px;' class='replyForm d_none' id='" + result[i].ctcode + "_replycontents'>";
					output += "<td colspan='4'>"
							+ "<div class='commentWriteForm'>"
							+ "<textarea id='" + result[i].ctcode + "_ctans' class='textareaSt' rows='3' cols='80' style='width:100%;' placeholder='문의글에 대한 답변을 작성해주세요.'></textarea>"
							+ "</div>"
							+ "</td>";
					output += "<td  style='padding-left: 50px;'>";
					output += "<input type='button' onclick='insertReply(\'" + result[i].ctcode + "\')' value='등록' class='site-btn' style='width: 130px; border-radius: 4px;'>";
					output += "</td>";
					output += "</tr>";
				}
				$("#ctListTbody").html(output);
			}
		});
		// 페이지에서 출력할 페이지번호 받아오기
		$.ajax({
			type: "get",
			data: {"searchVal":searchVal, "ajaxCheck":"page"},
			url: "admin_selectQuestionList_ajax",
			dataType: "json",
			success: function(result){
				console.log("요청 페이지 : " + result.page);
				$("#pageList").text("");
				// 페이징 번호 출력
				var pageList = "";
				if (result.prev) {
					pageList += "<button type='submit' name='page' value='" + (result.page - 1) + "' id='btn0'></button>";
					pageList += "<label for='btn0'>[이전]</label>";
				} else {
					pageList += "[이전] ";
				}
				for (var i = result.startPage; i <= result.endPage; i++){
					if (result.page == i){
						pageList += "<span style='color:#00bcd4'>" + i + "</span>";
					} else {
						pageList += "<button type='submit' name='page' value='" + i + "' id='btn" + i + "'></button>";
						pageList += "<label for='btn" + i + "'>" + i + "</label>";
					}
				}
				if (result.next){
					pageList += "<button type='submit' name='page' value='" + (result.page + 1) + "' id='btn6'></button>";
					pageList += "<label for='btn6'>[다음]</label>";
				} else {
					pageList += "[다음]";
				}
				$("#pageList").html(pageList);
			},
			error: function(){
				alert("페이징넘버링 실패");
			}
		})
	}	
</script>

</html>