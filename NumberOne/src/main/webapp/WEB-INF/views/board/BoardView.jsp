<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/CommonCss.jsp" %>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<title>${board.bdtitle } - 1인자:게시판 게시판 글상세 페이지</title>
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style type="text/css">
	textarea{
		border: none;
		height: auto;
	}
	.commentDate{
		color: gray;
		font-size: 20px;
	}
	.boardDate{
		color: gray;
		font-size: 20px;
		text-align: left;
	}
	.boardCategory{
		color : #004804;
		font-size: 25px;
	}
	.bdregion{
		font-weight: bold;
		color : #7fad39;
	}
	.idDateHits{
		border-bottom: solid #E0E0E0 3px;
	}
	.boardTitle{
		font-size: 35px;
	}
	.boardContents{
		border-bottom: solid #E0E0E0 3px;
	}
	
	.commentCount{
		border-bottom : solid #E0E0E0 3px;
		
	}
	.commentContents{
		border-bottom : solid #E0E0E0 2px;
	}
	.commentWriteBox{
		background-color : #E8E8E8;
		vertical-align: middle;
	}
	.commentWriteForm{
		min-height: 150px;
	}
	.replyButton{
		border : solid gray 1px;
		background-color: #F4F4F4;
		float: right;
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">게시판 글상세페이지 : BoardView.jsp</h1>
				<form action="">
					<div class="row">
						<div class="col">
							<a href="#"><span class="fw-bold boardCategory"> | ${board.bdcategory }게시판 </span></a> 
							<span class="fw-bold" style="color:gray;">/</span> <a href="#"><span class="bdregion"> ${board.bdrgname}</span></a>
						</div>
					</div>
					<div class="row" >
						<div class="col">
							<span class="fw-bold boardTitle">${board.bdtitle }</span>  
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col-6">
							<a href="#"><span class="fw-bold">${board.bdnickname }</span></a> 
						</div>
						
						<div class="col-3 offset-md-3">
							<span class="boardDate">${board.bddate } | </span> 
							<span class="commentDate" style="right:0;"><i class="fa-regular fa-eye"></i>  15 |</span> 
							<i class="fa-regular fa-thumbs-up commentDate" ></i> <span class="commentDate" style="right:0;" id="BoardRecommendSum"></span>
						</div>
					</div>
					<!-- 실험 -->
					
					
					<!-- 본문 글 내용-->
					<div class="row mt-3 mb-3 boardContents">
						<div class="col">
							<%-- <textarea rows="10%" cols="100%" readonly>${board.bdcontents }</textarea> --%>
							<div style="min-height:400px;">${board.bdcontents }</div>
						</div>
					</div>
				</form>
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row">
					<div class="col-2">
						<a href="#"><input type="button" style="left:0;" class="middelBtn btn btn-lg bg-success fw-bold text-white" value="글목록"></a> 
					</div>
				<c:choose>
					<c:when test="${sessionScope.loginId == board.bdmid }">
						<div class="col-4 offset-md-6" >
							<!-- 수정,삭제 : 로그인 아이디 = 글작성자 -->
							<input onclick="updateBoardDelete()" type="button" style="float:right;" class="btn btn-lg bg-success fw-bold text-white" value="삭제">
							<input onclick="loadToBoardModify()" type="button" style="float:right; margin-right: 5px;" class="btn btn-lg bg-success fw-bold text-white" value="수정">
						</div>
					</c:when>
					
					<c:when test="${sessionScope.loginId != null }">
						<div class="col-4 offset-md-6" >
							<!-- 추천,신고 : 로그인 한 아이디  -->
							<!-- <i onclick="insertBoardWarning()" class="fa-solid fa-triangle-exclamation text-danger fa-2x icon" style="float:right;"></i>신고 -->
							<!-- <input type="button" style="float:right;" class="btn btn-lg bg-success fw-bold text-white" value="신고"> -->
							<i id="bdWarning" onclick="insertBoardWarning()" class='fa-solid fa-land-mine-on  fa-2x icon' style="float:right; margin-right:5px;"></i>
							<i id="bdRecommend" onclick="boardRecommend()" class="fa-regular fa-thumbs-up  fa-2x icon" style="float:right; margin-right:5px;"></i>
							<!-- <input type="button" style="float:right; margin-right: 5px;" class="btn btn-lg bg-success fw-bold text-white" value="추천"> -->
							
						</div>
					</c:when>
				
				</c:choose>
				</div>
				
				<!------------------ 댓글영역 ------------------->
				<div class="mt-3" id="commentBox">
					<!-- 댓글개수 -->	
					<div class="row">
						<div class="col commentCount">
							<i class="fa-regular fa-comment"></i> 댓글 <span class="text-success fw-bold" id="ReplyCount"></span>개
						</div>
					</div>
					
					<!-- 프로필 출력 -->
					<div class="row">
						<div class="col-1">
							<img class="rounded-circle" alt="" src="${pageContext.request.contextPath }/resources/img/room/logo.jpg">
						</div>
						<div class="col-9">
							<div class="row">
								아이디 / 시간 
							</div>
							<div class="row">
								댓글내용
							</div>
						</div>
					</div>
					
					<!-- 댓글목록 -->
					<div class="row" id="replyList_ajax">
	
					</div>
					
					<!-- 댓글입력박스 -->
					<!-- 로그인 상태가 아닌 경우 댓글입력칸이 출력되지 않도록-->
					<c:choose>
					<c:when test="${sessionScope.loginId  != null }">
					<div class="row commentWriteBox mt-3">
						<table>
							<tr>
								<td>
									<!-- 댓글입력칸 -->
									<div class="commentWriteForm">
										<textarea id="inputComment" class="commentInput mt-3" rows="3" cols="95" "></textarea>
									</div>
								</td>
								<td>
									<input type="button" onclick="insertReply()" value="등록">
								</td>
							</tr>
						</table>
					</div>
					</c:when>
					</c:choose>
					
				</div>
			</div>
			
		</section>
	</main>
	
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
		checkBoardRecommend();//게시글 추천 확인
	});
</script>

<script type="text/javascript">
	/* 게시글 추천, 삭제 메소드 */
	function boardRecommend(){
		insertBoardRecommend();
		
		
	}
	
	function checkBoardRecommend(){
		/* 게시글 추천 확인 */
		$.ajax({
			type : "get",
			url : "checkBoardRecommend_ajax",
			data : { "loginId" : loginId, "bdcode" : bdcode },
			async: false,
			success : function(rcCheck){
				console.log(rcCheck);
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
		
		$.ajax({
			type : "get",
			url : "insertBoardRecommend_ajax",
			data : { "loginId" : loginId, "bdcode" : bdcode },
			async: false,
			success : function(updateResult){
				console.log(updateResult);
					updateBoardRecommendCount();
					$("#bdRecommend").addClass("text-primary");
			}
		});
	}
	
	function deleteBoardRecommend(){
		/* 추천 중복 클릭 시 추천 취소 */
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
					$("#bdRecommend").removeClass("text-primary");
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
	
	function insertBoardWarning(){
		/* 게시글 신고 */
		console.log("게시글 신고자 : " + loginId);
		console.log("신고할 글번호 : " + bdcode);
		
		$.ajax({
			type : "get",
			url : "insertBoardWarning_ajax",
			data : { "loginId" : loginId, "bdcode" : bdcode },
			async: false,
			success : function(insertResult){
				console.log(insertResult);
				
				if( insertResult > 0 ){
					alert("게시글 신고가 접수되었습니다.");
				}
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
	
	
	function updateBoardDelete(){
		/* 게시글 삭제(상태변경) */
		location.href="updateBoardDelete?bdcode="+bdcode;
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
				
				for( var i=0; i < replyList.length; i++ ){
					output += "<div class=\"col\">"
					output += "<span class=\"fw-bold\">" + replyList[i].rpnickname + "</span>"
					output += "<span class=\"commentDate\">&nbsp;" + replyList[i].rpdate + "</span>"
					output += "<input type=\"button\" class=\"btn-sm replyButton fw-bold mt-2\" onclick=\"replyRemove('"+ replyList[i].rpcode +"')\" value=\"삭제\">"
					output += "<input style=\"margin-right:5px;\" type=\"button\" class=\"btn-sm replyButton fw-bold mt-2\" onclick=\"replyModify()\" value=\"수정\">"
					output += "</div>"
					output += "<div class=\"row commentContents\">"
					output += "<span>" + replyList[i].rpcontents + "</span>"
					output += "</div>"
				}
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
	
	function replyRemove(rpcode){
		/* 댓글삭제(update 상태변경) */
		$.ajax({
			type : "get",
			url : "updateReplyState_ajax",
			data : { "rpcode" : rpcode },
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

</html>