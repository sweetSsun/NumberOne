<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공지관리</title>

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
</style>

</head>


<body>

	<!-- TobBar -->
	<c:choose>
		<c:when test="${sessionScope.loginId != 'admin'}">
			<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
		</c:otherwise>
	</c:choose>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
	<c:choose>
		<c:when test="${sessionScope.loginId != 'admin'}">
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file= "/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		</c:otherwise>
	</c:choose>
		
		<section>
		<!-- 본문 -->
			<div class="container">
            	<form action="admin_selectNoticeList" method="get">
	            <div class="row" style="margin:auto;">
	                <h1 class="text-center">공지 관리페이지 : Admin_NoticeList.jsp</h1>
					<div class="col-4 ">
						<select name="searchType">
							<option value="nbTitle">제목</option>
							<option value="nbContents">내용</option>
							<option value="nbTitleContents">제목+내용</option>
						</select>
					</div>
	                <div class="col-6">
	                	<div class="input-group">
	                    	<input type="text" class="form-control" name="keyword" placeholder="검색 키워드를 입력하세요!">
	                    	<span class="input-group-btn">
	                      	<button class="btn btn-secondary">찾기</button>
	                    	</span>
	                	</div>
	            	</div>
		            <div class="col-2">
						<!-- 공지작성 버튼 -->
						<button class="btn btn-primary btm-sm">글쓰기</button>
					</div>
	            </div>
	            </form>
				
			<c:if test="${searchText != null }">
				<!-- 검색결과 안내  -->
				<div class="row mb-5">
					<h3 class="text-center">[ <span class="text-primary">${searchText}</span> ] 로 검색한 결과 입니다.</h3>  
				</div>
			</c:if>
           
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 상태값 정렬 -->
                   <select onchange="nbSearchState(this.value)">
                     <option value="all">전체</option>
                     <option value="active">활성</option>
                     <option value="inactive">비활성</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row">
            <table >
               <thead >
                  <tr class="fw-bold" id="board_column">
                     <td style="width:70px;">글번호</td>
                     <td style="min-width:200px;">제목</td>
                     <td>작성자</td>
                     <td>작성일</td>
                     <td style="width:50px;">조회</td>
                     <td style="width:80px;">상태</td>
                  </tr>
               </thead>
               <tbody id="nbListTbody">
	               <c:forEach items="${noticeList }" var="notice">
	                   <!-- 회원관리 목록 -->
	                   <tr style="border-bottom: solid gray 1px;">
	                      <td>${notice.nbcode}</td>
	                      <td><a href="selectNoticeBoardView?nbcode=${notice.nbcode}">${notice.nbtitle}</a></td>
	                      <td>${notice.nbmid}</td>
	                      <td>${notice.nbdate}</td>
	                      <td>${notice.nbhits}</td>
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${notice.nbstate == 1}">
	                      			<button class="btn btn-primary" onclick="showNbstateModal(this,'${notice.nbcode }')">활성</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button class="btn btn-secondary" onclick="showNbstateModal(this, '${notice.nbcode }')">비활성</button>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </td>
	                   </tr>
	                </c:forEach>                 
                </tbody>
            </table>
            </div>
            
			</div>
		</section>
	</main>
	
	
	<!-- 회원상태 변경 모달 -->
	<div class="modal fade" id="updateNbstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateNbstateModalLabel"> 공지상태 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="updateNbstateModalBody"> </div>
                <div class="modal-footer">
                	<input type="hidden" id="nbcode">
                    <button class="btn btn-primary" onclick="updateNbstate()">네</button>
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
				$("#updateNbstateModal").modal("hide");

			});
		}
	</script>
	
	<script type="text/javascript">
		// 정렬 select하면 ajax로 공지목록 받고 출력을 바꿔주는 함수
		function nbSearchState(searchVal){
			console.log("nbSearchState() 실행");
			console.log("정렬 선택 : " + searchVal);
			$.ajax({
				type: "get",
				data: {"searchVal":searchVal},
				url: "admin_selectNoticeList_ajax",
				dataType: "json",
				success: function(result){
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr style='border-bottom: solid gray 1px;'>";
						output += "<td>" + result[i].nbcode + "</td>";
						output += "<td>" + result[i].nbtitle + "</td>";
						output += "<td><a href='#'>" + result[i].nbmid + "</a></td>";
						output += "<td>" + result[i].nbdate + "</td>";
						output += "<td>" + result[i].nbhits + "</td>";
						output += "<td>"
						if (result[i].nbstate == 1){
							output += "<button class='btn btn-primary' onclick='showNbstateModal(this, \""+result[i].nbcode+"\")'>활성</button>";
						} else {
							output += "<button class='btn btn-secondary' onclick='showNbstateModal(this,\""+result[i].nbcode+"\")'>비활성</button>";
						}
						output += "</td>";
						output += "</tr>";
					}
					$("#nbListTbody").html(output);
				}
			});
		}	
		
		// 공지상태 변경 확인 모달창 출력
		var btnObj;
		function showNbstateModal(obj, nbcode){
			console.log("showNbstateModal() 실행");
			btnObj = $(obj);
			var btnObjText = btnObj.text();
			console.log("btnObjText:"+btnObjText);
			if (btnObjText == "활성"){
				$("#updateNbstateModalBody").text(nbcode + "번 공지를 비활성화 처리하시겠습니까?");
			} else {
				$("#updateNbstateModalBody").text(nbcode + "번 공지를 활성화 처리하시겠습니까?");
			}
			$("#nbcode").val(nbcode);
			$("#updateNbstateModal").modal("show");
		}
		
		// 회원상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateNbstate(){
			console.log("updateNbstate() 실행");
			var nbcode = $("#nbcode").val();
			console.log(btnObj.text());
			if (btnObj.text() == "활성"){
				var nbstate = 0;				
			} else {
				var nbstate = 1;				
			}
			$.ajax({
				type: "get",
				data: {"nbcode":nbcode, "nbstate":nbstate},
				url: "admin_updateNbstate_ajax",
				dataType: "json",
				success: function(result){
					if(result > 0){
						if (nbstate == 0){
							btnObj.text("비활성").addClass("btn-secondary").removeClass("btn-primary");
						} else {
							btnObj.text("활성").addClass("btn-primary").removeClass("btn-secondary");
						}
					}
					$("#updateNbstateModal").modal("hide");
				},
				error: function(){
					$("#updateNbstateModal").modal("hide");
					alert("공지상태 변경에 실패했습니다.");
				}
			});
		}
	</script>
</body>

</html>