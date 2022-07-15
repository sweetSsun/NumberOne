<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 회원관리</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Css Styles -->
<%@ include file="/resources/css/BarCss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listCss.css" type="text/css">

<style type="text/css">
	.textarea-MbList{
		border: 1px solid #ced4da;
		resize: none;
		width: -webkit-fill-available;
		height: 230px;
		background-color:#fff;
		padding: 0.375rem 0.75rem;
    	font-size: 1rem;
    	font-weight: 400;
	}
	textarea:focus {
    	outline: none;
	}
  	#pageList button{
 		display: none;
	}
	label{
		cursor: pointer;
		margin-bottom: 5px;
	}
	.cursor_auto{
		cursor: auto;
	}
</style>

</head>


<body>

	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
		<!-- 본문 -->
		<form action="admin_selectMemberList" method="get" id="actionForm">
			<div class="container">
            <div class="row" style="margin:auto;">
               <h4 class="text-center">회원 관리페이지 : Admin_MemberList.jsp</h4>
            </div>
            <!-- 검색 -->
            <div class="row">
				<div class="col-5" align="right">
					<select name="searchType" id="searchTypeSel" class="searchType">
						<option value="mid">아이디</option>
						<option value="mname">이름</option>
						<option value="mnickname">닉네임</option>
					</select>
				</div>
                <div class="col-7">
                   	<input type="text" class="" name="keyword" id="searchText" placeholder="검색 키워드를 입력하세요!" value="${paging.keyword}">
                    <button class="btn btn-sm btn-secondary" type="submit">검색</button>
           	</div>
           
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 상태값 정렬 -->
                   <select class="categoryList" name="searchVal" id="searchValSel" onchange="mbSearchState(this.value)">
                     <option class="categorySel" value="all">전체</option>
                     <option class="categorySel" value="active">활동</option>
                     <option class="categorySel" value="warning">경고</option>
                     <option class="categorySel" value="inactive">정지</option>
                     <option class="categorySel" value="withdraw">탈퇴</option>
                  </select>
               </div>
            </div>
            
            <!-- 회원 목록 -->
            <div class="row" style="margin-top: 20px;">
            <table style="table-layout: fixed;" >
               <thead >
                  <tr class="text-center fw-bold" id="board_column">
                     <td style="">아이디</td>
                     <td style="">이름</td>
                     <td style="">닉네임</td>
                     <td style="width:15%">연락처</td>
                     <td style="width:15%">이메일</td>
                     <td style="width:10%">가입일</td>
                     <td style="width:3rem;">경고</td>
                     <td style="width:3rem;">상태</td>
                  </tr>
               </thead>
               <tbody id="mbListTbody">
	               <c:forEach items="${memberList }" var="member">
	                   <!-- 회원관리 목록 -->
	                   <tr style="border-bottom: solid #E0E0E0 1px;">
	                      <td onclick="showMemberInfoModal('${member.mid}')" style="cursor: pointer;" class="overflow text-center">${member.mid}</td>
	                      <td onclick="showMemberInfoModal('${member.mid}')" style="cursor: pointer;" class="overflow text-center">${member.mname}</td>
	                      <td onclick="showMemberInfoModal('${member.mid}')" style="cursor: pointer;" class="overflow text-center">${member.mnickname}</td>
	                      <td class="overflow text-center">${member.mphone}</td>
	                      <td class="overflow text-center">${member.memail}</td>
	                      <td class="overflow text-center">${member.mjoindate}</td>
	                      <td class="text-center">${member.mwarning}</td>
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${member.mwarning > 0}">
	                      			<button class="btn btn-sm btn-warning" type="button" onclick="showMstateModal(this,'${member.mid }')">경고</button>
	                      		</c:when>
	                      		<c:when test="${member.mstate == 0}">
	                      			<button class="btn btn-sm btn-danger"  type="button" onclick="showMstateModal(this, '${member.mid }')">정지</button>
	                      		</c:when>
	                      		<c:when test="${member.mstate == 1 || member.mstate == 9}">
	                      			<button class="btn btn-sm btn-primary"  type="button" onclick="showMstateModal(this,'${member.mid }')">활동</button>
	                      		</c:when>
	                      		<c:when test="${member.mstate == 2}">
	                      			<button class="btn btn-sm btn-secondary" type="button"  style="cursor:default;">탈퇴</button>
	                      		</c:when>
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
	
	
	<!-- 회원상태 변경 모달 -->
	<div class="modal fade" id="updateMstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateMstateModalLabel"> 회원상태 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updateMstateModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="mid">
                    <button class="btn btn-primary" onclick="updateMstate()">네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 회원 상세정보 모달 -->
	<div class="modal fade" id="memberInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width:700px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="memberInfoModalLabel"> </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="memberInfoModalBody"> 
                	<div class="row">
	                		<div class="col-5">
                                <div class="no-gutters align-items-center">
                                    <div class="h6 mb-1 text-center" id="mI_mprofile">
                                 		프로필이미지
                                    </div>
                                    <div>
                                    	<label class="small cursor_auto">상태메세지</label>
		                                <textarea readonly class=" textarea-MbList" id="mI_mmessage" style=""></textarea>
                                    </div>
                                </div>
                            </div>
                           	<div class="col-7">
                                <div class="no-gutters align-items-center">
                                    <div class="h6">
                                    	<div>
		                                  	<label class="small cursor_auto">아이디</label>
		                                	<p class="form-control" id="mI_mid" style="min-height:38px;"></p>
                                    	</div>
                                    	<div class="row">
	                                  		<div class="col-6">
			                                  	<label class="small cursor_auto">이름</label>
		                               			<p class="form-control" id="mI_mname" style="min-height:38px;"></p>
	                                  		</div>
	                                  		<div class="col-6">
			                                  	<label class="small cursor_auto">닉네임</label>
			                                  	<p class="form-control" id="mI_mnickname" style="min-height:38px;"></p>
	                                  		</div>
                                    	</div>
	                                  	<div>                                	
		                                  	<label class="small cursor_auto">연락처</label>
		                                <p class="form-control" id="mI_mphone"  style="min-height:38px;"></p>
	                                  	</div>
	                                  	<div>                                	
		                                  	<label class="small cursor_auto">이메일</label>
		                              		<p class="form-control" id="mI_memail" style="min-height:38px;"></p>
	                                  	</div>
	                                  	<div>
		                                  	<label class="small cursor_auto">주소</label>
		                                	<p class="form-control" id="mI_maddr" style="min-height:38px;"></p>
                                    	</div>
	                                  	<div class="row">
	                                  		<div class="col-9">
			                                  	<label class="small cursor_auto">가입일</label>
			                                	<p class="form-control" id="mI_mjoindate" style="min-height:38px;"></p>
	                                  		</div>
	                                  		<div class="col-3">
			                                  	<label class="small cursor_auto">경고횟수</label>
			                                	<p class="form-control" id="mI_mwarning" style="min-height:38px;"></p>
		                                	</div>
                                    	</div>
	                                </div>
                                </div>
                            </div>
                        </div>
                
                </div>
                <div class="modal-footer">
                    <button class="close btn btn-primary" type="button" data-dismiss="modal">확인</button>
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
				$("#updateMstateModal").modal("hide");
				$("#memberInfoModal").modal("hide");
			});
		}
		
		// 회원상태 변경 확인 모달창 출력
		var btnObj;
		function showMstateModal(obj, mid){
			console.log("showMstateModal() 실행");
			btnObj = $(obj);
			var btnObjText = btnObj.text();
			console.log("btnObjText:"+btnObjText);
			if (btnObjText == "활동" || btnObjText == "경고"){
				$("#updateMstateModalBody").text(mid + " 회원을 정지 처리하시겠습니까?");
			} else {
				$("#updateMstateModalBody").text(mid + " 회원을 활동 처리하시겠습니까?");
			}
			$("#mid").val(mid);
			$("#updateMstateModal").modal("show");
		}
		
		// 회원상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateMstate(){
			console.log("updateMstate() 실행");
			var mid = $("#mid").val();
			console.log(btnObj.text());
			if (btnObj.text() == "활동" || btnObj.text() == "경고" ){
				var mstate = 0;				
			} else {
				if (mid.includes("@_")){
					var mstate = 9;				
				} else {
					var mstate = 1;				
				}
			}
			$.ajax({
				type: "get",
				data: {"mid":mid, "mstate":mstate},
				url: "admin_updateMstate_ajax",
				dataType: "json",
				success: function(result){
					console.log(result);
						if (result.mstate == 0){
							btnObj.text("정지").addClass("btn-danger").removeClass("btn-secondary btn-primary btn-warning");
						} else if (result.mwarning > 0){
							btnObj.text("경고").addClass("btn-warning").removeClass("btn-secondary btn-danger btn-primary");
						} else {
							btnObj.text("활동").addClass("btn-primary").removeClass("btn-secondary btn-danger btn-warning");
						}
					$("#updateMstateModal").modal("hide");
				},
				error: function(){
					$("#updateMstateModal").modal("hide");
					alert("회원상태 변경에 실패했습니다.");
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
		// 회원 상세정보 모달창 출력
		function showMemberInfoModal(mid){
			console.log("showMemberInfoModal() 실행");
			$.ajax({
				type: "post",
				data: {"mid":mid},
				url: "admin_selectMemberInfo_ajax",
				dataType: "json",
				success: function(result){
					console.log(result);
					$("#memberInfoModalLabel").text(mid + " 회원 상세정보");
					$("#mI_mprofile").text("");
					if (result.mprofile != null){
						$("#mI_mprofile").html("<img class='img-account-profile rounded-circle' alt='프로필이미지' style='height: 200px; width: 200px; border: 1px solid #808080; object-fit: cover;' src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/" + result.mprofile + "'>");
					} else {
						$("#mI_mprofile").html("<img class='img-account-profile rounded-circle' alt='프로필이미지' style='height: 200px; width: 200px; border: 1px solid #808080; object-fit: contain;' src='${pageContext.request.contextPath }/resources/img/logo.jpg'>");
                       //class="img-account-profile rounded-circle mb-2"
					}
					$("#mI_mmessage").text(result.mmessage);
					$("#mI_mid").text(result.mid);
					$("#mI_mname").text(result.mname);
					$("#mI_mnickname").text(result.mnickname);
					$("#mI_mphone").text(result.mphone);
					$("#mI_memail").text(result.memail);
					$("#mI_maddr").text(result.maddr);
					$("#mI_mjoindate").text(result.mjoindate);
					$("#mI_mwarning").text(result.mwarning);
					
					$("#memberInfoModal").modal("show");
				}
			});
		}
	</script>
	
	<script type="text/javascript">
		// 정렬 select하면 ajax로 회원목록 받고 출력을 바꿔주는 함수
		function mbSearchState(searchVal){
			console.log("mbSearchState() 실행");
			var searchType = $("#searchTypeSel").val();
			var searchText = $("#searchText").val();
			console.log("정렬 선택 : " + searchVal);
			console.log("검색 종류 : " + searchType);
			console.log("검색 키워드 : " + searchText);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"list"},
				url: "admin_selectMemberList_ajax",
				dataType: "json",
				success: function(result){
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid #E0E0E0 1px;'>";
						output += "<td onclick='showMemberInfoModal( \"" + result[i].mid + "\")' class='text-center overflow' style='cursor: pointer;'>" + result[i].mid + "</td>";
						output += "<td onclick='showMemberInfoModal( \"" + result[i].mid + "\")' class='text-center overflow' style='cursor: pointer;'>" + result[i].mname + "</td>";
						output += "<td onclick='showMemberInfoModal( \"" + result[i].mid + "\")' class='text-center overflow' style='cursor: pointer;'>" + result[i].mnickname + "</td>";
						output += "<td class='text-center overflow' >" + result[i].mphone + "</td>";
						output += "<td class='text-center overflow' >" + result[i].memail + "</td>";
						output += "<td class='text-center overflow' >" + result[i].mjoindate + "</td>";
						output += "<td class='text-center' >" + result[i].mwarning + "</td>";
						output += "<td class='text-center'>"
						if (result[i].mwarning > 0){
							output += "<button class='btn btn-sm btn-warning' type='button' onclick='showMstateModal(this, \""+result[i].mid+"\")'>경고</button>";
						} else if (result[i].mstate == 0){
							output += "<button class='btn btn-sm btn-danger' type='button' onclick='showMstateModal(this, \""+result[i].mid+"\")'>정지</button>";
						} else if (result[i].mstate == 1 || result[i].mstate == 9){
							output += "<button class='btn btn-sm btn-primary' type='button' onclick='showMstateModal(this, \""+result[i].mid+"\")'>활동</button>";
						} else {
							output += "<button class='btn btn-sm btn-secondary' type='button' style='cursor:default;>탈퇴</button>";
						}
						output += "</td>";
						output += "</tr>";
					}
					$("#mbListTbody").html(output);
				}
			});
			// 페이지에서 출력할 페이지번호 받아오기
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "searchType":searchType, "keyword":searchText, "ajaxCheck":"page"},
				url: "admin_selectMemberList_ajax",
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