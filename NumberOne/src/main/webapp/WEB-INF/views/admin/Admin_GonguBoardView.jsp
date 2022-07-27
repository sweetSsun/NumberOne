<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<!-- 카카오 JS_SDK -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



<title>${noticeBoard.nbtitle} - 1인자:관리자 공구게시판</title>

<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	.textarea-NbView{
		border: none;
		resize: none;
		width: -webkit-fill-available;
		min-height: 20rem;
	}
	textarea:focus {
    	outline: none;
	}
	.idDateHits{
		border-bottom: solid #E0E0E0 3px;
	}
	.boardDate{
		color: gray;
		font-size: 17px;
		text-align: left;
	}
	.boardCategory{
		color : #00a5ba;
		font-size: 20px;
	}
	.boardTitle{
		font-size: 25px;
	}
	.boardContents{
		border-bottom: solid #E0E0E0 3px;
		font-size: 21px;
	}
	.commentDate{
		color: gray;
		font-size: 17px;
	}
	.bdhit{
		color: gray;
		font-size: 17px;
	}
	.bdnickname{
		font-size: 20px;
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
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file= "/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h4 class="text-center">관리자 공구글 상세페이지 : GonguBoardView.jsp 임시로 회원커뮤니티와 연결시켰어용 관리자아니면 관리자사이드바 누르지마세용 메인으로가용 </h4>
				
				<!-- <form action=""> -->
					<div class="row">
						<div class="col">
							<a href="#"><span class="fw-bold boardCategory"> | 공구게시판</span></a> 
						</div>
					</div>
					<div class="row" >
						<div class="col">
							<span class="fw-bold boardTitle">${noticeBoard.nbtitle }</span>  
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col-6">
							<!-- 닉네임 출력으로 바꾸기 -->
							<span class="fw-bold bdnickname">${noticeBoard.nbnickname }</span>
						</div>
						
						<div align="right" class="col-3 offset-md-3">
							<span class="boardDate">${noticeBoard.nbdate } | </span> 
							<span class="bdhit" style="right:0;"><i class="fa-regular fa-eye"></i>${noticeBoard.nbhits}</span> 
						</div>
					</div>
					
					<!-- 본문 글 내용-->
					<div class="row mt-3 mb-1 boardContents">
						<div class="col">
							<c:if test="${noticeBoard.nbimg != null }">
								<img alt="" src="${pageContext.request.contextPath }/resources/img/noticeUpLoad/${noticeBoard.nbimg}" style="max-width:100%; max-height:500px;">
							</c:if>
							<textarea class="textarea-NbView" readonly>${noticeBoard.nbcontents }</textarea>
						</div>
						
						<!-- 참여 버튼 -->
						<div>
							<button class="btn" onclick="showGonguModal()">참여</button>
						</div>
						
						<!-- 공동구매 결제API -->
						<div class="modal fade" id="gonguModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					        <div class="modal-dialog" role="document">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="updateNbstateModalLabel"> 공동구매 결제 양식 </h5>
					                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">×</span>
					                    </button>
					                </div>
					                
					                <div class="modal-body">
						                <form id="form-payment" method="post" action=""><!--  onsubmit="return formCheck()"> -->
											<div class="col-lg-10">
												<div>
												<input type="text" name="pay-id" placeholder="아이디를 입력하세요" value="${sessionScope.loginId}">
												</div>
												<div>
												<input type="text" name="pay-tel" placeholder="전화번호를 입력하세요">
												</div>
												<div>
												<input type="text" name="pay-email" placeholder="이메일주소를 입력하세요">
												</div>
												<div>
												<input type="text" name="pay-address" placeholder="배송지주소를 입력하세요">
												</div>
											</div>
											
											<div class="col-lg-2">
												<span id="total-price">1</span><h3>원 입니다.</h3>
												<button id="btn-kakao-pay" type="button">
													<img alt="카카오결제API" src="${pageContext.request.contextPath }/resources/img/payment_icon_yellow_medium.png">
													<!-- small/ medium/ large -->
												</button>
											</div>
										</form>
					                </div>
					                
					                <div class="modal-footer">
					                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					                </div>
					            </div>
					        </div>
					    </div>
						
						<!-- 공구 끝 -->
						<!-- 본문 끝 -->
						
					</div>
				<!-- </form> -->
				
				
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row mb-2">
					<div class="col-2">
						<a href="admin_selectNoticeList?NbCheck=GB&${paging.makeQueryPage(noticeBoard.nbcode, paging.page)}">
						<input type="button" style="left:0;" class="middleBtn btn-numberone btn-sm fw-bold text-white" value="글목록">
						</a> 
					</div>
					<div align="right" class="col" >
						<input type="button" class="btn-numberone btn-sm fw-bold text-white"
							id="modifyBtn" value="수정">
						<input type="button" style="margin-right: 2px;" class="btn-numberone btn-sm fw-bold text-white" 
							id="deleteBtn"  value="삭제">
					</div>
				</div>
				
			</div>
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
     var checkMsg = '${msg}';
     console.log(checkMsg.length);
     if( checkMsg.length > 0 ){
        alert(checkMsg);
     }
</script>

<script type="text/javascript">
	// 공지글 삭제 요청 (nbstate 0으로 변경)
	$("#deleteBtn").click(function(){
		console.log("공구 삭제 요청");
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
	  			
				var nbstate = 2;
				var nbcode = '${noticeBoard.nbcode}';
				console.log("nbcode : " + nbcode);
				location.href="admin_updateNbstate?nbcode="+nbcode+"&nbstate="+nbstate;
	  		}
		});
	});
	
	$("#modifyBtn").click(function(){
		console.log("공지 수정 요청");
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
	  			
				var nbcode = '${noticeBoard.nbcode}';
				console.log("nbcode : " + nbcode);
				//console.log("paging : " + ${paging});
				var url = "admin_selectNoticeModify${paging.makeQueryPage(noticeBoard.nbcode, paging.page)}";
				console.log(url);
				location.href="admin_selectNoticeModify${paging.makeQueryPage(noticeBoard.nbcode, paging.page)}";
	  		}
		});
	});
	
</script>

<!-- 카카오 결제 -->
<!-- <script type="text/javascript">
	
function kakaopay(){
	//SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요
	Kakao.init('ca0d18cfbba25a16c9f1b8b5955fbe83');
	Kakao.isInitialized();
	// SDK 초기화 여부를 판단합니다.
	console.log("Kakao.isInitialized();");
	
}

</script> -->

<script type="text/javascript">
//모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#gonguModal").modal("hide");
		});
	}
			
	// 공동구매 참여 양식 입력 모달창 출력
	var btnObj_state;
	function showGonguModal(){
		console.log("showGonguModal() 실행");
		/* DB에서 참여한적이 있으면 안나타나게
		 if (btnObj_stateText == "활성"){
			$("#gonguModal").text(nbcode + "번 공구를 삭제 처리하시겠습니까?");
		} else {
			$("#updateNbstateModalBody").text(nbcode + "번 공구를 활성화 처리하시겠습니까?");
		}
		$("#nbcode_state").val(nbcode);
		*/
		$("#gonguModal").modal("show");
	}
</script>

<script>

	// 필수 입력값 확인
	function formCheck(){
	
		var loginId = $("#form-payment input[name='pay-id']").val();
		var tel = $("#form-payment input[name='pay-tel']").val();
		var email = $("#form-payment input[name='pay-email']").val();
		var address = $("#form-payment input[name='pay-address']").val();
		
		if(loginId == ""){
			alert("아이디를 입력하세요");
			$("#form-payment input[name='pay-name']").focus()
			return false;
		}
		if(tel == ""){
			alert("전화번호를 입력하세요");
			$("#form-payment input[name='pay-tel']").focus()
			return false;
		}
		if(email == ""){
			alert("이메일을 입력하세요");
			$("#form-payment input[name='pay-email']").focus()
			return false;
		}
		if(address == ""){
			alert("주소를 입력하세요");
			$("#form-payment input[name='pay-address']").focus()
			return false;
		}
		
		console.log("loginId : "+loginId);
		console.log("tel : "+tel);
		console.log("email : "+email);
		console.log("address : "+address);
	}
	
	//카카오결제	
	$("#btn-kakao-pay").click(function(){
		console.log("카카오페이 클릭");
		
		// 카카오페이 결제전송
		$.ajax({
			type:'post',
			url:'kakaopay',
			dataType:'json',
 			/* data:{
 				nbcode:"",//nbcode;
 				loginId:""//loginId,

			},
 */			success:function(response){
				console.log("결제실행");
				var payopen = response.next_redirect_pc_url
				window.open(payopen,"","width=350, height=450, top=0px, left=500px, scrollbars=no, resizable=no");
				console.log(response)
				//if(response="")
				// 결과값에따라서 넣어주기! 결제성공했을때 !
				// alert("success");
			}
		})
	})
	
</script>


</body>

</html>