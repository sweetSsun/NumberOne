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
<%@ include file="/resources/css/CommonCss.jsp" %>

<style type="text/css">
    #board_column{
       border-bottom: solid gray 3px;
    }
    table{
       margin: 20px;
    }
    .block span{
    	cursor: pointer;
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
			<div class="container">
            <div class="row" style="margin:auto;">
               <h1 class="text-center">회원 관리페이지 : Admin_MemberList.jsp</h1>
               <div class="col-4 ">

               </div>
               <div class="col-8">
                  <form action="#" method="get">
                  <div class="input-group">
                    <input type="text" class="form-control" name="keyword" placeholder="검색 키워드를 입력하세요!">
                    <span class="input-group-btn">
                      <button class="btn btn-secondary">찾기</button>
                    </span>
                  </div>
                  </form>
               </div>
            </div>
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 상태값 정렬 -->
                   <select id="searchVal" onchange="searchState(1)">
                     <option value="all">전체</option>
                     <option value="active">활동</option>
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
                     <td style="width:150px;">아이디</td>
                     <td style="width:130px;">이름</td>
                     <td style="width:200px;">닉네임</td>
                     <td>연락처</td>
                     <td>이메일</td>
                     <td>가입일</td>
                     <td style="width:70px;">상태</td>
                  </tr>
               </thead>
               <tbody id="mbListTbody">
	               <c:forEach items="${memberList }" var="member">
	                   <!-- 회원관리 목록 -->
	                   <tr style="border-bottom: solid gray 1px;">
	                      <td onclick="showMemberInfoModal('${member.mid}')" style="cursor: pointer;">${member.mid}</td>
	                      <td>${member.mname}</td>
	                      <td>${member.mnickname}</td>
	                      <td>${member.mphone}</td>
	                      <td>${member.memail}</td>
	                      <td>${member.mjoindate}</td>
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${member.mwarning > 0}">
	                      			<button class="btn btn-warning" onclick="showMstateModal(this,'${member.mid }')">경고</button>
	                      		</c:when>
	                      		<c:when test="${member.mstate == 1}">
	                      			<button class="btn btn-primary" onclick="showMstateModal(this,'${member.mid }')">활동</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button class="btn btn-secondary" onclick="showMstateModal(this, '${member.mid }')">정지</button>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </td>
	                   </tr>
	                </c:forEach>                 
                </tbody>
            </table>
            <div class="block text-center" id="pageList">
               	<c:choose>
               		<c:when test="${paging.page <= 1 }">
               			[이전]
               		</c:when>
               		<c:otherwise>
               			<span onclick="searchState(${paging.page -1 })">[이전]</span>
               		</c:otherwise>
               	</c:choose>
               	
               	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" step="1">
                	<c:choose>
                		<c:when test="${paging.page == num }">
                			<span>${num }</span>
                		</c:when>
                		<c:otherwise>
                			<span onclick="searchState(${num})">${num }</span>
                		</c:otherwise>
                	</c:choose>
               	</c:forEach>

               	<c:choose>
               		<c:when test="${paging.page >= paging.maxPage }">
               			[다음]
               		</c:when>
               		<c:otherwise>
               			<span onclick="searchState(${paging.page +1 })">[다음]</span>
               		</c:otherwise>
               	</c:choose>
            </div>
                
            </div>
            
			</div>
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
                                    <div class="h6 mb-1 font-weight-bold text-gray-800" >
                                 		<img class="img-fluid" alt="영화포스터" style="max-height:300px;" id="mI_mprofile" src="">
                                 		프로필이미지
                                    </div>
                                    <div>
                                    	<label class="small">상태메세지</label>
		                                <p class="form-control" id="mI_mmessage" style="min-height:38px;"></p>
                                    </div>
                                </div>
                            </div>
                           	<div class="col-7">
                                <div class="no-gutters align-items-center">
                                    <div class="h6 font-weight-bold text-gray-800">
                                    	<div>
		                                  	<label class="small">아이디</label>
		                                	<p class="form-control" id="mI_mid" style="min-height:38px;"></p>
                                    	</div>
                                    	<div class="row">
	                                  		<div class="col-6">
			                                  	<label class="small">이름</label>
		                               			<p class="form-control" id="mI_mname" style="min-height:38px;"></p>
	                                  		</div>
	                                  		<div class="col-6">
			                                  	<label class="small">닉네임</label>
			                                  	<p class="form-control" id="mI_mnickname" style="min-height:38px;"></p>
	                                  		</div>
                                    	</div>
	                                  	<div>                                	
		                                  	<label class="small">연락처</label>
		                                <p class="form-control" id="mI_mphone"  style="min-height:38px;"></p>
	                                  	</div>
	                                  	<div>                                	
		                                  	<label class="small">이메일</label>
		                              		<p class="form-control" id="mI_memail" style="min-height:38px;"></p>
	                                  	</div>
	                                  	<div>
		                                  	<label class="small">주소</label>
		                                	<p class="form-control" id="mI_maddr" style="min-height:38px;"></p>
                                    	</div>
	                                  	<div class="row">
	                                  		<div class="col-9">
			                                  	<label class="small">가입일</label>
			                                	<p class="form-control" id="mI_mjoindate" style="min-height:38px;"></p>
	                                  		</div>
	                                  		<div class="col-3">
			                                  	<label class="small">경고횟수</label>
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
/*
				for (var j = 0; j < modal.length; j++){
					modal[j].classList.remove('show');
					$(".modal-backdrop").remove(); 
				}*/
			});
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

					// 저장경로 때문에 프로필이미지는 수정 필요
					$("#mI_mprofile").attr("src", result.mprofile);
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
		function searchState(page){
			console.log("searchState() 실행");
			var searchVal = $("#searchVal").val();
			console.log("정렬 선택 : " + searchVal);
			console.log("요청 페이지 : " + page);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal, "page":page},
				url: "admin_selectMemberList_ajax",
				dataType: "json",
				success: function(result){
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid gray 1px;'>";
						output += "<td onclick='showMemberInfoModal( \"" + result[i].mid + "\")' style='cursor: pointer;'>" + result[i].mid + "</td>";
						output += "<td>" + result[i].mname + "</td>";
						output += "<td>" + result[i].mnickname + "</td>";
						output += "<td>" + result[i].mphone + "</td>";
						output += "<td>" + result[i].memail + "</td>";
						output += "<td>" + result[i].mjoindate + "</td>";
						output += "<td>"
						if (result[i].mwarning > 0){
							output += "<button class='btn btn-warning' onclick='showMstateModal(this, \""+result[i].mid+"\")'>경고</button>";
						} else if (result[i].mstate == 1){
							output += "<button class='btn btn-primary' onclick='showMstateModal(this, \""+result[i].mid+"\")'>활동</button>";
						} else {
							output += "<button class='btn btn-secondary' onclick='showMstateModal(this,\""+result[i].mid+"\")'>정지</button>";
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
				data: {"searchVal":searchVal, "page":page},
				url: "admin_selectMemberPagingNumber_ajax",
				dataType: "json",
				success: function(result){
					console.log("페이징 : " + result);
					$("#pageList").text("");
					var output = "";
    					if (result.page == 1) {
    	    				output += "[이전]";
        				} else {
    	    				output += "<span onclick='searchState(" + (result.page - 1) + ")'> [이전] </span>";
        				}
        				for (var i = result.startPage; i <= result.endPage; i++){
        					if (page == i){
        	    				output += "<span>" + i + "</span>";
        					} else {
        	    				output += "<span onclick='searchState(" + i + ")'>" + i + "</span>";
        					}
        				}
        				if (result.page == result.maxPage){
    	    				output += "[다음]";
        				} else {
    	    				output += "<span onclick='searchState(" + (result.page + 1) + ")'> [다음] </span>";
        				}
					$("#pageList").html(output);
				},
				error: function(){
					alert("페이징넘버링 실패");
				}
			})
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
				var mstate = 1;				
			}
			$.ajax({
				type: "get",
				data: {"mid":mid, "mstate":mstate},
				url: "admin_updateMstate_ajax",
				dataType: "json",
				success: function(result){
					console.log(result);
						if (result.mstate == 0){
							btnObj.text("정지").addClass("btn-secondary").removeClass("btn-primary").removeClass("btn-warning");
						} else if (result.mwarning > 0){
							btnObj.text("경고").addClass("btn-warning").removeClass("btn-primary").removeClass("btn-secondary");
						} else {
							btnObj.text("활동").addClass("btn-primary").removeClass("btn-secondary").removeClass("btn-warning");
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
</body>

</html>