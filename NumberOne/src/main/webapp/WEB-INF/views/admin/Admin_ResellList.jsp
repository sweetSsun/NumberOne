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
         <form action="admin_selectResellList" method="get" id="actionForm">
			<div class="container">
	            <div class="row" style="margin:auto;">
	                <h4 class="text-center">중고거래 관리페이지 : Admin_ResellList.jsp</h4>
	            </div>
	            <!-- 검색 -->
	            <div class="row">
					<div class="col-5" align="right">
						<select name="searchType" id="searchTypeSel" class="searchType">
							<option value="ubTitle">제목</option>
							<option value="ubContents">내용</option>
							<option value="ubTitleContents">제목+내용</option>
							<option value="ubnickname">작성자</option>
						</select>
					</div>
	                <div class="col-7">
                    	<input type="text" class="" name="keyword" id="searchText" placeholder="검색 키워드를 입력하세요!" value="${paging.keyword}">
	                    <button class="btn btn-sm btn-secondary" type="submit">검색</button>
	            	</div>
		            <div class="col-2">
						<!-- 공지작성 버튼 -->
						<!-- <button class="btn btn-primary btm-sm" type="button" onclick="location.href='admin_loadToNoticeWrite'">글쓰기</button> -->
					</div>
               	</div>
           
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 상태값 정렬 -->
                   <select class="categoryList" name="searchVal" id="searchValSel" onchange="ubSearchState(this.value)">
                     <option class="categorySel" value="all">전체</option>
                     <option class="categorySel" value="warning">경고</option>
                     <option class="categorySel" value="inactive">정지</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row" style="margin-top: 20px;">
            <table style="table-layout: fixed;">
               <thead >
                  <tr class="text-center fw-bold" id="board_column">
                     <td style="width:10%;">글번호</td>
                     <td style="width:70px;">사진</td>
                     <td>제목</td>
                     <td style="width:15%;">작성자</td>
                     <td style="width:10%;">작성일</td>
                     <td style="width:3rem;">경고</td>
                     <td style="width:3rem;" class="text-center">상태</td>
                  </tr>
               </thead>
               <tbody id="bdListTbody">
	               <c:forEach items="${usedBoardList }" var="usedBoard">
	                   <!-- 회원관리 목록 -->
	                   <tr style="border-bottom: solid #E0E0E0 1px;">
	                      <td class="text-center overflow">${usedBoard.ubcode}</td>
	                      <td class="text-center"><img src="${pageContext.request.contextPath }/resources/img/resell/${usedBoard.ubmainimg }"
	                      		class="img-fluid" style="width:60px; height:60px; object-fit:fill;"></td>
	                      <td class="overflow"><a href="#">
	                      ${usedBoard.ubtitle}</a></td>
	                      <td class="text-center overflow pointer" onclick="writeMemberSellbuy('${usedBoard.ubnickname}')">${usedBoard.ubnickname}</td>
	                      <td class="text-center overflow">${usedBoard.ubdate}</td>
	                      <td class="text-center">${usedBoard.ubwarning}</td>
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${usedBoard.ubstate == 1}">
	                      			<button class="btn btn-sm btn-warning" type="button" onclick="showUbstateModal(this,'${usedBoard.ubcode }')">경고</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button class="btn btn-sm btn-danger" type="button" onclick="showUbstateModal(this, '${usedBoard.ubcode }')">정지</button>
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
	
	
	<!-- 공지상태 변경 모달 -->
	<div class="modal fade" id="updateUbstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateUbstateModalLabel"> 거래글상태 변경 확인 </h5>
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
	<!-- 부트스트랩 -->
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
		
		// 거래글 상태 변경 확인 모달창 출력
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
		
		// 거래글 상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateUbstate(){
			console.log("updateUbstate() 실행");
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
		function ubSearchState(searchVal){
			console.log("ubSearchState() 실행");
			var searchType = $("#searchTypeSel").val();
			var searchText = $("#searchText").val();
			console.log("정렬 선택 : " + searchVal);
			console.log("검색 종류 : " + searchType);
			console.log("검색 키워드 : " + searchText);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"list"},
				url: "admin_selectResellList_ajax",
				dataType: "json",
				success: function(result){
					// 정렬 목록 출력
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid #E0E0E0 1px;'>";
						output += "<td class='text-center overflow'>" + result[i].ubcode + "</td>";
						output += "<td class='text-center'><img src='${pageContext.request.contextPath }/resources/img/resell/" + result[i].ubmainimg
						+ "' class='img-fluid' style='width:60px; height:60px;  object-fit:fill;'></td>";
						output += "<td class='overflow'><a href='admin_selectResellView?ubcode=" + result[i].ubcode + "'>" + result[i].ubtitle + "</a></td>";
						output += "<td class='text-center overflow pointer' onclick='writeMemberSellbuy(\"" + result[i].ubnickname + "\")'>" + result[i].ubnickname + "</td>";
						output += "<td class='text-center overflow'>" + result[i].ubdate + "</td>";
						output += "<td class='text-center'>" + result[i].ubwarning + "</td>";
						output += "<td class='text-center'>"
						if (result[i].ubstate == 1){
							output += "<button class='btn btn-sm btn-warning' type='button' onclick='showUbstateModal(this, \""+result[i].ubcode+"\")'>경고</button>";
						} else {
							output += "<button class='btn btn-sm btn-danger' type='button' onclick='showUbstateModal(this,\""+result[i].ubcode+"\")'>정지</button>";
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
				url: "admin_selectResellList_ajax",
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