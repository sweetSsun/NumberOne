<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 댓글관리</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Css Styles -->
<%@ include file="/resources/css/BarCss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style type="text/css">
    #board_column{
       border-bottom: solid gray 3px;
    }
    table{
       margin: 20px;
    }
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
         <form action="admin_selectReplyList" method="get" id="actionForm">
			<div class="container">
	            <div class="row" style="margin:auto;">
	                <h1 class="text-center">댓글 관리페이지 : Admin_ReplyList.jsp</h1>
	            </div>
	            <!-- 검색 -->
	            <div class="row">
					<div class="col-5">
						<select name="searchType" id="searchTypeSel">
							<option value="rpContents">내용</option>
							<option value="rpnickname">작성자</option>
						</select>
					</div>
	                <div class="col-5 input-group">
                    	<input type="text" style="width:100px;" class="form-control" name="keyword" id="searchText" placeholder="검색 키워드를 입력하세요!" value="${paging.keyword}">
                    	<span class="input-group-btn">
	                      	<button class="btn btn-secondary" type="submit" name="page" value="1">찾기</button>
                    	</span>
	            	</div>
		            <div class="col-2">
					</div>
               	</div>
           
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                   <!-- 상태값 정렬 -->
                   <select name="searchVal" id="searchValSel" onchange="rpSearchState(this.value)">
                     <option value="all">전체</option>
                     <option value="자랑">자랑</option>
                     <option value="자유">자유</option>
                     <option value="질문">질문</option>
                     <option value="정보">정보</option>
                     <option value="후기">후기</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row">
            <table style="table-layout: fixed;">
               <thead >
                  <tr class="fw-bold" id="board_column">
                     <td style="width:10%;">댓글번호</td>
                     <td style="width:4.5rem;">말머리</td>
                     <td style="width:50%;">내용</td>
                     <td style="width:15%;">작성자</td>
                     <td style="width:20%;">작성일</td>
                     <td style="width:4rem;">상태</td>
                  </tr>
               </thead>
               <tbody id="rpListTbody">
	               <c:forEach items="${replyList }" var="reply">
	                   <!-- 회원관리 목록 -->
	                   <tr style="border-bottom: solid gray 1px;">
	                      <td class="overflow">${reply.rpcode}</td>
	                      <td>${reply.rpbdcategory}</td>
	                      <%-- makeQueryPage 쓰는거 왜 안될까.... admin_selectBoardView${Paging.makeQueryPage(board.bdcode, paging.page) }/>  --%>
	                      <td class="overflow"><a href="#">
	                      ${reply.rpcontents}</a></td>
	                      <td class="overflow">${reply.rpnickname}</td>
	                      <td class="overflow">${reply.rpdate}</td>
	                      <td>
                   			  <button class="btn btn-danger" type="button" onclick="showRpstateModal(this, '${reply.rpcode }')">정지</button>
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
	
	
	<!-- 공지상태 변경 모달 -->
	<div class="modal fade" id="updateRpstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateRpstateModalLabel"> 게시글상태 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updateRpstateModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="rpcode">
                    <button class="btn btn-primary" onclick="updateRpstate()">네</button>
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
				$("#updateRpstateModal").modal("hide");
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
		// 정렬 select하면 ajax로 공지목록 받고 출력을 바꿔주는 함수
		function rpSearchState(searchVal){
			console.log("rpSearchState() 실행");
			var searchType = $("#searchTypeSel").val();
			var searchText = $("#searchText").val();
			console.log("정렬 선택 : " + searchVal);
			console.log("검색 종류 : " + searchType);
			console.log("검색 키워드 : " + searchText);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"list"},
				url: "admin_selectReplyList_ajax",
				dataType: "json",
				success: function(result){
					// 정렬 목록 출력
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid gray 1px;'>";
						output += "<td class='overflow'>" + result[i].rpcode + "</td>";
						output += "<td>" + result[i].rpbdcategory + "</td>";
						output += "<td class='overflow'><a href='admin_selectResellView?bdcode=" + result[i].bdcode + "'>" + result[i].rpcontents + "</a></td>";
						output += "<td class='overflow'>" + result[i].rpnickname + "</td>";
						output += "<td class='overflow'>" + result[i].rpdate + "</td>";
						output += "<td>"
						output += "<button class='btn btn-danger' type='button' onclick='showRpstateModal(this,\""+result[i].rpcode+"\")'>정지</button>";
						output += "</td>";
						output += "</tr>";
					}
					$("#rpListTbody").html(output);
				}
			});
			// 페이지에서 출력할 페이지번호 받아오기
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"page"},
				url: "admin_selectReplyList_ajax",
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
		
		// 공지상태 변경 확인 모달창 출력
		var btnObj;
		function showRpstateModal(obj, rpcode){
			console.log("showRpstateModal() 실행");
			btnObj = $(obj);
			var btnObjText = btnObj.text();
			console.log("btnObjText:"+btnObjText);
			if (btnObjText == "활성"){
				$("#updateRpstateModalBody").text(rpcode + "번 게시글을 정지 처리하시겠습니까?");
			} else {
				$("#updateRpstateModalBody").text(rpcode + "번 게시글의 정지를 취소하시겠습니까?");
			}
			$("#rpcode").val(rpcode);
			$("#updateRpstateModal").modal("show");
		}
		
		// 공지상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateRpstate(){
			console.log("updateRpstate() 실행");
			var rpcode = $("#rpcode").val();
			console.log(btnObj.text());
			if (btnObj.text() == "활성"){
				var rpstate = 0;				
			} else {
				var rpstate = 1;				
			}
			$.ajax({
				type: "get",
				data: {"rpcode":rpcode, "rpstate":rpstate},
				url: "admin_updateRpstate_ajax",
				dataType: "json",
				success: function(result){
					if(result > 0){
						if (rpstate == 0){
							btnObj.text("정지").addClass("btn-danger").removeClass("btn-primary");
						} else {
							btnObj.text("활성").addClass("btn-primary").removeClass("btn-danger");
						}
					}
					$("#updateRpstateModal").modal("hide");
				},
				error: function(){
					$("#updateRpstateModal").modal("hide");
					alert("글상태 변경에 실패했습니다.");
				}
			});
			
		}
	</script>
	
	
</body>

</html>