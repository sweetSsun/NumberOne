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



<title>${gonguBoard.gbtitle} - 1인자:관리자 공구게시판</title>

<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	.textarea-GbView{
		border: none;
		resize: none;
		width: -webkit-fill-available;
		min-height: 20rem;
	}
	.textarea-GbView-2{
		border: none; 
		resize: none;
		cursor: default;
	}
	.div-GbView{
	    box-shadow: 0px 0px 5px 0px #00bcd4;
	    border-radius: 15px;
	    padding: 2%;
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
	
	/* 참여버튼 */
	.attendBtn {
	  display: block;
	  position: relative;	  
	  width: 120px;
	  left: 42%;
	  padding: 15px;
	  margin: 10px 20px 10px 0;
	  font-weight: 600;
	  text-align: center;
	  line-height: 50px;
	  color: #FFF;
	  border: none;
	  border-radius: 5px;
	  transition: all 0.2s ;
	  background-color: #5DC8CD;
	  width: fit-content;
	}
	.btnLightBlue.btnPush {
	  box-shadow: 0px 5px 0px 0px #1E8185;
	}
	.btnPush:hover {
	  margin-top: 15px;
	  margin-bottom: 5px;
	}
	.btnLightBlue.btnPush:hover {
	  box-shadow: 0px 0px 0px 0px #1E8185;
	}
	
	/* 참여 modal input태그*/
	.attendDiv{
		margin: 2%;
	}
	.attendInput {
		height: 4vh;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		width: 100%;
		font-size: smaller
	}
	
	/* 참여 modal X버튼 */
	.attendX{
		border-radius: 100%;
	    border: none;
	    width: 7%;
	}
	
	#btn-kakao-pay{
		border: 0;
    	background-color: transparent;
	}
	
	/* 모달창 크기조절 */
	#attendModal{
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}
</style>

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
			<div class="container" style="margin-top: 10px">
				
				<!-- 페이지 제목 -->
                <div class="checkout__form">공구게시판</div>
					<div class="row">
						<div class="col">
							<c:choose>
							<c:when test="${gonguBoard.gbstate == 1 }">
								<a href="#"><span class="fw-bold boardCategory"> | 공구게시판 : 진행중</span></a>
								<%-- <span class="fw-bold" style="color:gray; font-size:20px">/</span> <a href="#"><span class="bdregion"> ${board.bdrgname}</span></a> --%>
							</c:when>
							<%-- <c:if test="${gonguBoard.gbstate == 2 }"> --%>
							<c:otherwise>
								<a href="#"><span class="fw-bold boardCategory"> | 공구게시판 : 진행완료</span></a>
							</c:otherwise>
							</c:choose>							 
						</div>
					</div>
					<div class="row" >
						<div class="col">
							<span class="fw-bold boardTitle">${gonguBoard.gbtitle }</span>  
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col-6">
							<!-- 닉네임 출력으로 바꾸기 -->
							<span class="fw-bold bdnickname">${gonguBoard.gbnickname }</span>
						</div>
						
						<div align="right" class="col-3 offset-md-3">
							<span class="boardDate">${gonguBoard.gbdate } | </span> 
							<span class="bdhit" style="right:0;"><i class="fa-regular fa-eye"></i>${gonguBoard.gbhits}</span> 
						</div>
					</div>
					
					<!-- 본문 글 내용-->
					<div class="mt-3 mb-1 boardContents" style="padding-bottom: 20px;">
						<div style="padding-bottom: 20px;">
							<c:if test="${gonguBoard.gbimg != null }">
								<img alt="" src="${pageContext.request.contextPath }/resources/img/gonguUpLoad/${gonguBoard.gbimg}" style="max-width:100%; max-height:500px;">
							</c:if>
						</div>
						<div>
							<textarea class="textarea-GbView" style="padding-bottom: 20px;" readonly>${gonguBoard.gbcontents }</textarea>
							<div class="row div-GbView" style="margin: 10%;">
								<span class="textarea-GbView-2" style="width:60%;">${gonguBoard.gbitemname }</span>
								<span class="textarea-GbView-2 gb_price" style="width:40%; text-align:right;">${gonguBoard.gbitemprice }</span>
							</div>
							<hr>
							<textarea class="textarea-GbView" readonly>
# 참여 방법
로그인 > 참여 버튼 > 양식 입력 > kakao결제

* 주의사항
- 양식에 제대로 입력하지 않으면 카카오톡 메세지가 발송되지 않습니다. 꼭 주의하셔서 입력바랍니다.
만약 잘못 입력했으면 문의를 남겨주세요

- Kakao결제는 천천히 진행해주세요
익숙한 노란 창으로 바뀐 후에 결제버튼을 눌러주시기 바랍니다.
</textarea>
							<!-- 참여 버튼 -->
							<c:choose>
								<c:when test="${gonguBoard.gbstate == 1 }">
									<div>
										<c:choose>
											<c:when test="${gonguCount > 0 }">
												<button class="attendBtn btnLightBlue btnPush" onclick="showAttendModal()">현재 참여 인원 </br> ${gonguCount }명</button>
											</c:when>
											<c:otherwise>
												<button class="attendBtn btnLightBlue btnPush" style="cursor: default;">현재 참여 인원 </br> ${gonguCount }명</button>
											</c:otherwise>
										</c:choose>
									</div>
								</c:when>
								<%-- <c:if test="${gonguBoard.gbstate == 2 }"> 진행완료되면 총 참여인원만 나타나게. 목록은 X --%>
							<c:otherwise>
								<div>
									<button type="button" class="attendBtn btnLightBlue btnPush" onclick="showAttendModal()" style="width:300px; left:32%;">총 참여 인원 ${gonguCount }명 </br> 참여해주셔서 감사합니다. </button>
								</div>
							</c:otherwise>
							</c:choose>
						</div>
							
						<!-- 공동구매 결제API 대신 참여확인 modal -->
						<div class="modal fade" id="attendModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					        <div class="modal-dialog" role="document">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="updateGbstateModalLabel"> 공동구매 참여 목록 </h5>
					                    <button class="attendX close" type="button" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">×</span>
					                    </button>
					                </div>
					                
					                <div class="modal-body">
						                <form id="form-payment" class="row" method="post">
											<div style="width: 58%; margin-top:2%">
												<c:forEach items="${gonguList }" var="gonguList">
													<div class="attendDiv">
														<input class="attendInput" type="text" id="pay-id" name="pay-id" readonly="readonly" value="${gonguList }" style="cursor:default;">
													</div>
												</c:forEach>
											</div>
											
											<div class="div-GbView" style="width: 40%">
												<div style="height:70%; text-align: center; font-size: smaller;">
													<span>${gonguBoard.gbtitle }</span>
													<textarea class="textarea-GbView-2" style="width:100%; margin-top:20%;" readonly>${gonguBoard.gbitemname }</textarea><br>
													<textarea class="textarea-GbView-2 gb_price" style="width:100%; text-align:right;" readonly></textarea>
												</div>
											</div>
											<!-- gbcode 넘겨주기 -->
											<input type="hidden" id="gonguGbcode" value="${gonguBoard.gbcode }">
											
										</form>
					                </div>
					                
					                <div class="modal-footer">
					                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">확인</button>
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
						<a href="admin_selectGonguList?${paging.makeQueryPage(gonguBoard.gbcode, paging.page)}">
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

/* Textarea 높이 자동 조절 ( 스크롤바 없애기 ) */
$(".textarea-GbView").each(function () {
	this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
	}).on('input', function () {
	this.style.height = 'auto';
	this.style.height = (this.scrollHeight) + 'px';
	});

//상품가격 콤마 추가
var gb_price = $(".gb_price").text(); //상품가격

window.onload = function(){
	console.log('페이지로드')
	addPriceComma();
}	
function addPriceComma(){			
	console.log(Number(gb_price).toLocaleString('ko-KR'));
	var gb_price_comma = Number(gb_price).toLocaleString('ko-KR');
	console.log(gb_price_comma);
	$(".gb_price").text(" ₩ " +gb_price_comma);
}
</script>

<script type="text/javascript">
	// 공지글 삭제 요청 (gbstate 0으로 변경)
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
	  			
				var gbstate = 2;
				var gbcode = '${gonguBoard.gbcode}';
				console.log("gbcode : " + gbcode);
				location.href="admin_updateGbstate?gbcode="+gbcode+"&gbstate="+gbstate;
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
	  			
				var gbcode = '${gonguBoard.gbcode}';
				console.log("gbcode : " + gbcode);
				//console.log("paging : " + ${paging});
				var url = "admin_selectGonguModify${paging.makeQueryPage(gonguBoard.gbcode, paging.page)}";
				console.log(url);
				location.href="admin_selectGonguModify${paging.makeQueryPage(gonguBoard.gbcode, paging.page)}";
	  		}
		});
	});
	
</script>

<script type="text/javascript">
//모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#attendModal").modal("hide");
		});
	}
			

	var tel = "${memberInfo.mphone }";
	var email = "${memberInfo.memail }";
	var address = "${memberInfo.maddr }";
	console.log("번호 "+tel);
	console.log("이메일 "+email);
	console.log("주소 "+address);
	
	// 공동구매 참여 인원 모달창 출력
	function showAttendModal(){
		console.log("showAttendModal() 실행");
		
		console.log("Admin_selectLoginOut_ajax() 실행");
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
	  	
			$("#pay-tel").val(tel);
			$("#pay-email").val(email);
			$("#pay-address").val(address);
			$("#attendModal").modal("show");
	  		}
		});
	}
</script>


</body>

</html>