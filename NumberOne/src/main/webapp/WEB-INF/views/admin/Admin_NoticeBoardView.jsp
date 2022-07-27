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

<title>${noticeBoard.nbtitle} - 1인자:관리자 공지게시판</title>

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
				<h4 class="text-center">관리자 공지글 상세페이지 : Admin_NoticeBoardView.jsp</h4>
				
				<form action="">
					<div class="row">
						<div class="col">
							<a href="#"><span class="fw-bold boardCategory"> | 공지게시판</span></a> 
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
					</div>
				</form>
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row mb-2">
					<div class="col-2">
						<a href="admin_selectNoticeList?NbCheck=NB&${paging.makeQueryPage(noticeBoard.nbcode, paging.page)}">
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
	// 공지글 삭제 요청 (nbstate 0으로 변경)
	$("#deleteBtn").click(function(){
		console.log("공지 삭제 요청");
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

</body>

</html>