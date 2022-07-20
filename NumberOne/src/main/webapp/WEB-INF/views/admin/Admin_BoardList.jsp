<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 커뮤니티 경고/정지관리</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Css Styles -->
<%@ include file="/resources/css/BarCss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listCss.css" type="text/css">

<style type="text/css">
  	#pageList button{
 		display: none;
	}
	label{
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	var checkMsg = "${msg}"
	console.log(checkMsg.length);
	if(checkMsg.length > 0){
		alert(checkMsg);
	}
</script>
    
</head>


<body>
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file= "/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
		<!-- 본문 -->
         <form action="admin_selectBoardList" method="get" id="actionForm">
			<div class="container">
	            <div class="row" style="margin:auto;">
	                <h4 class="text-center">커뮤니티-경고/정지 관리페이지 : Admin_BoardList.jsp</h4>
	            </div>
	            <!-- 검색 -->
	            <div class="row">
					<div class="col-5" align="right">
						<select name="searchType" id="searchTypeSel" class="searchType">
							<option value="bdTitle">제목</option>
							<option value="bdContents">내용</option>
							<option value="bdTitleContents">제목+내용</option>
							<option value="bdnickname">작성자</option>
						</select>
					</div>
	                <div class="col-7">
                    	<input type="text" class="" name="keyword" id="searchText" placeholder="검색 키워드를 입력하세요!" value="${paging.keyword}">
	                    <button class="btn btn-sm btn-secondary" type="submit">검색</button>
	            	</div>
               	</div>
           
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 상태값 정렬 -->
                   <select class="categoryList" name="searchVal" id="searchValSel" onchange="bdSearchState(this.value)">
                     <option class="categorySel" value="all">전체</option>
                     <option class="categorySel" value="warning">경고</option>
                     <option class="categorySel" value="inactive">정지</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row" style="margin-top: 20px;">
            <table style="table-layout: fixed;" >
               <thead >
                  <tr class="text-center fw-bold" id="board_column">
                     <td style="width:10%;">글번호</td>
                     <td style="width:4.5rem;">말머리</td>
                     <td style="">제목</td>
                     <td style="width:15%;">작성자</td>
                     <td style="width:10%;">작성일</td>
                     <td style="width:4rem;">조회</td>
                     <td style="width:3rem;">추천</td>
                     <td style="width:3rem;">경고</td>
                     <td style="width:3rem;">상태</td>
                  </tr>
               </thead>
               <tbody id="bdListTbody">
	               <c:forEach items="${boardList }" var="board">
	                   <!-- 일반게시글 관리 목록 -->
	                   <tr style="border-bottom: solid #E0E0E0 1px;">
	                      <td class="overflow text-center">${board.bdcode}</td>
	                      <td class="category text-center">${board.bdcategory }</td>
	                      <td class="overflow">
	                        <c:choose>
					        	<c:when test="${board.bdcategory.equals('자랑') }">
						       		<!-- 자랑글 상세 -->
						        	<a href="selectRoomList?bdcode=${board.bdcode }&jsp=view">
						        		<span class="overflow">${board.bdtitle}</span>
						        	</a>
					        	</c:when>
					        	<c:when test="${board.bdcategory.equals('후기') }">
						       		<!-- 후기글 상세 -->
		                      		<a href="admin_selectReviewBoardView${paging.makeQueryPage(board.bdcode, paging.page)}">
						        		<span class="overflow">${board.bdtitle}</span>
						        	</a>
					        	</c:when>
					        	<c:otherwise>
						        	<!-- 일반글 상세 -->										
		                      		<a href="admin_selectBoardView${paging.makeQueryPage(board.bdcode, paging.page)}">
			                      		<span class="overflow">${board.bdtitle}</span>
			                      	</a>
								</c:otherwise>
							</c:choose>
	                      	<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span>
	                      </td>
	                      <td class="text-center overflow pointer" onclick="writeMemberBoard'${board.bdnickname}')">${board.bdnickname}</td>
	                      <td class="text-center overflow">${board.bddate}</td>
	                      <td class="text-center">${board.bdhits}</td>
	                      <td class="text-center">${board.bdrccount}</td>
	                      <td class="text-center">${board.bdwarning}</td>
	                      <td class="text-center">
	                      	<c:choose>
	                      		<c:when test="${board.bdstate == 1}">
	                      			<button class="btn btn-sm btn-warning" type="button" onclick="showBdstateModal(this,'${board.bdcode }')">경고</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button class="btn btn-sm btn-danger" type="button" onclick="showBdstateModal(this, '${board.bdcode }')">정지</button>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </td>
	                   </tr>
	                </c:forEach>                 
                </tbody>
            </table>
            
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
            
            </div>
            
			</div>
		</form>
			
		</section>
	</main>
	
	
	<!-- 게시글상태 변경 모달 -->
	<div class="modal fade" id="updateBdstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateBdstateModalLabel"> 게시글상태 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updateBdstateModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="bdcode">
                    <button class="btn btn-primary" onclick="updateBdstate()">네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	

	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		// 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#updateBdstateModal").modal("hide");
			});
		}		
		
		// 글상태 변경 확인 모달창 출력
		var btnObj;
		function showBdstateModal(obj, bdcode){
			console.log("showBdstateModal() 실행");
			btnObj = $(obj);
			var btnObjText = btnObj.text();
			console.log("btnObjText:"+btnObjText);
			if (btnObjText == "경고"){
				$("#updateBdstateModalBody").text(bdcode + "번 게시글을 정지 처리하시겠습니까?");
			} else {
				$("#updateBdstateModalBody").text(bdcode + "번 게시글의 정지를 취소하시겠습니까?");
			}
			$("#bdcode").val(bdcode);
			$("#updateBdstateModal").modal("show");
		}
		
		// 글상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateBdstate(){
			console.log("updateBdstate() 실행");
			var bdcode = $("#bdcode").val();
			console.log(btnObj.text());
			if (btnObj.text() == "경고"){
				var bdstate = 0;				
			} else {
				var bdstate = 1;				
			}
			$.ajax({
				type: "get",
				data: {"bdcode":bdcode, "bdstate":bdstate},
				url: "admin_updateBdstate_ajax",
				dataType: "json",
				success: function(result){
					if(result > 0){
						if (bdstate == 0){
							btnObj.text("정지").addClass("btn-danger").removeClass("btn-warning");
						} else {
							btnObj.text("경고").addClass("btn-warning").removeClass("btn-danger");
						}
					}
					$("#updateBdstateModal").modal("hide");
				},
				error: function(){
					$("#updateBdstateModal").modal("hide");
					alert("글상태 변경에 실패했습니다.");
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
		// 선택한 검색 select option으로 선택되도록 하기
		var searchOption = $("#searchTypeSel option");
		console.log("searchOption.length : " + searchOption.length);
		var searchType = "${paging.searchType}";
		console.log("searchType : " + searchType);
		if (searchType.length > 0) {
			for (var i = 0; i < searchOption.length; i++){
				if (searchOption.eq(i).val() == searchType){
					searchOption.eq(i).attr("selected", "selected");
				}
			}
		}
		
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
	</script>
	<script type="text/javascript">
		// 정렬 select하면 ajax로 글목록 받고 출력을 바꿔주는 함수
		function bdSearchState(searchVal){
			console.log("bdSearchState() 실행");
			console.log("정렬 선택 : " + searchVal);
			var searchType = $("#searchTypeSel").val();
			var searchText = $("#searchText").val();
			console.log(searchType);
			console.log(searchText);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"list"},
				url: "admin_selectBoardList_ajax",
				dataType: "json",
				success: function(result){
					// 정렬 목록 출력
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid #E0E0E0 1px;'>";
						output += "<td class='text-center overflow'>" + result[i].bdcode + "</td>";
						output += "<td class='category text-center'>" + result[i].bdcategory + "</td>";
						output += "<td class='overflow'>"
						if(result[i].bdcategory == '자랑'){
							output +="<a href='selectRoomList?bdcode=" + result[i].bdcode + "&jsp=view'>"
									+"<span class='overflow'>" + result[i].bdtitle + "</span>"
									+"<span class='fw-bold' style='font-size:15px; color:#00bcd4;'>&nbsp;" + result[i].bdrpcount + "</span>"			
									+"</a>";
						} else {
							output +="<a href='admin_selectBoardView${paging.makeQueryPage(paging.page)}&codeIdx=" + result[i].bdcode + "'>"
									//+"&page=1&perPageNum=10&searchVal=" + searchVal + "&searchType=" + searchType + "&keyword=" + searchText + "'>"
									+"<span class='overflow'>" + result[i].bdtitle + "</span>"
									+"<span class='fw-bold' style='font-size:15px; color:#00bcd4;'>&nbsp;" + result[i].bdrpcount + "</span>"			
									+"</a>";
						}
						output += "</td>";
						output += "<td class='text-center overflow pointer' onclick='writeMemberBoard(\"" + result[i].bdnickname + "\")'>" + result[i].bdnickname + "</td>";
						output += "<td class='text-center overflow'>" + result[i].bddate + "</td>";
						output += "<td class='text-center'>" + result[i].bdhits + "</td>";
						output += "<td class='text-center'>" + result[i].bdrccount + "</td>";
						output += "<td class='text-center'>" + result[i].bdwarning + "</td>";
						output += "<td class='text-center'>"
						if (result[i].bdstate == 1){
							output += "<button class='btn btn-sm btn-warning' type='button' onclick='showBdstateModal(this, \""+result[i].bdcode+"\")'>경고</button>";
						} else {
							output += "<button class='btn btn-sm btn-danger' type='button' onclick='showBdstateModal(this,\""+result[i].bdcode+"\")'>정지</button>";
						}
						output += "</td>";
						output += "</tr>";
					}
					$("#bdListTbody").html(output);
				}
			});
			// 페이지에서 출력할 페이지번호 받아오기
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"page"},
				url: "admin_selectBoardList_ajax",
				dataType: "json",
				success: function(result){
					console.log("요청 페이지 : " + result.page);
					$("#pageList").text("");
					// 페이징 번호 출력
					var pageList = "<ul class='pagination'>";
					if (result.prev) {
						pageList += "<li class='paginate_button'><a href='"+ (result.page - 1) + "'>이전</a></li>";
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
	
	
</body>

</html>