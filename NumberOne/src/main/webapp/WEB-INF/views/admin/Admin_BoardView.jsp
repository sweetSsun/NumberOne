<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Css Styles -->
<%@ include file="/resources/css/BarCss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<title>${board.bdtitle } - 1인자:커뮤니티</title>

<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	textarea:focus {
    	outline: none;
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
</style>
</head>
<body>
	    <!-- TopBar -->
       	<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
        <!-- End of TopBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h4 class="text-center">커뮤니티 상세페이지 : Admin_BoardView.jsp</h4>
				<form action="">
					<div class="row">
						<div class="col">
							<a href="#"><span class="fw-bold boardCategory"> | ${board.bdcategory }게시판 </span></a> 
							<span class="fw-bold" style="color:gray; font-size:20px">/</span> <a href="#"><span class="bdregion"> ${board.bdrgname}</span></a>
						</div>
					</div>
					<div class="row" >
						<div class="col">
							<span class="fw-bold boardTitle">${board.bdtitle }</span>  
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col-6">
							<a href="selectWriteMemberInfo?nickname=${board.bdnickname }" target="_blank"><span class="fw-bold bdnickname">${board.bdnickname }</span></a> 
						</div>
						
						<div align="right"  class="col-3 offset-md-3">
							<span class="boardDate">${board.bddate } | </span> 
							<span class="bdhit" style="right:0;"><i class="fa-regular fa-eye"></i>  ${board.bdhits } |</span> 
							<i class="fa-regular fa-thumbs-up commentDate" ></i> <span class="commentDate" style="right:0;" id="BoardRecommendSum"></span>
						</div>
					</div>
					<!-- 실험 -->
					
					
					<!-- 본문 글 내용-->
					<div class="row mt-3 mb-1 boardContents">
						<div class="col">
							<%-- <textarea rows="10%" cols="100%" readonly>${board.bdcontents }</textarea> --%>
							<div style="min-height:270px;">${board.bdcontents }</div>
						</div>
					</div>
				</form>
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row mb-2">
					<div class="col-2">
						<input onclick="history.back();" 
							type="button" style="left:0; background-color: #00bcd4" class="middelBtn btn btn-sm fw-bold text-white" value="글목록"> 
					</div>
					<div align="right" class="col">
						<c:if test="${board.bdstate == 1 }">
							<input onclick="adminBoardStop('${board.bdcode}')" type="button" style="left:0;" class="middleBtn btn btn-sm bg-secondary fw-bold text-white" value="정지">
						</c:if>
					</div>					
				</div>
				
				
				<!------------------ 댓글영역 ------------------->
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
				</div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
</script>

<script type="text/javascript">
	//선택한 글번호 
	var bdcode = '${board.bdcode}';
	//현재 로그인중인 아이디
	var loginId = '${sessionScope.loginId}';
	
	$(document).ready(function(){
		selectReplyList();//게시글 댓글목록
		selectReplyCount();//게시글 댓글수
		updateBoardRecommendCount();//게시글 추천수 
	});
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
		location.href="updateBoardDelete?bdcode="+bdcode+"&bdcategory="+'${board.bdcategory }';
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
					
					if( replyList[i].rpmid == '${sessionScope.loginId}' ){//동일한 아이디
						
						output += "<div class=\"col-1\" style='border-bottom: solid #E0E0E0 1px;\ margin-right:-20px;' >" /* 프로필영역 */
						if( replyList[i].rpprofile != null ){
							output += "<img class=\"img-profile rounded-circle \" style=\"height:55px;\" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/"+replyList[i].rpprofile + "'>"
						}else{
							output += "<img class=\"img-profile rounded-circle \" style=\"height:40px;\" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png'>"
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
						
						output += "<div class=\"col-1\" style='border-bottom: solid #E0E0E0 1px; margin-right:-20px;'>" /* 프로필영역 */
						if( replyList[i].rpprofile != null ){
							output += "<img class=\"img-profile rounded-circle \" style=\"height:55px;\" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/"+replyList[i].rpprofile + "'>"
						}else{
							output += "<img class=\"img-profile rounded-circle\" style=\"height:40px;\" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png'>"
						}
						output += "</div>"
							
						output += "<div class=\"col-11\" style='border-bottom: solid #E0E0E0 1px;\'>"
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

<!-- 관리자용 -->
<script type="text/javascript">
	function adminBoardStop(bdcode){
		/* 관리자 - 게시글 정지  */
		console.log(bdcode);
		var check = "adminPage"; // 관리자페이지에서 넘어왔음을 확인
		location.href="admin_updateBoardStop${paging.makeQueryPage(paging.page)}&bdcode="+bdcode+"&check="+check;
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


</html>