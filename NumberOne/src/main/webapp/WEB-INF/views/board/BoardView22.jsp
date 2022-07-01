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
</style>
</head>
<body>
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
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
							<a href="#"><span class="fw-bold boardCategory"> | ${board.bdcategory }게시판</span></a> 
						</div>
					</div>
					<div class="row mb-2" >
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
							<span class="commentDate" style="right:0;"><i class="fa-regular fa-thumbs-up"></i>  10</span> 
						</div>
					</div>
					<!-- 실험 -->
					
					
					<!-- 본문 글 내용-->
					<div class="row mt-3 mb-3 boardContents">
						<div class="col">
							<textarea rows="10%" cols="100%" readonly>${board.bdcontents }</textarea>
						</div>
					</div>
				</form>
				
				<!------------------ 댓글영역 ------------------->
				<div class="mt-3" id="commentBox">
					<!-- 댓글개수 -->	
					<div class="row">
						<div class="col commentCount">
							<i class="fa-regular fa-comment"></i> 댓글 <span class="text-success fw-bold" id="ReplyCount"></span>개
						</div>
					</div>
					
					<!--댓글작성자  -->
					<c:forEach items="${replyList }" var="reply">
					<div class="row mt-2" id="replyList_ajax">
						<div class="col" >
							<span class="fw-bold">${reply.rpnickname }</span>
							<span class="commentDate">&nbsp;${reply.rpdate }</span>
							<input type="button" class="btn-sm replyButton fw-bold" value="삭제">
							<input style="margin-right:5px;" type="button" class="btn-sm replyButton fw-bold" value="수정">
						</div>
					</div>
					<!-- 댓글내용 -->
					<div class="row commentContents">
						<span>${reply.rpcontents }</span>
					</div>
					</c:forEach>
					
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
									<input type="button" onclick="registComment('${board.bdcode}')" value="등록">
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
	
</script>

<script type="text/javascript">
	
	$(document).ready(function(){
		var bdcode = '${board.bdcode}';
		console.log(bdcode);
		
		
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
	});
	
</script>



<script type="text/javascript">
	
	/* 댓글입력_ajax */
	function registComment(bdcode){
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
				}
			}
		});
		
	}
</script>

</html>