<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.bdtitle } - 1인자:지역글 상세페이지</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

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
		/* width: auto; */
	}
	#inputReply{
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
		/*display: table;*/
		vertical-align: middle;
	}
	.innerCmtBox{
		display: table-cell;
		margin: auto;
	}
	.innerCmtBtn{
		display: table-cell;
		margin: auto;
		vertical-align: middle;
	}
	.replyButton{
		background-color: #F4F4F4;
		float: right;
	}
	.rpProfile{
		height:50px;
		width:50px;
		object-fit: fill;
	}
	.rpProfile_None{
		height:50px; 
		width:50px;
		object-fit: cover;
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
	.img-container{

     overflow: hidden;
     display: flex;
/*      align-items: center; */
/*      justify-content: center; */
/*      border: solid #E0E0E0 2px; */
     margin-top: 2%;
     width: 450px;
     height: 350px;
     
   }
   #upload_Img{
   	width: 450px;
   	height: 350px;
   	object-fit: contain;
   }
   .rpnickname:hover{
   	color:#00bcd4;
   }
   .bdnickname:hover{
   	color:#00bcd4;
   }
    pre{
	font-family: 'pretendard';
	width: fit-content;
	white-space: break-spaces;
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
#rerp_writeBtn:hover{
	cursor: pointer;
}
.col-11{
 	padding-left: 0; 
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
			<div class="checkout__form" style="margin-top: 30px;">지역게시판</div> 
				<form action="">
					<div class="row">
						<div class="col">
							<a href="selectCategoryBoardList?searchVal=${board.bdcategory }"><span class="fw-bold boardCategory"> | ${board.bdcategory }게시판 </span></a> 
							<span class="fw-bold" style="color:gray; font-size:20px">/</span> 
							
							<c:choose>
								<c:when test="${board.bdrgcode == 'ALL' }">
									<a href="selectRegionBoardList"><span class="bdregion"> ${board.bdrgname}</span></a>
								</c:when>
							
								<c:otherwise>
									<a href="selectDetailBoardList?searchVal=${board.bdrgcode }"><span class="bdregion"> ${board.bdrgname}</span></a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="row" >
						<div class="col">
							<span class="fw-bold boardTitle">${board.bdtitle }</span>  
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col-6">
							<c:choose>
								<c:when test="${board.bdmprofile != null && board.bdmstate == 1 }">
									<img class="img-profile rounded-circle" style="height: 45px; width:45px;" src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/${board.bdmprofile}">
								</c:when>
								
								<c:when test="${board.bdmprofile != null && board.bdmstate == 9 }">
									<img class="img-profile rounded-circle" style="height: 40px; width:40px;" src="${board.bdmprofile}">
								</c:when>
								
								<c:otherwise>
									<img class="img-profile rounded-circle" style="height: 45px; width:45px;" src="${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png">
								</c:otherwise>
							</c:choose>
							<a style="cursor: pointer" onclick="writeMemberBoard('${board.bdnickname}')"><span class="fw-bold bdnickname">${board.bdnickname }</span></a>
						</div>
						
						<div align="right"  class="col-3 offset-md-3">
							<%-- <span class="boardDate">${board.bddate } | </span>  --%>
							<span class="boardDate" id="bddate"></span> 
							<span class="bdhit" style="right:0;"><i class="fa-regular fa-eye"></i>  ${board.bdhits } |</span> 
							<i class="fa-regular fa-thumbs-up commentDate" ></i> <span class="commentDate" style="right:0;" id="BoardRecommendSum"></span>
						</div>
					</div>
					<!-- 실험 -->
					
					
					<!-- 본문 글 내용-->
					<div class="row">
					<c:if test="${board.bdimg != null }">
						<div class="col img-container" >
							<img title="업로드 이미지" id="upload_Img" alt="" src="${pageContext.request.contextPath }/resources/img/board/${board.bdimg }">
						</div>
					</c:if >
					</div>					
					<div class="row mt-3 mb-1 boardContents">
						<div class="col">
							<textarea id="inputReply" rows="10%" cols="100%" readonly>${board.bdcontents }</textarea>
							<%-- <text style="min-height:270px;">${board.bdcontents }</div> --%>
						</div>
					</div>
				</form>
				
				<!-- 글목록, 글수정, 글삭제 버튼 -->
				<div class="row mb-2">
					<div class="col-2">
						<c:choose>
							<c:when test="${paging.bdtype eq 'region' && paging.searchVal eq ''}">
								<a href="selectRegionBoardList${paging.makeQueryPage(board.bdcode, paging.page) }" >
								<input type="button" style="left:0; background-color: #00bcd4" class="middelBtn btn btn-sm fw-bold text-white" value="글목록">
								</a> 
							</c:when>
							
							<c:otherwise>
								<a href="selectDetailBoardList${paging.makeQueryPage(board.bdrgcode, bdtype, board.bdcode, paging.page) }" >
								<input type="button" style="left:0; background-color: #00bcd4" class="middelBtn btn btn-sm fw-bold text-white" value="글목록">
								</a> 
							</c:otherwise>
							
							
						</c:choose>
					</div>
				<c:choose>
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
					
					<c:when test="${sessionScope.loginId == 'admin' }">
						<div align="right" class="col">
							<input onclick="adminBoardStop('${board.bdcode}')" type="button" style="left:0;" class="middleBtn btn btn-sm bg-secondary fw-bold text-white" value="정지">
						</div>
					</c:when>
				</c:choose>
				</div>

<%-- 				<c:if test="${board.bdimg != null }">
					<div class="img-container" >
						<img title="업로드 이미지" id="upload_Img" alt="" src="${pageContext.request.contextPath }/resources/img/board/${board.bdimg }">
					</div>
					<div style="background-color: #00bcd4; width: 200px; color:white;  margin-bottom: 2%;" class="text-center fw-bold">
						업로드 이미지
					</div>				
				</c:if > --%>			
				
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
							<div class="row innerCmtBox">
								<!-- 댓글입력 -->
								<textarea id="inputComment" style="border: solid #E0E0E0 3px; " class="mt-4 " rows="2" width="100%" placeholder="상대방에게 불쾌감을 주는 욕설이나 댓글은 고지없이 삭제될 수 있습니다. "></textarea>
							</div>
							<div align="right" class="col innerCmtBtn">
								<button onclick="insertReply()" class="btn btn-sm btn-secondary mb-2 fw-bold">등록</button>
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
	
	const bdmid = '${board.bdmid}';
	var nowRpparent = "";
	
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
		checkBoardWarning();//게시글 신고 확인 
		var bddate = timeForToday("${board.bddate }"); //게시글 작성 시간
		$("#bddate").text(bddate);
	});
	
	//닉네임 태그 클릭시 연결되는 함수
	function replyAt(mnickname){
		console.log(mnickname+"로 검색 요청");
		
		location.href = '${pageContext.request.contextPath }/selectByRpnickname?keyword='+mnickname+'&searchType=bdnickname&searchVal=bdcode';
		
	}
	
	//시간 함수
	function timeForToday(value) {
		console.log("시간 변경 함수 호출")
		
        var today = new Date();
        var timeValue = new Date(value);

        var betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        console.log(betweenTime);
        if (betweenTime < 1) return "방금전 | ";
        if (betweenTime < 60) {
            return betweenTime+"분전 | ";
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        console.log(betweenTimeHour);
        if (betweenTimeHour < 24) {
            return betweenTimeHour+"시간전 | ";
        }
		/*
        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return betweenTimeDay+"일전";
        }
        return Math.floor(betweenTimeDay / 365)+"년전";
		*/
        var time = value.substring(0, 16);
		return time+" | ";
 	}

</script>

<script type="text/javascript">

	console.log("${board.bdcategory}");
	/* 글목록 버튼 클릭 시 */
	function boardList(){
		/* 넘어온 게시판으로 다시 이동 */
		var region_all = '${board.bdrgcode}';
		if ( region_all == 'ALL'){//지역이 전국이면 전체지역게시판으로 이동
			location.href="selectRegionBoardList";
		}else{
			location.href="selectDetailBoardList?searchVal=${board.bdrgcode}";
		}
	}
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
		var bdcategory = '${board.bdrgcode}';
		location.href="updateBoardDelete?bdtype=region&bdcode="+bdcode+"&bdcategory="+bdcategory+"&bdmid="+bdmid;
	}
	
</script>

<script type="text/javascript">
	/* 댓글관련 메소드 */	

	/* 댓글등록_ajax */
	function insertReply(){
		var inputComment = $("#inputComment").val();
		console.log("글번호 : " + bdcode);
		console.log("입력댓글 : " + inputComment);
		
		if( nowRpparent == "" ){
			
			console.log("첫댓글 : " + nowRpparent);
			
		}else{
			
			console.log("대댓글 부모 : " + nowRpparent);
		}
		
		$.ajax({
			type : "get",
			url : "insertBoardReply_ajax2",
			data : { "rpbdcode" : bdcode, "rpcontents" : inputComment, "rpparent":nowRpparent},
			async : false,
			success : function(insertResult){
				if( insertResult == 2 ){
					alert("로그인 상태가 아닙니다!");
				}else{
					$("#inputComment").val("");
					selectReplyList();
					selectReplyCount();
					
				}
			}
		});
		nowRpparent == "";
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
					var rppadding = (parseInt(replyList[i].rpdepth)-1)*2;
					output += "<div class=\"row\" style='border-bottom: solid #E0E0E0 1px; padding-left:"+rppadding+"%; padding-right:0px;'>";
					
					if( replyList[i].rpstate == 2 ){//삭제된 댓글일 때
						
						output += "<div style='height:60px; line-height:60px;' >"
						output += "    <span style=\"color:gray; font-size:20px;\"> [ 삭제된 댓글입니다. ] </span>"
						output += "</div>"
						output += "</div>"
					
					}else{	//삭제된 댓글이 아닐 때 
					if( replyList[i].rpmid == loginId ){//동일한 아이디 (댓글 수정, 삭제 버튼)
						
						console.log(rppadding);
					
						//output += "<div class=\"row\" style='left:"+rppadding+";'>"
						output += "<div class=\"col-1\" style='text-align: right'>" /* 프로필영역 */
						
						if( replyList[i].rpprofile != 'nomprofile' ){//프로필 이미지가 있을 시 
			                if(replyList[i].rpdepth != 1){
			                     //답글인 경우 화살표 추가
			                     output += "<span class=\"fw-bold\" style=\"font-size:18px;\">⤷<span>";
			                   }
							if(  replyList[i].rpmstate == 9 ){//카카오 회원
								output += "<img class=\"img-profile rounded-circle rpProfile mt-1 \"  src='"+replyList[i].rpprofile + "'>"
							}else{
								output += "<img class=\"img-profile rounded-circle rpProfile mt-1 \"  src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/"+replyList[i].rpprofile + "'>"
							}
						
						}else{//프로필 이미지가 없을 시 
							if(replyList[i].rpdepth != 1){
			                     //답글인 경우 화살표 추가
			                     output += "<span class=\"fw-bold\" style=\"font-size:18px;\">⤷<span>";
			                   }
							output += "<img class=\"img-profile rounded-circle rpProfile_None mt-1 \" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png'>"
						}
						output += "</div>"
						
						output += "<div class=\"col-11\" >"
						/* 닉네임, 시간 */
						output += "<a style=\"cursor:pointer\" onclick=\"writeMemberBoard('"+replyList[i].rpnickname+"')\"><span class=\"fw-bold rpnickname\">" + replyList[i].rpnickname + "</span></a>"
						output += "<span class=\"commentDate\">&nbsp;" + replyList[i].rpdate + "</span> "
						output += "<input type=\"hidden\" value='"+replyList[i].rpmid+"'>"
						
						/* 답글쓰기 버튼 */
						if( replyList[i].rpdepth < 5){
							output += "<span id=\"rerp_writeBtn\" onclick=\"rerp_writeBtn('"+ replyList[i].rpcode +"','" + replyList[i].rpnickname +"')\" class='fw-bold' style='color: gray;'>&nbsp;&nbsp;답글쓰기</span>"
						}
						
						
						/* 수정, 삭제 버튼 */
						output += "<input type=\"button\" style=\"border:solid gray 1px\" class=\"btn-sm replyButton fw-bold mt-2\" onclick=\"rpRemoveModal('"+ replyList[i].rpcode +"','"+replyList[i].rpmid +"')\" value=\"삭제\">"
						output += "<input style=\"margin-right:5px; border:solid gray 1px\" type=\"button\" class=\"btn-sm replyButton fw-bold mt-2\" onclick=\"rpModifyModal('"+ replyList[i].rpcode +"','"+replyList[i].rpmid + "')\" value=\"수정\">"
						output += "<br>"
						
						if( '${sessionScope.loginId}' == 'admin'){
							/* 관리자 - 댓글 정지 버튼 */
							output += "<input type=\"button\" style=\"border:solid gray 1px\" class=\"btn-sm replyButton bg-secondary text-white fw-bold mt-2\" onclick=\"adminReplyStop('"+ replyList[i].rpcode +"')\" value=\"정지\">"
						}
						/* 댓글내용 */
						if( replyList[i].rpparent != null ){
							let rerp_rpcontents = replyList[i].rpcontents;
							let rerp_rpnickname = replyList[i].rpcontents.split(" ")[0];
							console.log("대댓글 닉네임 : " + rerp_rpnickname);
							let rerp_nickname_count = rerp_rpnickname.length;
							let rerp_rpcontents_trim = rerp_rpcontents.substring(rerp_nickname_count);
							console.log("대댓글 내용 : " + rerp_rpcontents_trim);
							output += "<pre style=\"resize:none;\" cols=\"90%\" class=\"inputRpcontents\" readonly> <span class='pointer' style=' color:rgb(0, 55, 107);' "
							output += "onclick='replyAt(\""+rerp_rpnickname.split('@')[1]+"\")'>" + rerp_rpnickname + " </span>";
							output += rerp_rpcontents_trim + "</pre>";
						}else{
							output += "<pre style=\"resize:none;\" cols=\"90%\" class=\"inputRpcontents\" readonly>" + replyList[i].rpcontents + "</pre>"
						}
						output += "</div>"
						
					}else{ // 로그인아이디 != 글작성자
		
						output += "<div class=\"col-1\" style='text-align:right'>" /* 프로필영역 */
						if( replyList[i].rpprofile != 'nomprofile' ){//프로필 이미지가 있을 시 
							if(replyList[i].rpdepth != 1){
			                     //답글인 경우 화살표 추가
			                     output += "<span class=\"fw-bold\" style=\"font-size:18px;\">⤷<span>";
			                   }
							if(  replyList[i].rpmstate == 9){//카카오 회원
								output += "<img class=\"img-profile rounded-circle rpProfile mt-1 \"  src='"+replyList[i].rpprofile + "'>"
							}else{
								output += "<img class=\"img-profile rounded-circle rpProfile mt-1 \"  src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/"+replyList[i].rpprofile + "'>"
							}
						}else{//프로필 이미지가 없을 시 
							output += "<img class=\"img-profile rounded-circle rpProfile_None mt-1 \" src='${pageContext.request.contextPath}/resources/img/mprofileUpLoad/profile_gray.png'>"
						}
						output += "</div>"
							
						output += "<div class=\"col-11\" >"
						/* 닉네임, 시간 */
						output += "<a style=\"cursor:pointer\" onclick=\"writeMemberBoard('"+replyList[i].rpnickname+"')\"><span class=\"fw-bold rpnickname\">" + replyList[i].rpnickname + "</span></a>"
						output += "<span class=\"commentDate\">&nbsp;" + replyList[i].rpdate + "</span> "
						output += "<input type=\"hidden\" value='"+replyList[i].rpmid+"'>"
						
						/* 답글쓰기 버튼 */
						if(  replyList[i].rpdepth < 5 ){
							output += "<span id=\"rerp_writeBtn\" onclick=\"rerp_writeBtn('"+ replyList[i].rpcode +"','" + replyList[i].rpnickname +"')\" class='fw-bold' style='color: gray;'>&nbsp;&nbsp;답글쓰기</span>"
						}
						
						/* 관리자 - 댓글 정지 버튼 */
						if( '${sessionScope.loginId}' == 'admin'){
							output += "<input type=\"button\" style=\"border:solid gray 1px\" class=\"btn-sm replyButton bg-secondary text-white fw-bold mt-2\" onclick=\"adminReplyStop('"+ replyList[i].rpcode +"')\" value=\"정지\">"
						}
						
						output += "<br>"
							
						/* 댓글내용 */
						if( replyList[i].rpparent != null ){
							let rerp_rpcontents = replyList[i].rpcontents;
							let rerp_rpnickname = replyList[i].rpcontents.split(" ")[0];
							console.log("대댓글 닉네임 : " + rerp_rpnickname);
							let rerp_nickname_count = rerp_rpnickname.length;
							let rerp_rpcontents_trim = rerp_rpcontents.substring(rerp_nickname_count);
							console.log("대댓글 내용 : " + rerp_rpcontents_trim);
							output += "<pre style=\"resize:none;\" cols=\"90%\" class=\"inputRpcontents\" readonly> <span class='pointer' style=' color:rgb(0, 55, 107);' "
							output += "onclick='replyAt(\""+rerp_rpnickname.split('@')[1]+"\")'>" + rerp_rpnickname + " </span>";
							output += rerp_rpcontents_trim + "</pre>";
						}else{
							output += "<pre style=\"resize:none;\" cols=\"90%\" class=\"inputRpcontents\" readonly>" + replyList[i].rpcontents + "</pre>"
						}						
						output += "</div>"
					}
						output += "</div>"//한줄 끝
						
				}
					}//for문 종료
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
				console.log("댓글개수 : " + replyCount);
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
	
	/* 답글쓰기 버튼 클릭 시  */
	function rerp_writeBtn(rpcode, rpnickname){
		
		$("#inputComment").val(" @" + rpnickname + " ");
		$("#inputComment").focus();
		
		nowRpparent = rpcode;
	}
</script>

<!-- 관리자용 -->
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
<script type="text/javascript">

/* Textarea 높이 자동 조절 ( 스크롤바 없애기 ) */
$("#inputReply").each(function () {
	this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
	}).on('input', function () {
	this.style.height = 'auto';
	this.style.height = (this.scrollHeight) + 'px';
	});

</script>

</html>