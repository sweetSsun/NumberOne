<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.bdtitle } - 1인자:공구 상세</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	textarea:focus {
    	outline: none;
	}
	.row .col-1{
		width: auto;
	}
	.inputReply{
		border: none;
		width: -webkit-fill-available;
		resize: none;
		height: auto;
	}
	#inputComment{
		resize: none;
		height: auto;
		width: -webkit-fill-available; 
		padding: 10px 0px; 
		font-size:20px;
	}
	.commentDate{
		color: gray;
		font-size: 17px;
	}
	.boardDate{
		color: gray;
		font-size: 17px;
		text-align: left;
	}
	.bdhit{
		color: gray;
		font-size: 17px;
	}
	.boardCategory{
		color : #00a5ba;
		font-size: 20px;
	}
	.bdProfile{
		height: 40px;
		width:40px;
		object-fit: cover;
	}
	.bdProfile_Kakao{
		height: 40px; 
		width:40px;
		object-fit: cover;
	}
	.bdnickname{
		font-size: 20px;
	}
	.bdregion{
		font-weight: bold;
		color : #00bcd4;
		font-size: 20px;
	}
	.idDateHits{
		border-bottom: solid #E0E0E0 3px;
	}
	.boardTitle{
		font-size: 25px;
	}
	.boardContents{
		border-bottom: solid #E0E0E0 3px;
		font-size: 21px;
	}
	
	.commentCount{
		border-bottom : solid #E0E0E0 3px;
		font-size:20px;
	}
	.inputRpcontents{
		font-size:20px;
	}
	.outerCmtBox{
		background-color : #F6F6F6;
		display: table;
		vertical-align: middle;
	}
	.innerCmtBox{
		display: table-cell;
		margin: auto;
	}
	.replyButton{
		background-color: #F4F4F4;
		float: right;
	}
	.rpnickname{
		font-size:20px;
	}
	.rpProfile{
		height:50px;
		width:50px;
		object-fit: cover;
	}
	.rpProfile_None{
		height:40px; 
		width:40px;
		object-fit: cover;
	}
	.icon{
		border : solid gray 2px;
		border-radius: 5px;
		padding: 2px;
		color : gray;
	}
	.icon:hover{
		cursor: pointer;
	}
	#inputSearchText{
		font-size: 18px;
	}
	.img-container{

     overflow: hidden;
     display: flex;
     margin-top: 2%;
     width: 450px;
     height: 100%;
     
   }
   #upload_Img{
   	max-height: 500px;
   	object-fit: contain;
   }
   
   	.div-GbView{
	    box-shadow: 0px 0px 5px 0px #00bcd4;
	    border-radius: 15px;
	    padding: 2%;
	}
   	.textarea-GbView-2{
		border: none; 
		resize: none;
		cursor: default;		
	}
	
   /* 참여버튼 */
	.attendBtn {
	  display: block;
	  position: relative;	  
	  width: 120px;
	  left: 42%;
	  padding: 0;
	  margin: 10px 20px 10px 0;
	  font-weight: 600;
	  text-align: center;
	  line-height: 50px;
	  color: #FFF;
	  border: none;
	  border-radius: 5px;
	  transition: all 0.2s ;
	  background-color: #5DC8CD;
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
		resize: none;
		height: -webkit-fill-available;
		overflow: hidden;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
		width: 100%;
		font-size: smaller;
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
	
	section div.checkout__form{
	/* 페이지 제목 */
	color: #1c1c1c; 
    font-weight: 700; 
    border-bottom: 1px solid #e1e1e1;
    padding-bottom: 20px;
    margin-bottom: 25px;
    font-size : 24px;
}
	
</style>
</head>
<body>
	    <!-- TopBar -->
        <c:choose>
            <c:when test="${sessionScope.loginId != 'admin'}">
                    <%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
            </c:when>
            <c:otherwise>
                    <%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
            </c:otherwise>
        </c:choose>
        <!-- End of TopBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Gongu.jsp" %>
		
		<section>
			<!-- 페이지명 -->
			<div class="checkout__form" style="margin-top: 30px;">공구게시판</div> 

			<!-- 본문 -->
			<div class="container">
				<div class="row">
					<div class="col">
						<c:choose>
						<c:when test="${gonguBoard.gbstate == 1 }">
							<a href="selectGonguBoardList?gbstate=ing"><span class="fw-bold boardCategory"> | 공구게시판 : 진행중 </span></a> 
							<%-- <span class="fw-bold" style="color:gray; font-size:20px">/</span> <a href="#"><span class="bdregion"> ${board.bdrgname}</span></a> --%>
						</c:when>
						<%-- <c:if test="${gonguBoard.gbstate == 2 }"> --%>
						<c:otherwise>
							<a href="selectGonguBoardList?gbstate=ing"><span class="fw-bold boardCategory"> | 공구게시판 : 진행완료 </span></a>
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
					<%-- 	<c:choose>
							<c:when test="${board.bdmprofile != null && board.bdmstate == 1 }">
								<img class="img-profile rounded-circle bdProfile"  src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/${board.bdmprofile}">
							</c:when>
							
							<c:when test="${board.bdmprofile != null && board.bdmstate == 9 }">
								<!-- 카카오 회원 -->
								<img class="img-profile rounded-circle bdProfile_Kakao" src="${board.bdmprofile}">
							</c:when>
							
							<c:otherwise>
								<img class="img-profile rounded-circle bdProfile"  src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png">
							</c:otherwise>
						</c:choose> --%>
						<span class="fw-bold bdnickname">관리자</span>
					</div>
					
					<div align="right"  class="col-3 offset-md-3">
						<span class="boardDate">${gonguBoard.gbdate } | </span> 
						<span class="bdhit" style="right:0;"><i class="fa-regular fa-eye"></i>  ${gonguBoard.gbhits } </span>
					</div>
				</div>
				<!-- 실험 -->
				
				<!-- 본문 글 내용-->
				<div>
					<c:if test="${gonguBoard.gbimg != null }">
						<div class="img-container" style="height:100%">
							<img title="업로드 이미지" id="upload_Img" alt="" src="${pageContext.request.contextPath }/resources/img/gonguUpLoad/${gonguBoard.gbimg }">
						</div>
					</c:if >
					<div class="row mt-3 mb-1 boardContents" style="padding-bottom: 20px;">
						<div class="col">
							<textarea class="inputReply" rows="10%" cols="100%" readonly>${gonguBoard.gbcontents }</textarea>
							<div class="row div-GbView" style="margin: 10%;">
								<span id="item_name" class="textarea-GbView-2" style="width:60%;">${gonguBoard.gbitemname }</span>
								<span id="item_price" class="textarea-GbView-2 gb_price" style="width:40%; text-align:right;">${gonguBoard.gbitemprice }</span>
							</div>
							<hr>
							<textarea class="inputReply" rows="10%" cols="100%" readonly>
# 참여 방법
로그인 > 참여 버튼 > 양식 입력 > kakao결제

* 주의사항
- 양식에 제대로 입력하지 않으면 카카오톡 메세지가 발송되지 않습니다. 꼭 주의하셔서 입력바랍니다.
만약 잘못 입력했으면 문의를 남겨주세요

- Kakao결제는 천천히 진행해주세요
익숙한 노란 창으로 바뀐 후에 결제버튼을 눌러주시기 바랍니다.
</textarea>
						</div>
						
					
						<!-- 진행중이면 '참여' 버튼이 나타나게하고 진행완료면 '총 참여인원' 버튼이 나타나게. -->
						<c:choose>
						<c:when test="${gonguBoard.gbstate == 1 }">
							<div>
								<button type="button" class="attendBtn btnLightBlue btnPush" onclick="showGonguModal()">참여</button>
							</div>
						</c:when>
						
						<%-- <c:if test="${gonguBoard.gbstate == 2 }"> 진행완료되면 총 참여인원만 나타나게. 목록은 X --%>
						<c:otherwise>
							<div>
								<button type="button" class="attendBtn btnLightBlue" style="width:300px; left:32%; cursor:default; box-shadow:0px -5px 0px 0px #1e8185;">총 참여 인원 ${gonguCount }명 </br> 참여해주셔서 감사합니다. </button>
							</div>
						</c:otherwise>
						</c:choose>
						
						
						<!-- 공동구매 결제API modal-->
						<div class="modal fade" id="gonguModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					        <div class="modal-dialog" role="document">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="updateGbstateModalLabel"> 공동구매 결제 양식 </h5>
					                    <button class="attendX close" type="button" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">×</span>
					                    </button>
					                </div>
					                
					                <div class="modal-body">
						                <form id="form-payment" class="row" method="post">
											<div style="width: 58%; margin-top:2%">
												<div class="attendDiv">
												<input class="attendInput" type="text" id="pay-id" name="pay-id" readonly="readonly" value="${sessionScope.loginId}" style="cursor:default;">
												</div>
												<div class="attendDiv">
												<input class="attendInput" type="text" id="pay-tel" name="pay-tel" placeholder="전화번호를 입력하세요" value="${memberInfo.mphone }">
												</div>
												<div class="attendDiv">
												<textarea class="attendInput" id="pay-email" name="pay-email" placeholder="이메일주소를 입력하세요">${memberInfo.memail }</textarea>
												</div>
												<div class="attendDiv">
												<textarea class="attendInput" id="pay-address" name="pay-address" style="height:100px" placeholder="배송지주소를 입력하세요">${memberInfo.maddr }</textarea>
												<!-- <input class="attendInput" type="text" id="pay-address" name="pay-address" placeholder="배송지주소를 입력하세요"> -->
												</div>
											</div>
											
											<div class="div-GbView" style="width: 40%">
												<div style="height:70%; text-align: center; font-size: smaller;">
													<span>${gonguBoard.gbtitle }</span>
													<textarea class="textarea-GbView-2" style="width:100%; margin-top:20%;" readonly>${gonguBoard.gbitemname }</textarea><br>
													<textarea class="textarea-GbView-2 gb_price" style="width:100%; text-align:right;" readonly></textarea>
												</div>
											</div>
											<div>
												<button id="btn-kakao-pay" type="button" style="float: right; padding-top:3%">
												<img alt="카카오결제API" src="${pageContext.request.contextPath }/resources/img/payment_icon_yellow_medium.png">
												<!-- small/ medium/ large -->
												</button>
											</div>
											<!-- gbcode 넘겨주기 -->
											<input type="hidden" id="gonguGbcode" value="${gonguBoard.gbcode }">
											
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
				</div>
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row mb-2">
					<div class="col-2">
						<c:choose>
						<c:when test="${gonguBoard.gbstate == 1 }">
							<a href="selectGonguBoardList?gbstate=ing&${paging.makeQueryPage(gonguBoard.gbcode, paging.page)}">
								<input  type="button" style="left:0; background-color: #00bcd4" class="middelBtn btn btn-sm fw-bold text-white" value="글목록">
							</a>
						</c:when>
						
						<%-- <c:if test="${gonguBoard.gbstate == 2 }"> --%>
						<c:otherwise>
							<a href="selectGonguBoardList?gbstate=end&${paging.makeQueryPage(gonguBoard.gbcode, paging.page)}">
								<input  type="button" style="left:0; background-color: #00bcd4" class="middelBtn btn btn-sm fw-bold text-white" value="글목록">
							</a>
						</c:otherwise>
						</c:choose>
					</div>
				<%-- <c:choose>
					<c:when test="${sessionScope.loginId == board.bdmid && sessionScope.loginId != 'admin' }">
						<div align="right" class="col" >
							<!-- 수정,삭제 : 로그인 아이디 = 글작성자 -->
							<input onclick="loadToBoardModify()" type="button" style="margin-right: 2px; background-color: #00bcd4;" class="btn btn-sm fw-bold text-white" value="수정">
							<input onclick="bdDeleteCheckModal()" type="button" style="background-color: #00bcd4;" class="btn btn-sm fw-bold text-white" value="삭제">
						</div>
					</c:when>
					
					<c:when test="${sessionScope.loginId != null && sessionScope.loginId != 'admin' }">
						<div align="right" class="col" >
							<!-- 추천,신고 : 로그인 한 아이디  -->
							<i id="bdRecommend" onclick="insertBoardRecommend()" class="fa-regular fa-thumbs-up  fa-2x icon"  style="margin-right: 2px; font-size:30px"></i>
							<i id="bdWarning" onclick="bdWarningCheckModal()" class='fa-solid fa-land-mine-on  fa-2x icon' style="margin-right: 2px; font-size:30px"></i>
						</div>
					</c:when> 
				</c:choose> --%>
				</div>
				
<%-- 				<c:if test="${gonguBoard.gbimg != null }">
					<div class="img-container" >
						<img title="업로드 이미지" id="upload_Img" alt="" src="${pageContext.request.contextPath }/resources/img/gonguUpLoad/${gonguBoard.gbimg }">
					</div>
					<div style="background-color: #00bcd4; width: 200px; color:white;  margin-bottom: 2%;" class="text-center fw-bold">
						업로드 이미지
					</div>				
				</c:if > --%>
				
				<%-- <!------------------ 댓글영역 ------------------->
				<div class="mb-2" id="commentBox">
					<!-- 댓글개수 -->	
					<div class="row">
						<div class="col commentCount">
							<i class="fa-regular fa-comment"></i> 댓글 <span class="text-info fw-bold" id="ReplyCount"></span>개
						</div>
					</div>
					
					<!-- 댓글목록_ajax -->
					<div class="row" id="replyList_ajax">
						
					</div>
					
					<!-- 댓글입력박스 -->
					<!-- 로그인 상태가 아닌 경우 댓글입력칸이 출력되지 않도록-->
					<c:choose>
					<c:when test="${sessionScope.loginId  != null }">
						<div style="min-height:20%; border-radius:8px;" class="row outerCmtBox mt-3 mb-3">
							<div class="innerCmtBox">
								<!-- 댓글입력 -->
								<textarea id="inputComment" style="border: solid #E0E0E0 3px; " class="mt-4 " rows="2" cols="100%" placeholder="상대방에게 불쾌감을 주는 욕설이나 댓글은 고지없이 삭제될 수 있습니다. "></textarea>
							</div>
							<div align="right" class="row">
								<div align="right" class="col">
									<button onclick="insertReply()" class="btn btn-sm bg-secondary mb-2 fw-bold text-white">등록</button>
								</div>
							</div>
						</div>
					</c:when>
					</c:choose>
				</div> --%>
			</div>
			
		</section>
	</main>
	
	<!--  --><!--  --><!--  --><!-- 모달 --><!--  --><!--  --><!--  -->
	<!-- 댓글 수정 모달 -->
	<div class="modal fade" id="bdRpModifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 댓글 수정 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="margin:auto;" >
					<input type="hidden" id="inputRpcode">
					<textarea rows="5" cols="50" id="inputModifyRp" style="border: solid #E0E0E0 2px; border-radius:5px;">
					
					</textarea>                
                </div>
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn text-white" style="background-color:#00bcd4" onclick="rpModify()">등록</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
	
	
	<!-- 게시글 신고 확인 모달 -->
	<div class="modal fade" id="bdWarningCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 게시글 신고 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	게시글을 신고하시겠습니까?
                	<br> <span class="text-danger fw-bold">(※한번 신고한 게시글은 신고취소가 불가능합니다.)</span></div>
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn text-white" style="background-color:#00bcd4" onclick="insertBoardWarning()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
    
    <!--  --><!-- 게시글 삭제 확인 모달 -->
	<div class="modal fade" id="bdDeleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" > 게시글 삭제 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	<span class="fw-bold">게시글을 삭제하시겠습니까?</span>
                </div>	
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn text-white" style="background-color:#00bcd4" onclick="updateBoardDelete()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
    
    <!--  --><!-- 댓글 삭제 확인 모달 -->
	<div class="modal fade" id="rpDeleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" > 댓글 삭제 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	<span class="fw-bold">댓글을 삭제하시겠습니까?</span>
                </div>	
                <div class="modal-footer">
                	<input type="hidden" value="rpcode" id="deleteRpcode">
                    <button class="close btn text-white" style="background-color:#00bcd4" onclick="replyRemove()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
    
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	var boardCheck = "${bdcategory_none}";
	console.log(boardCheck);
	
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
</script>

<!--
<script type="text/javascript">
	//선택한 글번호 
	var bdcode = '${board.bdcode}';
	//현재 로그인중인 아이디
	var loginId = '${sessionScope.loginId}';
	
	$(document).ready(function(){
		selectReplyList();//게시글 댓글목록
		selectReplyCount();//게시글 댓글수
		updateBoardRecommendCount();//게시글 추천수 
		checkBoardRecommend();//게시글 추천 확인
		checkBoardWarning();//게시글 신고 확인 
	});
</script>



<script type="text/javascript">
		// 게시글 경고 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#bdWarningCheckModal").modal("hide");
			});
		}
</script>

<script type="text/javascript">
		// 게시글 삭제 경고 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#bdDeleteCheckModal").modal("hide");
			});
		}
</script>

<script type="text/javascript">
		// 댓글 수정 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#bdRpModifyModal").modal("hide");
			});
		}
</script>

<script type="text/javascript">
		// 댓글 삭제 모달창 close 하는 스크립트
 		var modal = $(".modal");
		var close = $(".close");
		for (var i = 0; i < close.length; i++){
			close[i].addEventListener("click", function(){
				$("#rpDeleteCheckModal").modal("hide");
			});
		}
</script>

<script type="text/javascript">
	/* 게시글 추천, 신고 메소드 */
	function checkBoardRecommend(){
		/* 게시글 추천 확인 */
		$.ajax({
			type : "get",
			url : "checkBoardRecommend_ajax",
			data : { "loginId" : loginId, "bdcode" : bdcode },
			async: false,
			success : function(rcCheck){
				console.log("추천유무 확인 : " + rcCheck);
				if( rcCheck == "Yes" ){
					$("#bdRecommend").addClass("text-primary");
				}
			}
		});
	}
	function insertBoardRecommend(){
		/* 게시글 추천 */
		console.log("게시글 추천자 :" + loginId);
		console.log("추천할 글번호 :" + bdcode);
		
		if( $("#bdRecommend").hasClass("text-primary") ){
			deleteBoardRecommend();
		}else{
			$.ajax({
				type : "get",
				url : "insertBoardRecommend_ajax",
				data : { "loginId" : loginId, "bdcode" : bdcode },
				async: false,
				success : function(recommend){
					console.log(recommend);
					if( recommend.length > 0 ){
						$("#bdRecommend").addClass("text-primary");
						updateBoardRecommendCount();
					}
				}
			});
		}
	}
	function deleteBoardRecommend(){
		/* 추천 취소(추천한 상태에서 추천버튼 누를 시) */
		console.log("추천취소할 사용자 : " + loginId);
		console.log("추천취소할 게시글 : " + bdcode);
		$("#bdRecommend").removeClass("text-primary");
		$.ajax({
			type : "get",
			url : "deleteBoardRecommend_ajax",
			data : { "loginId" : loginId, "bdcode" : bdcode },
			async : false,
			success : function(deleteResult){
				console.log(deleteResult);
				updateBoardRecommendCount();
			}			
		});
	}
	
	function updateBoardRecommendCount(){
		/* 게시글 추천수 출력 */
		$.ajax({
			type : "get",
			url : "selectBoardRecommendCount_ajax",
			async : false,
			data : { "bdcode" : bdcode },
			success : function(boardRecommendCount){
				console.log("게시글 추천수 : " + boardRecommendCount);
				$("#BoardRecommendSum").text(boardRecommendCount);
			}
		});
	}
	///////////////////////////[신고]/////////////////////////////////
	function bdWarningCheckModal(){
		/* 게시글 신고 클릭 시 모달창 출력 */
		if( $("#bdWarning").hasClass("text-danger") ){
			alert("이미 신고접수된 게시물입니다.");
		}else{
			$("#bdWarningCheckModal").modal('show');
		}
	}
	
	function checkBoardWarning(){
		/* 게시글 신고 확인 */
		$.ajax({
			type : "get",
			url : "checkBoardWarning_ajax",
			data : { "loginId" : loginId, "bdcode" : bdcode },
			async: false,
			success : function(wnCheck){
				console.log("신고유무 확인 : " + wnCheck );
				if( wnCheck == "Yes" ){
					$("#bdWarning").addClass("text-danger");
				}
			}
		});
	}
	
	function insertBoardWarning(){
		/* 게시글 신고 */
		console.log("게시글 신고자 : " + loginId);
		console.log("신고할 글번호 : " + bdcode);
		if( $("#bdWarning").hasClass("text-danger") ){
			deleteBoardWarning();
		}else{
			$.ajax({
				type : "get",
				url : "insertBoardWarning_ajax",
				data : { "loginId" : loginId, "bdcode" : bdcode },
				async: false,
				success : function(insertResult){
					console.log(insertResult);
					if( insertResult > 0 ){
						alert("게시글 신고가 접수되었습니다.")
						$("#bdWarning").addClass("text-danger");
					}
				}
			});
		}
	}
	
	function deleteBoardWarning(){
		/* 신고 취소 // 22.07.06 신고취소 안되도록 수정 */
		$("#bdWarning").removeClass("text-danger");
		$.ajax({
			type : "get",
			url : "deleteBoardWarning_ajax",
			data : { "loginId" : loginId, "bdcode" : bdcode },
			async : false,
			success : function(deleteResult){
				console.log(deleteResult);
			}			
		});
	}
</script>

<script type="text/javascript">
	/* 게시글 수정, 삭제 */
	function loadToBoardModify(){
		/* 게시글 수정 페이지 이동  */
		location.href="loadToBoardModify?bdcode="+bdcode;
	}
	
	function bdDeleteCheckModal(){
		/* 게시글 삭제버튼 클릭 시 모달 출력 */
		$("#bdDeleteCheckModal").modal('show');
	}
	function updateBoardDelete(){
		/* 게시글 삭제(상태변경) */
		//모달창에서 "네" 버튼 클릭 시 삭제
		var bdcategory = '${board.bdcategory }';
		location.href="updateBoardDelete?bdcode="+bdcode+"&bdcategory="+bdcategory;
	}
	
</script>

<script type="text/javascript">
	/* 댓글관련 메소드 */	

	/* 댓글입력_ajax */
	function insertReply(){
		var inputComment = $("#inputComment").val();
		console.log("글번호 : " + bdcode);
		console.log("입력댓글 : " + inputComment);
		
		$.ajax({
			type : "get",
			url : "insertBoardReply_ajax",
			data : { "bdcode" : bdcode, "rpcontents" : inputComment},
			async : false,
			success : function(insertResult){
				if( insertResult > 0 ){
					$("#inputComment").val("");
					selectReplyList();
					selectReplyCount();
				}
			}
		});
	}
	
	/* 댓글목록 조회_ajax */
	function selectReplyList(){
		
		var output = "";
		$.ajax({
			type: "get",
			url : "selectBoardReplyList_ajax",
			data : { "bdcode" : bdcode },
			dataType : "json",
			async : false,
			success : function(replyList){
				console.log(replyList);
				output += "<div class=\"row\">"
				for( var i=0; i < replyList.length; i++ ){
					
					if( replyList[i].rpmid == '${sessionScope.loginId}' ){//동일한 아이디 (댓글 수정, 삭제 버튼)
						output += "<div class=\"col-1\" style='border-bottom: solid #E0E0E0 1px;' >" /* 프로필영역 */

						if( replyList[i].rpprofile != null ){//프로필 이미지가 있을 시 
							if(  replyList[i].rpmstate == 9){//카카오 회원
								output += "<img class=\"img-profile rounded-circle rpProfile\"  src='"+replyList[i].rpprofile + "'>"
							}else{
								output += "<img class=\"img-profile rounded-circle rpProfile\"  src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/"+replyList[i].rpprofile + "'>"
							}
						
						
						}else{//프로필 이미지가 없을 시 
							output += "<img class=\"img-profile rounded-circle rpProfile_None\" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png'>"
						}
						output += "</div>"
						
						output += "<div class=\"col-11\" style='border-bottom: solid #E0E0E0 1px;\'>"
						/* 닉네임, 시간 */
						output += "<span class=\"fw-bold rpnickname\">" + replyList[i].rpnickname + "</span>"
						output += "<span class=\"commentDate\">&nbsp;" + replyList[i].rpdate + "</span> "
						
						/* 수정, 삭제 버튼 */
						output += "<input type=\"button\" style=\"border:solid gray 1px\" class=\"btn-sm replyButton fw-bold mt-2\" onclick=\"rpRemoveModal('"+ replyList[i].rpcode +"')\" value=\"삭제\">"
						output += "<input style=\"margin-right:5px; border:solid gray 1px\" type=\"button\" class=\"btn-sm replyButton fw-bold mt-2\" onclick=\"rpModifyModal('"+ replyList[i].rpcode +"')\" value=\"수정\">"
						output += "<br>"
						
						if( '${sessionScope.loginId}' == 'admin'){
							/* 관리자 - 댓글 정지 버튼 */
							output += "<input type=\"button\" style=\"border:solid gray 1px\" class=\"btn-sm replyButton bg-secondary text-white fw-bold mt-2\" onclick=\"adminReplyStop('"+ replyList[i].rpcode +"')\" value=\"정지\">"
						}
						/* 댓글내용 */
						output += "<span class=\"inputRpcontents\">" + replyList[i].rpcontents + "</span>"
						output += "</div>"
						
					}else{
						
						output += "<div class=\"col-1\" style='border-bottom: solid #E0E0E0 1px;'>" /* 프로필영역 */
						if( replyList[i].rpprofile != null ){//프로필 이미지가 있을 시 
							if(  replyList[i].rpmstate == 9){//카카오 회원
								output += "<img class=\"img-profile rounded-circle rpProfile\"  src='"+replyList[i].rpprofile + "'>"
							}else{
								output += "<img class=\"img-profile rounded-circle rpProfile\"  src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/"+replyList[i].rpprofile + "'>"
							}
						}else{//프로필 이미지가 없을 시 
							output += "<img class=\"img-profile rounded-circle rpProfile_None\" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png'>"
						}
						output += "</div>"
							
						output += "<div class=\"col-11\" style='border-bottom: solid #E0E0E0 1px;'>"
						/* 닉네임, 시간 */
						output += "<span class=\"fw-bold rpnickname\">" + replyList[i].rpnickname + "</span>"
						output += "<span class=\"commentDate\">&nbsp;" + replyList[i].rpdate + "</span> "
						
						if( '${sessionScope.loginId}' == 'admin'){
							/* 관리자 - 댓글 정지 버튼 */
							output += "<input type=\"button\" style=\"border:solid gray 1px\" class=\"btn-sm replyButton bg-secondary text-white fw-bold mt-2\" onclick=\"adminReplyStop('"+ replyList[i].rpcode +"')\" value=\"정지\">"
						}
						
						output += "<br>"
						/* 댓글내용 */
						output += "<span class=\"inputRpcontents\">" + replyList[i].rpcontents + "</span>"
						output += "</div>"
					}

				}
				output += "</div>"
			}
		});
		$("#replyList_ajax").html(output);
	}
	
	function selectReplyCount(){
		/* 댓글개수 조회 */
		$.ajax({
			type : "get",
			url : "selectReplyCount_ajax",
			data : { "bdcode" : bdcode },
			async : false,
			success : function(replyCount){
				console.log(replyCount);
				$("#ReplyCount").text(replyCount);
			}
		});
	}
	
	function rpModifyModal(rpcode){
		/* 댓글수정 모달창 띄우기 */
		console.log("댓글코드 : " + rpcode );
		
		$.ajax({
			type : "get",
			url : "selectRpContents_ajax",
			data : { "rpcode" : rpcode },
			async : false,
			success : function(reply){
				
				$("#inputModifyRp").text(reply.rpcontents);
				$("#inputRpcode").val(reply.rpcode);
			}
		});
		
		$("#bdRpModifyModal").modal('show');
		
	}
	
	function rpModify(){
		/* 댓글수정 */
		var modifyRpContents = $("#inputModifyRp").val();
		var inputRecode = $("#inputRpcode").val();
		console.log("수정할 댓글코드 : " + inputRecode);
		
		$.ajax({
			type : "get",
			url : "updateRpcontents_ajax",
			data : { "rpcode":inputRecode, "rpcontents":modifyRpContents },
			async : false,
			success : function(updateResult){
				console.log("updateResult : " + updateResult);
				if (updateResult > 0 ){
					alert("댓글이 수정되었습니다.");
					selectReplyList();
				}
			}
			
		});
		
	}
	
	function rpRemoveModal(rpcode){
		/* 댓글삭제 버튼 클릭 시 모달창 띄우기  */
		console.log(rpcode);
		
		$("#deleteRpcode").val(rpcode);
		$("#rpDeleteCheckModal").modal('show');
		
	}
	
	function replyRemove(){
		/* 댓글삭제(update 상태변경) */
		var deleteRpcode = $("#deleteRpcode").val();
		
		$.ajax({
			type : "get",
			url : "updateReplyState_ajax",
			data : { "rpcode" : deleteRpcode },
			async : false,
			success : function(removeResult){
				console.log(removeResult);
				
				if(removeResult > 0){
					alert("댓글이 삭제되었습니다.");
					selectReplyList();
					selectReplyCount();
				}
			}
			
		});
	}
</script>

<!-- 관리자용 
<script type="text/javascript">
	function adminBoardStop(bdcode){
		/* 관리자 - 게시글 정지  */
		console.log(bdcode);
		location.href="admin_updateBoardStop?bdcode="+bdcode;
	}

	function adminReplyStop(rpcode){
		/* 관리자 - 댓글 정지 */
		console.log(rpcode);
		
		//ajax
		$.ajax({
			type : "get",
			url : "admin_updateReplyStop_ajax",
			data : { "rpcode" : rpcode },
			async : false,
			success : function(adminRpStop){
				if ( adminRpStop > 0 ){
					//댓글목록 및 댓글 개수 새로 출력 
					alert(rpcode + "번 댓글이 정지되었습니다.");
					selectReplyList();
					selectReplyCount();	
				}
			}
		});
		
	}
	
</script>
-->

<script type="text/javascript">

/* Textarea 높이 자동 조절 ( 스크롤바 없애기 ) */
$(".inputReply").each(function () {
	this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
	}).on('input', function () {
	this.style.height = 'auto';
	this.style.height = (this.scrollHeight) + 'px';
	});

</script>


<script type="text/javascript">

	//모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#gonguModal").modal("hide");
		});
	}
	
	//상품가격 콤마 추가
	var gb_price = $(".gb_price").text(); //상품가격
	
	window.onload = function(){
		console.log('페이지로드')
		addPriceComma();
	}	
	function addPriceComma(){			
		//console.log(Number(gb_price).toLocaleString('ko-KR'));
		var gb_price_comma = Number(gb_price).toLocaleString('ko-KR');
		//console.log(gb_price_comma);
		$(".gb_price").text(" ₩ " +gb_price_comma);
	}

	
	//공동구매 참여 양식 입력 모달창 출력
	function showGonguModal(){
		console.log("showGonguModal() 실행");
		console.log("selectLoginOut_ajax() 실행");
		$.ajax({
	  		type : 'get',
	  		url : 'selectLoginOut_ajax',
	  		async : false,
	  		success : function(result){
	  			if (result == "2"){ 
	  				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
	  					location.href = "loadToLogin";
	  				}
	  				return;
	  			}
	  			
	  			console.log("insertCheck_ajax() 실행");
	  			$.ajax({
	  				type : 'get',
	  				url : 'insertCheck_ajax',
	  				async : false,
	  				data:{
						ggbcode:gbcode,
						ggmid:loginId
					},
	  				success : function (check){
	  					console.log("중복확인");
	  					console.log("check : "+check);
	  					// DB에서 참여한적이 있으면 안나타나게
	  					if (check != "") {
	  						console.log("check!=null");
	  						alert("이미 참여했습니다.");
	  						return
	  						
	  					} else {
	  						console.log("check==null");
	  						$("#gonguModal").modal("show");
	  					}
  				  	}
	  					
	  			});
			}
		
		});
	}
</script>

<!-- 카카오페이 클릭 -->
<script type="text/javascript">
var gbcode = $("#gonguGbcode").val();
var loginId = $("#form-payment input[name='pay-id']").val();


$("#btn-kakao-pay").click(function(){
//공동구매 참여양식 값
var tel = $("#form-payment input[name='pay-tel']").val();
var email = $("#form-payment textarea[name='pay-email']").val();
var address = $("#form-payment textarea[name='pay-address']").val();

var item_name = "${gonguBoard.gbitemname }";
var item_price = "${gonguBoard.gbitemprice }";
	console.log("loginId : "+loginId);
	console.log("gbcode : "+gbcode);
	console.log("제목/품목 : "+item_name);
	console.log("가격 : "+item_price);
	
	console.log("카카오페이 클릭");
	console.log("tel : "+tel);
	console.log("email : "+email);
	console.log("address : "+address);

	
	if(loginId == ""){
		alert("아이디를 입력하세요");
		$("#form-payment input[name='pay-name']").focus()
		return;
	}
	if(tel == ""){
		alert("전화번호를 입력하세요");
		$("#form-payment input[name='pay-tel']").focus()
		return;
	}
	if(email == ""){
		alert("이메일을 입력하세요");
		$("#form-payment textarea[name='pay-email']").focus()
		return;
	}
	if(address == ""){
		alert("주소를 입력하세요");
		$("#form-payment textarea[name='pay-address']").focus()
		return;
	}
	
	console.log("selectLoginOut_ajax() 실행");
	$.ajax({
  		type : 'post',
  		url : 'selectLoginOut_ajax',
  		async : false,
  		success : function(result){
  			if (result == "2"){ 
  				if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
  					location.href = "loadToLogin";
  				}
  				return;
  			}
  			
  			if(confirm("카카오페이 결제를 실행하시겠습니까?")){
  				console.log("카카오페이 실행");	
  			
				// 카카오페이 결제전송
				$.ajax({
					type:'post',
					url:'kakaopayReady',
					dataType:'json',
					data:{
						gbcode:gbcode,
						loginId:loginId,
						item_name:item_name,
						item_price:item_price,
						tel: tel,
						email: email,
						address: address
					},
					success:function(response){
						console.log("response : " + response);
						var objCount = Object.keys(response).length;
						// console.log(objCount); 카카오페이 결제준비 중 실패시(Response code: 400) alert 주기 위한 조건. 
						// 성공과 실패시 받는 키의 개수가 다름.(선생님찬스) (메세지도 다르므로 다른 방법으로 줄 수 도 있음)
						
						if(objCount > 2){
							console.log("결제실행");
							var payopen = response.next_redirect_pc_url
							window.open(payopen,"","width=500, height=450, top=0px, left=500px, scrollbars=no, resizable=no");
						} else {
							console.log("결제준비실패 : Response code: 400")
							alert("입력 양식을 확인 해주세요. 이상이 없는데도 반복되면 문의바랍니다.");	
						}
						
					}
				})
			
  			}
  			return;
			
  		}
	})
})
</script>

</html>