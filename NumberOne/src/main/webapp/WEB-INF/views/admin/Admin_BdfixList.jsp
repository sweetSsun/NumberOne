<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 커뮤니티 배너관리</title>

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
         <form action="admin_selectBdfixList" method="get" id="actionForm">
			<div class="container" style="margin-top: 10px">
				<!-- 페이지 제목 -->
				<div class="checkout__form">커뮤니티 - 배너 관리</div>
				
<!-- 	            <div class="row" style="margin:auto;">
	                <h4 class="text-center">커뮤니티-배너 관리페이지 : Admin_BdfixList.jsp</h4>
	            </div> -->
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
                    	<input type="text" name="keyword" id="searchText" placeholder="검색 키워드를 입력하세요!" value="${paging.keyword}"
                    			class="">
	                    <button class="btn btn-sm btn-secondary" type="submit">검색</button>
	            	</div>
               	</div>
           
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 상태값 정렬 -->
                   <select class="categoryList" name="searchVal" id="searchValSel" onchange="bdSearchFix(this.value)">
                     <option class="categorySel" value="all">전체</option>
                     <option class="categorySel" value="fixed">배너</option>
                     <option class="categorySel" value="unfixed">일반</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row" style="margin-top: 20px;">
            <table style="table-layout: fixed;" >
               <thead >
                  <tr class="text-center fw-bold" id="board_column">
                     <td style="width:10%;">글번호</td>
                     <td style="width:70px;">사진</td>
                     <td style="">제목</td>
                     <td style="width:15%;">작성자</td>
                     <td style="width:10%;">작성일</td>
                     <td style="width:4rem;">조회</td>
                     <td style="width:3rem;">추천</td>
                     <td style="width:3rem;">경고</td>
                     <td style="width:3rem;">고정</td>
                  </tr>
               </thead>
               <tbody id="bdListTbody">
	           		<c:forEach items="${bdfixList }" var="board">
	                   <!-- 자랑글 배너 관리 목록 -->
	                	<tr style="border-bottom: solid #E0E0E0 1px;">
	                    	<td class="overflow text-center">${board.bdcode}</td>
	                		<td class="text-center"><img src="${pageContext.request.contextPath }/resources/img/room/${board.bdimg }"
	                      		class="img-fluid" style="width:60px; height:60px; object-fit:fill;"></td>
	                    	<td class="overflow">
					    		<a href="selectRoomList?bdcode=${board.bdcode }&jsp=view">
					    			<span class="overflow">${board.bdtitle}</span>
					       		</a>
					        	<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span>
	                      	</td>
	                      	<td class="text-center overflow pointer" onclick="writeMemberBoard('${board.bdnickname}')">${board.bdnickname}</td>
	                      	<td class="text-center overflow">${board.bddate}</td>
	                      	<td class="text-center">${board.bdhits}</td>
	                      	<td class="text-center">${board.bdrccount}</td>
	                     	<td class="text-center">${board.bdwarning}</td>
	                      	<td>
		                      	<c:choose>
		                      		<c:when test="${board.bdfix == 1}">
		                      			<button class="btn-sm btn-numberone" type="button" onclick="showBdfixModal(this,'${board.bdcode }')">배너</button>
		                      		</c:when>
		                      		<c:otherwise>
		                      			<button class="btn btn-sm btn-secondary" type="button" onclick="showBdfixModal(this, '${board.bdcode }')">일반</button>
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
	
	
	<!-- 배너상태 변경 모달 -->
	<div class="modal fade" id="updateBdfixModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateBdfixModalLabel"> 배너고정 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updateBdfixModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="bdcode">
                    <button class="btn btn-primary" onclick="updateBdfix()">네</button>
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
				$("#updateBdfixModal").modal("hide");
			});
		}
		
		// 배너고정 변경 확인 모달창 출력
		var btnObj;
		function showBdfixModal(obj, bdcode){
			console.log("showBdfixModal() 실행");
			btnObj = $(obj);
			var btnObjText = btnObj.text();
			console.log("btnObjText:"+btnObjText);
			if (btnObjText == "배너"){
				$("#updateBdfixModalBody").text(bdcode + "번 게시글의 배너 고정을 취소하시겠습니까?");
			} else {
				$("#updateBdfixModalBody").text(bdcode + "번 게시글을 배너로 고정하시겠습니까?");
			}
			$("#bdcode").val(bdcode);
			$("#updateBdfixModal").modal("show");
		}
		
		// 배너고정 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateBdfix(){
			console.log("updateBdfix() 실행");
		  	$.ajax({
		  		type : 'get',
		  		url : 'Admin_selectLoginOut_ajax',
		  		async : false,
		  		success : function(result){
		  			if (result == "2"){ 
		  				if(confirm("관리자 로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
		  					$("#updateBdfixModal").modal("hide");
		  					location.href = "loadToLogin";
		  				}
		  				return;
		  			}

					var bdcode = $("#bdcode").val();
					console.log(btnObj.text());
					if (btnObj.text() == "배너"){
						var bdfix = 0;				
					} else {
						var bdfix = 1;				
					}
					$.ajax({
						type: "get",
						data: {"bdcode":bdcode, "bdfix":bdfix},
						url: "admin_updateBdfix_ajax",
						dataType: "json",
						success: function(result){
							if(result > 0){
								if (bdfix == 0){
									btnObj.text("일반").addClass("btn-secondary").removeClass("btn-numberone").toggleClass("btn");
								} else {
									btnObj.text("배너").addClass("btn-numberone").removeClass("btn-secondary").toggleClass("btn");
								}
							}
							$("#updateBdfixModal").modal("hide");
						},
						error: function(){
							$("#updateBdfixModal").modal("hide");
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
		// 정렬 select하면 ajax로 게시글목록 받고 출력을 바꿔주는 함수
		function bdSearchFix(searchVal){
			console.log("bdSearchFix() 실행");
			console.log("정렬 선택 : " + searchVal);
			var searchType = $("#searchTypeSel").val();
			var searchText = $("#searchText").val();
			console.log(searchType);
			console.log(searchText);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"list"},
				url: "admin_selectBdfixList_ajax",
				dataType: "json",
				success: function(result){
					// 정렬 목록 출력
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid #E0E0E0 1px;'>";
						output += "<td class='text-center overflow'>" + result[i].bdcode + "</td>";
						output += "<td class='text-center'><img src='${pageContext.request.contextPath }/resources/img/room/" + result[i].bdimg
								+ "' class='img-fluid' style='width:60px; height:60px;  object-fit:fill;'></td>";
						output += "<td><a href='selectRoomList?bdcode=" + result[i].bdcode + "&jsp=view'>"
								+"<span class='overflow'>" + result[i].bdtitle + "</span>"
								+"<span class='fw-bold' style='font-size:15px; color:#00bcd4;'>&nbsp;" + result[i].bdrpcount + "</span>"			
								+"</a></td>";
						output += "<td class='text-center overflow pointer' onclick='writeMemberBoard(\"" + result[i].bdnickname + "\")'>" + result[i].bdnickname + "</td>";
						output += "<td class='text-center overflow'>" + result[i].bddate + "</td>";
						output += "<td class='text-center'>" + result[i].bdhits + "</td>";
						output += "<td class='text-center'>" + result[i].bdrccount + "</td>";
						output += "<td class='text-center'>" + result[i].bdwarning + "</td>";
						output += "<td class='text-center'>"
						if (result[i].bdfix == 1){
							output += "<button class='btn-sm btn-numberone' type='button' onclick='showBdfixModal(this, \""+result[i].bdcode+"\")'>배너</button>";
						} else {
							output += "<button class='btn btn-sm btn-secondary' type='button' onclick='showBdfixModal(this,\""+result[i].bdcode+"\")'>일반</button>";
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
				url: "admin_selectBdfixList_ajax",
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