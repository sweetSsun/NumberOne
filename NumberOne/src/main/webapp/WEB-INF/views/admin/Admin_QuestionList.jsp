<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 문의관리</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listCss.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">         


<style type="text/css">
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
		font-size: 20px;
		margin: 10px;
		padding: 10px;
		resize: none;
		width: -webkit-fill-available;
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
	.pl-3{
		padding-left: 30px;
	}
	.m-3{
		margin: 30px;
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
		<form action="admin_selectQuestionList" method="get" id="actionForm">
			<div class="container">
				<div class="row" style="margin:auto;">
	                <h4 class="text-center">문의 관리페이지 - Admin_QuestionList.jsp</h4>
	            </div>
                <!-- 상태값 정렬 -->
	            <div class="row" style="margin-top: 20px;">
	               <div class="col">
	                   <select class="categoryList" name="searchVal" id="searchValSel" onchange="ctSearchState(this.value)">
	                     <option class="categorySel" value="all">전체</option>
	                     <option class="categorySel" value="standBy">대기</option>
	                     <option class="categorySel" value="finish">완료</option>
	                  </select>
	               </div>
	            </div>
	            
				<div class="row mt-2">
				<table style="table-layout: fixed;">
					<thead>
						<tr class="text-center fw-bold" id="board_column">
							<td style="width: 15%;">글번호</td>
							<td>제목</td>
							<td style="width: 15%;">작성자</td>
							<td style="width: 10rem;">날짜</td>
							<td style="width: 4rem;">답변</td>
						</tr>												
					</thead>					
					<tbody id="ctListTbody">
			 			<c:forEach items="${contactList }" var="contact">
							<!-- 문의 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; height: 40px;">
								<td class="overflow text-center">${contact.ctcode }</td>
								<td onclick="showContents('${contact.ctcode }')" class="buttonPoint overflow">${contact.cttitle }</td>
								<td class="overflow text-center pointer" onclick="writeMemberBoard('${contact.ctnickname}')">${contact.ctnickname }</td>
								<td class="overflow text-center">${contact.ctdate }</td>
								<c:choose>
									<c:when test="${contact.ctans != null}">
										<td class="text-center">완료</td>								
									</c:when>
									<c:otherwise>
										<td class="text-center" id="${contact.ctcode }_state">대기</td>								
									</c:otherwise>
								</c:choose>								
							</tr>
							<tr style="border-bottom: solid #E0E0E0 1px; height: 40px;" class="replyForm d_none" id="${contact.ctcode }_title">
								<td colspan="5" class="fw-bold px-3 py-1" style="background-color: #EAEAEA;">
								문의 내용 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; min-height: 100px;" class="replyForm d_none" id="${contact.ctcode }_contents">
								<td colspan="5" class="p-4">${contact.ctcontents }</td>							
							</tr>
							<!-- 답변 -->							
							<tr style="border-bottom: solid #E0E0E0 1px; height: 40px;" class="replyForm d_none" id="${contact.ctcode }_replytitle">
								<td colspan="5" class="fw-bold  px-3 py-1" style="background-color: #EAEAEA;"> 답변 </td>							
							</tr>							
							<tr style="border-bottom: solid #E0E0E0 1px; min-height: 100px;" class="replyForm d_none" id="${contact.ctcode }_replycontents">
								<c:choose>
									<%-- 답변 없을 때 --%>
									<c:when test="${contact.ctans == null }">
										<td colspan="4">
											<div class="commentWriteForm">
												<textarea id="${contact.ctcode }_ctans" class="textareaSt" rows="3" cols="80" placeholder="문의글에 대한 답변을 작성해주세요."></textarea>
											</div>	
										</td>
										<td class="text-center">
											<button type="button" onclick="insertReply('${contact.ctcode}')" class="btn-numberone btn-sm fw-bold">등록</button>
										</td>
									</c:when>
									<%-- 답변 있을 때 --%>
									<c:otherwise>
										<td colspan='5' class='p-4'>${contact.ctans }</td>
									</c:otherwise>															
								</c:choose>
							</tr>		
												
						</c:forEach>
					</tbody>
				</table>
				</div>			

				<br>
				
	   			<!-- 페이징 시작 -->
	   			<input type="hidden" id="pageNum" name="page" value="1">
	  			<div class="block text-center" id="pageList">
	  				<ul class="pagination">
	  					<c:choose>
			           		<c:when test="${paging.prev }">
			           			<li class="paginate_button"><a href="${paging.page -1 }" >이전</a></li>
			           		</c:when>
			           		<c:otherwise>
		           				<li class="paginate_button"><span>이전</span></li>
			           		</c:otherwise>
	  					</c:choose>
		               	
		               	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" step="1">
		                	<c:choose>
		                		<c:when test="${paging.page == num }">
		                			<li class=""><a class="active">${num }</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="paginate_button "><a href="${num }" >${num }</a></li>
		                		</c:otherwise>
		                	</c:choose>
		               	</c:forEach>
		               	
		               	<c:choose>
			           		<c:when test="${paging.next }">
			                	<li class="paginate_button"><a href="${paging.page +1 }" >다음</a></li>
			           		</c:when>
			           		<c:otherwise>
		           				<li class="paginate_button"><span>다음</span></li>
			           		</c:otherwise>
	  					</c:choose>
		            </ul>
	            </div>
	            <!-- 페이징 끝 -->
            
				<hr><br>

			</div>
		</form>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	<!-- 부트스트랩 -->
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

	// 문의에 답변 달기
	function insertReply(ctcode){
		console.log("insertReply() 실행");
		$.ajax({
	  		type : 'get',
	  		url : 'Admin_selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("관리자 로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					location.href = "loadToLogin";
	  				}
	  				return;
	  			}
	  			
				console.log("문의코드 : " + ctcode);
				var ctans = $("#"+ctcode+"_ctans").val().replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;");
				console.log("답변 : " + ctans);
				// 답변내용 CONTACT 테이블에 insert
				$.ajax({
					type: "post",
					data: {"ctcode":ctcode, "ctans":ctans},
					url: "admin_updateQuestionAns_ajax",
					dataType: "json",
					success: function(result){
						if (result > 0) {
							alert(ctcode + " 문의글에 답변이 작성되었습니다.");
						} else {
							alert("답변 작성에 실패했습니다.");
						}
					},
					error: function(){
						alert("연결 실패");
					}
				});
				
				// 답변 textarea 없애고 단 것처럼 출력
				var output = "<td colspan='5' class='p-4'>" + ctans + "</td>";
				$("#"+ctcode+"_replycontents").text("").html(output);
				$("#"+ctcode+"_state").text("완료");
	  		}
		});
	}
	

</script>

<script type="text/javascript">
$(document).ready(function () {
	// 페이지 넘버 a태그를 클릭하면 hidden input태그에 페이지 넘버 값을 넣고 submit 진행
	var actionForm = $("#actionForm");
	
	$(document).on("click", ".paginate_button a", function(e){ // on 이벤트로 변경
		e.preventDefault();
		console.log("pageNum click");
		$("#pageNum").val($(this).attr("href"));
		console.log($("#pageNum").val());
		actionForm.submit();
	});
});
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
					output += "<tr style='border-bottom: solid #E0E0E0 1px; height: 40px;'>";
					output += "<td class='overflow text-center'>" + result[i].ctcode + "</td>";
					output += "<td onclick='showContents(\"" + result[i].ctcode + "\")' class='buttonPoint overflow'>" + result[i].cttitle + "</td>";
					output += "<td class='overflow text-center pointer' onclick='writeMemberBoard(\"" + result[i].ctnickname + "\")'>" + result[i].ctnickname + "</td>";
					output += "<td class='overflow text-center'>" + result[i].ctdate + "</td>";
					if (result[i].ctans != null){
						output += "<td class='text-center'>완료</td>";
					} else {
						output += "<td class='text-center' id='" + result[i].ctcode + "_state'>대기</td>";
					}
					output += "</tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; height: 40px;' class='replyForm d_none' id='" + result[i].ctcode + "_title'>"
							+ "<td colspan='5' class='fw-bold px-3 py-1' style='background-color: #EAEAEA;'>문의 내용 </td></tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; min-height: 100px;' class='replyForm d_none' id='" + result[i].ctcode + "_contents'>"
							+ "<td colspan='5' class='p-4'>" + result[i].ctcontents + "</td></tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; height: 40px;' class='replyForm d_none' id='" + result[i].ctcode + "_replytitle'>"
							+ "<td colspan='5' class='fw-bold px-3 py-1' style='background-color: #EAEAEA;'> 답변 </td></tr>";
					output += "<tr style='border-bottom: solid #E0E0E0 1px; min-height: 100px;' class='replyForm d_none' id='" + result[i].ctcode + "_replycontents'>";
					if (result[i].ctans == null){
						output += "<td colspan='4'>"
								+ "<div class='commentWriteForm'>"
								+ "<textarea id='" + result[i].ctcode + "_ctans' class='textareaSt' rows='3' cols='80' placeholder='문의글에 대한 답변을 작성해주세요.'></textarea>"
								+ "</div>"
								+ "</td>";
						output += "<td class='text-center'>";
						output += "<button type='button' onclick='insertReply(\"" + result[i].ctcode + "\")' class='btn-numberone btn-sm fw-bold'>등록</button>";
						output += "</td>";
					} else {
						output += "<td colspan='5' class='p-4'>" + result[i].ctans + "</td>";
					}
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
				var pageList = "<ul class='pagination'>";
				if (result.prev) {
					pageList += "<li class='paginate_button'><a href='"+ (result.page - 1) + "' >이전</a></li>";
				} else {
					pageList += "<li class='paginate_button'><span>이전</span></li>"
				}
				for (var i = result.startPage; i <= result.endPage; i++){
					if (result.page == i){
						pageList += "<li><a class='active'>"+ i + "</a></li>";
					} else {
						pageList += "<li class='paginate_button'><a href='"+ i + "' >" + i + "</a></li>";
					}
				}
				if (result.next){
					pageList += "<li class='paginate_button'><a href='"+ (result.page + 1) + "' >다음</a></li>";
				} else {
					pageList += "<li class='paginate_button'><span>다음</span></li>"
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