<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 중고거래관리</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ include file="/resources/css/CommonCss.jsp" %>

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
         <form action="admin_selectResellList" method="get">
			<div class="container">
	            <div class="row" style="margin:auto;">
	                <h1 class="text-center">중고거래 관리페이지 : Admin_ResellList.jsp</h1>
	            </div>
	            <div class="row">
					<div class="col-5">
						<select name="searchType" id="searchTypeSel">
							<option value="ubTitle">제목</option>
							<option value="ubContents">내용</option>
							<option value="ubTitleContents">제목+내용</option>
							<option value="ubnickname">작성자</option>
						</select>
					</div>
	                <div class="col-5 input-group">
                    	<input type="text" style="width:100px;" class="form-control" name="keyword" id="searchText" placeholder="검색 키워드를 입력하세요!" value="${paging.keyword}">
                    	<span class="input-group-btn">
	                      	<button class="btn btn-secondary" type="submit" name="page" value="1">찾기</button>
                    	</span>
	            	</div>
		            <div class="col-2">
						<!-- 공지작성 버튼 -->
						<!-- <button class="btn btn-primary btm-sm" type="button" onclick="location.href='admin_loadToNoticeWrite'">글쓰기</button> -->
					</div>
               	</div>
           
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 상태값 정렬 -->
                   <select name="searchVal" id="searchValSel" onchange="ubSearchState(this.value)">
                     <option value="all">전체</option>
                     <option value="warning">경고</option>
                     <option value="inactive">정지</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row">
            <table >
               <thead >
                  <tr class="fw-bold" id="board_column">
                     <td style="width:100px;">대표사진</td>
                     <td style="width:130px;">글번호</td>
                     <td style="min-width:200px;">제목</td>
                     <td>작성자</td>
                     <td>작성일</td>
                     <td style="width:80px;">상태</td>
                  </tr>
               </thead>
               <tbody id="bdListTbody">
	               <c:forEach items="${usedBoardList }" var="usedBoard">
	                   <!-- 회원관리 목록 -->
	                   <tr style="border-bottom: solid gray 1px;">
	                      <td><img src="${pageContext.request.contextPath }/resources/img/resell/${usedBoard.ubmainimg }"
	                      		class="img-fluid" style="width:100px; height:100px; display:revert;"></td>
	                      <td>${usedBoard.ubcode}</td>
	                      <%-- makeQueryPage 쓰는거 왜 안될까.... admin_selectBoardView${Paging.makeQueryPage(board.bdcode, paging.page) }/>  --%>
	                      <td class="overflow"><a href="#">
	                      ${usedBoard.ubtitle}</a></td>
	                      <td>${usedBoard.ubnickname}</td>
	                      <td>${usedBoard.ubdate}</td>
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${usedBoard.ubstate == 1}">
	                      			<button class="btn btn-warning" type="button" onclick="showUbstateModal(this,'${usedBoard.ubcode }')">경고</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button class="btn btn-danger" type="button" onclick="showUbstateModal(this, '${usedBoard.ubcode }')">정지</button>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </td>
	                   </tr>
	                </c:forEach>                 
                </tbody>
            </table>
            
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
            
            </div>
            
			</div>
		</form>
			
		</section>
	</main>
	
	
	<!-- 공지상태 변경 모달 -->
	<div class="modal fade" id="updateUbstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateUbstateModalLabel"> 게시글상태 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updateUbstateModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="ubcode">
                    <button class="btn btn-primary" onclick="updateUbstate()">네</button>
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
				$("#updateUbstateModal").modal("hide");
			});
		}
	</script>
	
	<script type="text/javascript">
	/*
		console.log("요청 페이지 : " + ${param.page});
	
		// onsubmit. 페이징 넘버를 누르지 않고 검색 버튼으로 controller를 호출할 때 페이지값 넘겨주기 위한 함수
		function pageCheck(){
			console.log("pageInput() 실행");
			$("#pageInput").attr("name", "page").val("1");
		}
		*/
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
		function ubSearchState(searchVal){
			console.log("ubSearchState() 실행");
			console.log("정렬 선택 : " + searchVal);
			//var searchType = $("#searchType option:selected").val();
			var searchType = $("#searchTypeSel").val();
			var searchText = $("#searchText").val();
			var page = 1; // 요청페이지
			console.log(searchType);
			console.log(searchText);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "page":page},
				url: "admin_selectResellList_ajax",
				dataType: "json",
				success: function(result){
					// 정렬 목록 출력
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid gray 1px;'>";
						output += "<td><img src='${pageContext.request.contextPath }/resources/img/resell/" + result[i].ubmainimg
                      			+ "class='img-fluid' style='width:100px; height:100px; display:revert;'></td>";
						output += "<td>" + result[i].ubcode + "</td>";
						output += "<td class='overflow'><a href='admin_selectResellView?ubcode=" + result[i].ubcode + "'>" + result[i].ubtitle + "</a></td>";
						output += "<td>" + result[i].ubnickname + "</td>";
						output += "<td>" + result[i].ubdate + "</td>";
						output += "<td>"
						if (result[i].ubstate == 1){
							output += "<button class='btn btn-warning' type='button' onclick='showBdstateModal(this, \""+result[i].ubcode+"\")'>경고</button>";
						} else {
							output += "<button class='btn btn-danger' type='button' onclick='showBdstateModal(this,\""+result[i].ubcode+"\")'>정지</button>";
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
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "page":page},
				url: "admin_selectResellPagingNumber_ajax",
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
						if (page == i){
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
		
		// 공지상태 변경 확인 모달창 출력
		var btnObj;
		function showUbstateModal(obj, ubcode){
			console.log("showUbstateModal() 실행");
			btnObj = $(obj);
			var btnObjText = btnObj.text();
			console.log("btnObjText:"+btnObjText);
			if (btnObjText == "경고"){
				$("#updateUbstateModalBody").text(ubcode + "번 게시글을 정지 처리하시겠습니까?");
			} else {
				$("#updateUbstateModalBody").text(ubcode + "번 게시글의 정지를 취소하시겠습니까?");
			}
			$("#ubcode").val(ubcode);
			$("#updateUbstateModal").modal("show");
		}
		
		// 공지상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateUbstate(){
			console.log("updateUbstate() 실행");
			var ubcode = $("#ubcode").val();
			console.log(btnObj.text());
			if (btnObj.text() == "경고"){
				var ubstate = 0;				
			} else {
				var ubstate = 1;				
			}
			$.ajax({
				type: "get",
				data: {"ubcode":ubcode, "ubstate":ubstate},
				url: "admin_updateUbstate_ajax",
				dataType: "json",
				success: function(result){
					if(result > 0){
						if (ubstate == 0){
							btnObj.text("정지").addClass("btn-danger").removeClass("btn-warning");
						} else {
							btnObj.text("경고").addClass("btn-warning").removeClass("btn-danger");
						}
					}
					$("#updateUbstateModal").modal("hide");
				},
				error: function(){
					$("#updateUbstateModal").modal("hide");
					alert("글상태 변경에 실패했습니다.");
				}
			});
			
		}
	</script>
	
	
</body>

</html>