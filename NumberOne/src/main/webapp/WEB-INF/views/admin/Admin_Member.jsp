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
               <h1 class="text-center">회원 관리페이지 : Admin_Member.jsp</h1>
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
                  <!-- 말머리 정렬 -->
                   <select id="searchVal" onchange="searchState()">
                     <option value="all">전체</option>
                     <option value="active">활동</option>
                     <option value="warning">신고</option>
                     <option value="inactive">정지</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row">
            <table >
               <thead >
                  <tr class="text-center" id="board_column">
                     <td>아이디</td>
                     <td>이름</td>
                     <td>닉네임</td>
                     <td>가입일</td>
                     <td>상태</td>
                  </tr>
               </thead>
               <tbody id="mbListTbody">
	               <c:forEach items="${memberList }" var="member">
	                   <!-- 회원관리 목록 -->
	                   <tr class="fw-bold" style="border-bottom: solid gray 1px;">
	                      <td>${member.mid}</td>
	                      <td>${member.mname}</td>
	                      <td>
	                         <a href="#">${member.mnickname}</a>
	                      </td>
	                      <td>${member.mjoindate}</td>
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${member.mwarning > 0}">
	                      			<button onclick="showMstateModal(this,'${member.mid }')">신고</button>
	                      		</c:when>
	                      		<c:when test="${member.mstate == 1}">
	                      			<button onclick="showMstateModal(this,'${member.mid }')">활동</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button onclick="showMstateModal(this, '${member.mid }')">정지</button>
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
	
	
	
	
	
	
	
	
	<div class="modal fade" id="updateMstateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel"> 회원상태 변경 확인 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="modalBody"> </div>
                <div class="modal-footer">
                	<input readonly id="mid">
                	
                	<!-- input hidden 넣어서 id값 넣고 모달창 뜰 때 mid innerText 해주기 -->
                	<!-- 네 버튼을 누르면 input의 id값 받아오면서 ajax로 mstate update 하고 버튼 css 바꿔주기 -->
                    <button class="" onclick="updateMstate()">네</a>
                    <button class="close" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	
	
	
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script type="text/javascript">
		// 정렬 select하면 ajax로 회원목록 받고 출력을 바꿔주는 함수
		function searchState(){
			console.log("searchState() 실행");
			var searchVal = $("#searchVal").val();
			console.log("정렬 선택 : " + searchVal);
			$.ajax({
				type: "get",
				url: "selectMemberList_ajax",
				data: {"searchVal":searchVal},
				dataType: "json",
				success: function(result){
					var output = "";
					console.log(result);					
					for (var i = 0; i < result.length; i++){
						output += "<tr class='fw-bold' style='border-bottom: solid gray 1px;'>";
						output += "<td>" + result[i].mid + "</td>";
						output += "<td>" + result[i].mname + "</td>";
						output += "<td><a href='#'>" + result[i].mnickname + "</a></td>";
						output += "<td>" + result[i].mjoindate + "</td>";
						output += "<td>"
						if (result[i].mwarning > 0){
							output += "<button onclick='showMstateModal(this, \""+result[i].mid+"\")'>신고</button>";
						} else if (result[i].mstate == 1){
							output += "<button onclick='showMstateModal(this, \""+result[i].mid+"\")'>활동</button>";
						} else {
							output += "<button onclick='showMstateModal(this,\""+result[i].mid+"\")'>정지</button>";
						}
						output += "</td>";
						output += "</tr>";
					}
					$("#mbListTbody").html(output);
				}
			});
		}	
		
		// 회원상태 변경 확인 모달창 출력
		var btnObj;
		function showMstateModal(obj, mid){
			console.log("showMstateModal() 실행");
			btnObj = $(obj);
			var btnObjText = btnObj.text();
			console.log("btnObjText:"+btnObjText);
			if (btnObjText == "활동" || btnObjText == "신고"){
				$("#modalBody").text(mid + " 회원을 정지 처리하시겠습니까?");
			} else {
				$("#modalBody").text(mid + " 회원을 활동 처리하시겠습니까?");
			}
			$("#mid").val(mid);
			$("#updateMstateModal").modal("show");
		}
		
		// 회원상태 변경 모달창에서 "네" 버튼을 눌렀을 때 상태값 변경하고 상태 버튼 css 변경
		function updateMstate(){
			console.log("updateMstate() 실행");
			var mid = $("#mid").val();
			console.log(btnObj.text());
			if (btnObj.text() == "활동" || btnObj.text() == "신고" ){
				var mstate = 0;				
			} else {
				var mstate = 1;				
			}
			$.ajax({
				type: "get",
				data: {"mid":mid, "mstate":mstate},
				url: "updateMstate_ajax",
				dataType: "json",
				success: function(result){
					console.log(result);
						if (result.mstate == 0){
							btnObj.text("정지");
						} else if (result.mwarning > 0){
							btnObj.text("신고");
						} else {
							btnObj.text("활동");
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