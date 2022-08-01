<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공구관리</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Css Styles -->
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
         <form action="admin_selectGonguList" method="get" id="actionForm">
			<div class="container" style="margin-top: 10px">
				<!-- 페이지 제목 -->
                <div class="checkout__form">공구 관리</div>
	            <!-- 검색 -->
	            <div class="row">
					<div class="col-5" align="right">
						<select name="searchType" id="searchTypeSel" class="searchType">
							<option value="gbTitle">제목</option>
							<option value="gbContents">내용</option>
							<option value="gbTitleContents">제목+내용</option>
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
                   <select class="categoryList" name="searchVal" id="searchValSel" onchange="gbSearchState(this.value)">
                     <option class="categorySel" value="all">전체</option>
                     <option class="categorySel" value="active">진행</option>
                     <option class="categorySel" value="inactive">완료</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row" style="margin-top: 20px;">
            <table style="table-layout: fixed;">
               <thead >
                  <tr class="text-center fw-bold" id="board_column">
                     <td style="width:10%;">글번호</td>
                     <td>제목</td>
				     <td style="width:15%;">작성자</td>
                     <td style="width:10%;">작성일</td>
                     <td style="width:4rem;">조회</td>
                     <td style="width:3rem;">상태</td>
                     <td style="width:3rem;">고정</td>
                  </tr>
               </thead>
               <tbody id="gbListTbody">
	               <c:forEach items="${gonguList }" var="gongu">
	                   <!-- 회원관리 목록 -->
	                   <tr style="border-bottom: solid #E0E0E0 1px;">
	                      <td class="overflow text-center">${gongu.gbcode}</td>
 	                      <td class="overflow"><a href="admin_selectGonguBoardView${paging.makeQueryPage(gongu.gbcode, paging.page)}" >${gongu.gbtitle}</a></td>
	                      <td class="text-center overflow">${gongu.gbnickname}</td>
	                      <td class="text-center overflow">${gongu.gbdate}</td>
	                      <td class="text-center">${gongu.gbhits}</td>	
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${gongu.gbstate == 1}">
	                      			<button class="btn btn-sm btn-primary" type="button" onclick="showGbstateModal(this,'${gongu.gbcode }')">진행</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button class="btn btn-sm btn-secondary" type="button" onclick="showGbstateModal(this, '${gongu.gbcode }')">완료</button>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </td>
	                      <td id="fixBtn_${gongu.gbcode }">
	                      	<c:if test="${gongu.gbstate == 1 }">
		                      	<c:choose>
		                      		<c:when test="${gongu.gbfix == 1}">
		                      			<button class="btn-numberone btn-sm" type="button" onclick="showGbfixModal(this,'${gongu.gbcode }')">고정</button>
		                      		</c:when>
		                      		<c:otherwise>
		                      			<button class="btn btn-sm btn-secondary" type="button" onclick="showGbfixModal(this,'${gongu.gbcode }')">일반</button>
		                      		</c:otherwise>
		                      	</c:choose>
	                      	</c:if>
	                      </td>
	                   </tr>
	                </c:forEach>                 
                </tbody>
            </table>
            <!-- 공구작성 버튼 -->
            <div align="right" class="col mt-2">
				<button class="btn-numberone btn-sm fw-bold" type="button" onclick="location.href='admin_loadToGonguWrite'">공구작성</button>
            </div>
            
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
	
	
	<!-- 공구상태 변경 모달 -->
	<div class="modal fade" id="updateGbstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateGbstateModalLabel"> 공구상태 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updateGbstateModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="gbcode_state">
                    <button class="btn btn-primary" onclick="updateGbstate()">네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 고정공구 변경 모달 -->
	<div class="modal fade" id="updateGbfixModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateGbfixModalLabel"> 고정공구 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updategbfixModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="gbcode_fix">
                    <button class="btn btn-primary" onclick="updateGbfix()">네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	

	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		// 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#updateGbstateModal").modal("hide");
				$("#updateGbfixModal").modal("hide");
			});
		}
				
		// 공구상태 변경 확인 모달창 출력
		var btnObj_state;
		function showGbstateModal(obj, gbcode){
			console.log("showGbstateModal() 실행");
			btnObj_state = $(obj);
			var btnObj_stateText = btnObj_state.text();
			console.log("btnObj_stateText:"+btnObj_stateText);
			if (btnObj_stateText == "진행"){
				$("#updateGbstateModalBody").text(gbcode + "번 공구를 완료 처리하시겠습니까?");
			} else {
				$("#updateGbstateModalBody").text(gbcode + "번 공구를 진행 처리하시겠습니까?");
			}
			$("#gbcode_state").val(gbcode);
			$("#updateGbstateModal").modal("show");
		}
		
		// 공구상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateGbstate(){
			console.log("updateGbstate() 실행");
			
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
		  			
					var gbcode_state = $("#gbcode_state").val();
					console.log(btnObj_state.text());
					console.log($("#fixBtn_"+gbcode_state+" button").text());
					if (btnObj_state.text() == "진행"){
						// 고정공구일 때 바로 삭제 불가능
						if( $("#fixBtn_"+gbcode_state+" button").text() == "고정" ){
							alert("해당 공구의 고정을 취소 후 완료해주세요.");
							$("#updateGbstateModal").modal("hide");
							return false;
						}
						var gbstate = 2;				
					} else {
						var gbstate = 1;				
					}
					$.ajax({
						type: "get",
						data: {"gbcode":gbcode_state, "gbstate":gbstate},
						url: "admin_updateGbstate_ajax",
						dataType: "json",
						success: function(result){
							if(result > 0){
								if (gbstate == 2){
									btnObj_state.text("완료").addClass("btn-secondary").removeClass("btn-primary");
									$("#fixBtn_"+gbcode_state).text("");
								} else {
									btnObj_state.text("진행").addClass("btn-primary").removeClass("btn-secondary");
									$("#fixBtn_"+gbcode_state).html("<button class='btn btn-sm btn-secondary' type='button' onclick='showGbfixModal(this,\"" + gbcode_state + "\")'>일반</button>");
								}
							}
							$("#updateGbstateModal").modal("hide");
						},
						error: function(){
							$("#updateGbstateModal").modal("hide");
							alert("공구상태 변경에 실패했습니다.");
						}
					});
		  		}
			});
		}
				
		// 고정공구 변경 확인 모달창 출력
		var btnObj_fix;
		function showGbfixModal(obj, gbcode){
			console.log("showGbfixModal() 실행");
			btnObj_fix = $(obj);
			var btnObj_fixText = btnObj_fix.text();
			console.log("btnObj_fixText:"+btnObj_fixText);
			if (btnObj_fixText == "고정"){
				$("#updateGbfixModalBody").text(gbcode + "번 공구 고정을 취소하시겠습니까?");
			} else {
				$("#updateGbfixModalBody").text(gbcode + "번 공구를 고정 처리하시겠습니까?");
			}
			$("#gbcode_fix").val(gbcode);
			$("#updateGbfixModal").modal("show");
		}
		
		// 고정공구 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateGbfix(){
			console.log("updateGbfix() 실행");
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
		  			
					var gbcode_fix = $("#gbcode_fix").val();
					console.log(btnObj_fix.text());
					if (btnObj_fix.text() == "고정"){
						var gbfix = 0;				
					} else {
						var gbfix = 1;				
					}
					$.ajax({
						type: "get",
						data: {"gbcode":gbcode_fix, "gbfix":gbfix},
						url: "admin_updateGbfix_ajax",
						dataType: "json",
						success: function(result){
							if(result > 0){
								if (gbfix == 0){
									btnObj_fix.text("일반").addClass("btn-secondary").removeClass("btn-numberone").toggleClass("btn");
								} else {
									btnObj_fix.text("고정").addClass("btn-numberone").removeClass("btn-secondary").toggleClass("btn");
								}
							}
							$("#updateGbfixModal").modal("hide");
						},
						error: function(){
							$("#updateGbfixModal").modal("hide");
							alert("공구상태 변경에 실패했습니다.");
						}
					});
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
		// 정렬 select하면 ajax로 공구목록 받고 출력을 바꿔주는 함수
		function gbSearchState(searchVal){
			console.log("gbSearchState() 실행");
			var searchType = $("#searchTypeSel").val();
			var searchText = $("#searchText").val();
			console.log("정렬 선택 : " + searchVal);
			console.log("검색 종류 : " + searchType);
			console.log("검색 키워드 : " + searchText);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"list"},
				url: "admin_selectGonguList_ajax",
				dataType: "json",
				success: function(result){
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid #E0E0E0 1px;'>";
						output += "<td class='text-center overflow'>" + result[i].gbcode + "</td>";
						// <a href="admin_selectGonguBoardView${paging.makeQueryPage(gongu.gbcode, paging.page)}" >
						// ajax에선 paging이 아니라 result(json 타입의 String)으로 온다.
						// java 코드를 먼저 읽고 html은 나중이기 때문에 onclick 이벤트를 부여해도 codeIdx값을 넘겨줄 수가 없음
						// makeQuery를 사용할 수가 없다... 매개변수 직접 붙여주는 수 밖에..
						output += "<td class='overflow'><a href='admin_selectGonguBoardView?codeIdx=" + result[i].gbcode 
								+"&page=1&perPageNum=10&searchVal=" + searchVal + "&searchType=" + searchType + "&keyword=" + searchText + "'>" 
								+ result[i].gbtitle + "</a></td>";
						output += "<td class='text-center overflow'>" + result[i].gbnickname + "</td>";
						output += "<td class='text-center overflow'>" + result[i].gbdate + "</td>";
						output += "<td class='text-center'>" + result[i].gbhits + "</td>";
						output += "<td class='text-center'>"
						if (result[i].gbstate == 1){
							output += "<button class='btn btn-sm btn-primary' type='button' onclick='showGbstateModal(this, \""+result[i].gbcode+"\")'>진행</button>";
						} else {
							output += "<button class='btn btn-sm btn-secondary' type='button' onclick='showGbstateModal(this,\""+result[i].gbcode+"\")'>완료</button>";
						}
						output += "</td>";
						output += "<td id='fixBtn_"+result[i].gbcode+"' class='text-center'>"
							if (result[i].gbstate == 1){
								if (result[i].gbfix == 1){
									output += "<button class='btn-sm btn-numberone' type='button' onclick='showGbfixModal(this, \""+result[i].gbcode+"\")'>고정</button>";
								} else {
									output += "<button class='btn btn-sm btn-secondary' type='button' onclick='showGbfixModal(this, \""+result[i].gbcode+"\")'>일반</button>";
								}
							}
							output += "</td>";
						output += "</tr>";
					}
					$("#gbListTbody").html(output);
				}
			});
			// 페이지에서 출력할 페이지번호 받아오기
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"page"},
				url: "admin_selectGonguList_ajax",
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
	
	
</body>

</html>