<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 게시판 글목록 페이지</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ include file="/resources/css/BarCss.jsp" %>
<style type="text/css">
	#board_column{
		border-bottom: solid gray 3px;
	}
	
	table{
		margin: 20px;
	}
	
	.tb{
	 border: solid 1px white;
	 color: white;
	}
 	
 	.product-title {
    text-align:center;
    display:table;
    border:1px solid #cecece;
    width:800px;
    height:600px;
	}

	.product-img-div {
    display:table-cell;
    vertical-align:middle;
	}

	.product-img {
    max-width:800px;
    max-height:600px;
	}
 	
.gallerylist {max-width:1200px;width:100%;margin:0 auto;}

.gallerylist > ul {font-size:0;}

.gallerylist > ul > li {
	display:inline-block;
	vertical-align:top;
	width:50%;
}

.gallerylist > ul > li > a {
	display:block;
	width:auto;
	text-decoration: none;
	margin:5px;
}
	
.gallerylist > ul > li > a .screen {
	position:relative;
	overflow:hidden;
	height: 400px;
}

.gallerylist > ul > li > a .screen .top {
	position:absolute;
	bottom:150%;
	left:30px;
	z-index:2;
	color:#fff;
	font-size:30px;
	font-weight:900;
	transition:all .35s;
}

.gallerylist > ul > li > a .screen .bottom {
	position:absolute;
	top:150%;
	left:30px;
	z-index:2;
	color:#fff;
	font-size:20px;
	transition:all .35s;
}

.gallerylist > ul > li > a .screen .middle {
	position:absolute;
	top:45%;
	left:30%;
	z-index:2;
	color:#fff;
	font-size:30px;
	transition:all .35s;
	opacity: 0;
}

.gallerylist > ul > li > a .screen .info {
	position:absolute;
	bottom:10%;
	left:30px;
	z-index:2;
	color:#fff;
	font-size:20px;
	font-weight:bold;
	transition:all .35s;
}

.gallerylist > ul > li > a .screen img {
	width:100%; 
	height:100%;
}

.gallerylist > ul > li > a h3 {
	font-size:14px;
	text-align:center;
	padding:20px;
	color:#666;
}
	
.gallerylist > ul > li > a .screen::after {
	content:'';
	display:block;
	position:absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:rgba(0,0,0,.5);
	z-index:1;
	opacity:0;
	transition:all .35s;
}

textarea{
	 width:100%; 
	 height:100%; 
	 resize:none; 
	 overflow-y:scroll; 
	 color:black;
	 border: none; 
}

textarea:hover{
	decoration : none;
}

.gallerylist > ul > li > a:hover .top {bottom:36%;}
.gallerylist > ul > li > a:hover .bottom {top:63%;}
.gallerylist > ul > li > a:hover .middle {color:white; opacity: 0.85;}
.gallerylist > ul > li > a:hover .screen::after {opacity:1;}
		
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (Image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image (Image Text) - Same Width as the Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
  position: absolute;
  top: 15px;
  left: 50px;
}

#modalContents{
	margin-left : auto;
	margin-right : auto;
}

/* Add Animation - Zoom in the Modal */
.modal-content, #caption {
  animation-name: zoom;
  animation-duration: 0.6s;
}

@keyframes zoom {
  from {transform:scale(0)}
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #F5FFFA;
  font-size: 50px;
  font-weight: bold;
  transition: 0.3s;
  opacity: 0.9;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}

.viewImgs{ width:800px; height:600px;}

#reply{
	height:160px; 
	width:100%; 
	color:black; 
	overflow-y:scroll;
	padding-top: 5px;
	border-bottom: solid 1px #DCDCDC;
	padding-bottom: 10px;
}

#roomContents{
	padding-top:10px;
	height:250px; 
	color:black;
	margin-bottom:5px;
	border-bottom: solid 1px #DCDCDC;
}

#replyWriteForm{
	 height:30px; 
	 color:black;
	 padding-top:10px;
	 border-top: solid 1px #DCDCDC;
}

#roomInfo{
	height:35px; 
	color:black; 
	font-size:25px; 
	position:relative;
}

#likes_Date{
	height:35px; 
	color:black; 
	font-size:25px; 
	position:relative;
	border-bottom: solid 1px #DCDCDC;
}

#replyWriteForm input{ 
	color: black;
	font-size: 15px;
	width: 330px;
}

#replyWriteForm button{
	 border:none; 
	 font-size:15px;
}

section{
	max-width: 70%;
    margin: auto;
    margin-top: 0%;
}

.d_none{display:none;}

#reply
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
				<div class="row" style="margin:auto;">
					<h1 class="text-center">자취방 자랑 목록 페이지 : RoomListPage.jsp</h1>
					<div class="col-2"></div>
					<div class="col-2" style="text-align:right;">
						<select id="searchVal" onclick="bdSearchTypeSel(this.value)">
							<option value="bdTitle">제목</option>
							<option value="bdContents">내용</option>
							<option value="bdTitleContents">제목+내용</option>
							<option value="bdNickname">작성자</option>
						</select>
					</div>
					<div class="col-6">
						
						<!-- 검색기능 -->
						<form action="searchBoard" method="get">
						<div class="input-group">
						  <input type="text" class="form-control" name="searchText" placeholder="검색 키워드를 입력하세요!">
						  <span class="input-group-btn">
						    <button class="btn btn-secondary">찾기</button>
						  </span>
						</div>
						</form>
					</div>
					<div class="col-2">
						<!-- 글쓰기 버튼 -->
						<c:if test="${sessionScope.loginId != null}">
							<button class="btn btn-primary btm-sm" onclick="location.href='${pageContext.request.contextPath }/loadTowriteRoom'">글쓰기</button>
						</c:if>
					</div>
					
				</div>
				
				<!-- 자취방 자랑글 목록 -->
				<div class="gallerylist">
					<ul>
						<c:forEach items="${roomList}" var="room">
							<li>
								<a class="" onclick="roomView_ajax('${room.bdcode}')">
									<div class="screen">
										 
										<div class="top">${room.bdtitle}</div>
										<div class="bottom">${room.bddate }</div>
										<c:choose>
											<c:when test="${room.bdimg!=null}">	
																						
												<img class="roomMainImg" alt="" src="${pageContext.request.contextPath }/resources/img/room/${room.bdimg}"> 
											</c:when>
											<c:otherwise>
																							
												<img class="roomMainImg" alt="" src="${pageContext.request.contextPath }/resources/img/logo_grey.jpg"> 									
											</c:otherwise>
										</c:choose>
										<div class="info">
											${room.bdnickname }
											 <i class="fa-solid fa-eye"></i> 
											<span id="${room.bdcode }_bdhits">
												<c:choose>
													<c:when test="${room.bdhits != 0}">${room.bdhits}</c:when>	
													<c:otherwise>&nbsp;&nbsp;</c:otherwise>
												</c:choose>
											</span>
											 <i class='fa-solid fa-heart'></i> <span id="${room.bdcode }_bdlikes">${room.bdrecommend}&nbsp;</span> 
											 <i class="fa-solid fa-comment"></i> <span id="${room.bdcode }_bdreplies">${room.bdreply}&nbsp;</span> 
											 <i class="fa-solid fa-star"></i> <span id="${room.bdcode }_bdscraps">${room.bdscrap}&nbsp;</span>
										</div> 
										
										<!-- instagram ver
										<c:choose>
											<c:when test="${room.bdimg!=null}">	
																						
												<img class="roomMainImg" alt="" src="${pageContext.request.contextPath }/resources/img/room/${room.bdimg}"> 
											</c:when>
											<c:otherwise>
																							
												<img class="roomMainImg" alt="" src="${pageContext.request.contextPath }/resources/img/logo_grey.jpg"> 									
											</c:otherwise>
										</c:choose>
										<div class="middle">
											<i class="fa-solid fa-eye"></i> 
											<span id="${room.bdcode }_bdhits">
												<c:if test="${room.bdhits != 0}">${room.bdhits}</c:if>&nbsp;
											</span>&nbsp;
											<i class='fa-solid fa-heart'></i> <span id="${room.bdcode }_bdlikes">${room.bdrecommend}&nbsp;</span>&nbsp;
											<i class="fa-solid fa-comment"></i> <span id="${room.bdcode }_bdreplies">${room.bdreply}&nbsp;</span>&nbsp; 
											<i class="fa-solid fa-star"></i> <span id="${room.bdcode }_bdscraps">${room.bdscrap}&nbsp;</span>
										</div>
										 --> 												
										
									</div>
								</a>
							</li>						
						</c:forEach>
					</ul>
				</div>		
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<!-- 자랑글 상세 모달 -->
<!-- The Modal -->
<div id="myModal" class="modal"">

  <!-- The Close Button -->
  <span class="close">&times;</span>

  <!-- Modal Content -->
  <div class="row" style="width:1200px; height:600px;" id="modalContents">
  		<div class="product-title tb col-lg-8">
  			<div id="roomimg" class="product-img-div" style="width:100%; height:100%;"></div>
  		</div>
  		<div class="tb col-lg-4" style="background-color:white; padding:10px">
 			<div class="row" style="height:32px; width:800px;" id="roomWriter">
 				<div id="roomMprofile" style="width:30px;"></div>
 				<div id="roomMnickname" style="width:372px; padding-bottom:10px;"></div>
 			</div>
 			<div id="roomContents"></div>
 			<div id="reply">
				댓글 영역 			
 			</div>
 			<div id="roomInfo">
 				추천, 스크랩, 신고
 			</div>
 			<div id="likes_date">
 				좋아요수, 날짜
 			</div>
 			<div id="replyWriteForm">
 				<input id="inputReply" type="text" placeholder="댓글 달기..." onkeydown="replyEnter(event)">
 				<button onclick='replyResister()'>게시</button>
 			</div>		
  		</div>	
  </div>
  
  <img class="modal-content" id="img01">

  <!-- Modal Caption (Image Text) -->
  <div id="caption"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	var nowBdcode;
	
	function replyEnter(e){
		if(e.keyCode==13){
			replyResister();
		}
	}

	function replyResister(){
		console.log("댓글 등록 요청");
		var rpcontents = $("#inputReply").val();
		
		$.ajax({
			type : "get",
			url : "insertBoardReply_ajax",
			data : { "bdcode" : nowBdcode, "rpcontents" : rpcontents},
			async : false,
			success : function(insertResult){
				if( insertResult > 0 ){
					console.log("뎃글 등록 성공!");
					$("#inputReply").val("");
					replyPrint();
					
					//목록 페이지 댓글수 업데이트
					logUpdate('bdreplies', 'up');
				}
			}
		});
	}
	
	//조회/추천/즐찾/댓글수 증가/감소시 목록 페이지 업데이트
	function logUpdate(logType, updown){
		
		console.log("logUpdate() 호출")
		var before = $("#"+nowBdcode+"_"+logType).text().trim();
		var after;
		if(updown == 'up'){
			//증가
			console.log("증가 요청");
			if(before==""){
				after = 1;
			} else {
				after = parseInt(before)+1;
			}
		} else {
			//감소
			console.log("감소 요청");
			after = parseInt(before)-1;
			if(after == 0){
				after = "&nbsp;";
			}

		}
		
		$("#"+nowBdcode+"_"+logType).html(after+"&nbsp;");
	}
</script>

<script type="text/javascript">
	
	function roomView_ajax(bdcode){
		console.log(bdcode+"번글 roomView() 호출");
		nowBdcode = bdcode; 
		$.ajax({
			type : "get",
			url : "selectRoomView",
			data : { "bdcode" : bdcode },
			dataType : "json",
			async : false,
			success: function(roomView){
				console.log(roomView);
				//글 이미지
				var imgHtml = "";
				
				if(roomView.bdimg=='noimg'){
					console.log('noimg');
					imgHtml += "<img alt='NumberOneLogo' style='width:800px; height:600px' src='${pageContext.request.contextPath }/resources/img/logo_grey.jpg'>";
				} else {
					console.log(roomView.bddetailimg);
					var imgs = roomView.bddetailimg.split("___");
					imgs.unshift(roomView.bdimg);
					imgs.pop();
					var numOfImgs = parseInt(imgs.length);
					console.log("이미지 개수: "+numOfImgs);
					
					imgHtml += "<div id='myCarousel' class='carousel slide' data-ride='carousel' style='width:100%; height:100%;'>";		

					//indicators
					imgHtml += "<ol class='carousel-indicators'>";
					imgHtml += "<li data-target='#myCarousel' data-slide-to='0' class='active'></li>";
					for(var i=1; i<numOfImgs; i++){
						imgHtml += "<li data-target='#myCarousel' data-slide-to='"+i+"'></li>";
					}
					imgHtml += "</ol>";
					
					//wrapper for slide
					imgHtml += "<div class='carousel-inner'>";
					imgHtml += "<div class='item active'>";
					imgHtml += "<img style='width:800px; height:600px;' class='viewImgs' src='${pageContext.request.contextPath }/resources/img/room/"+imgs[0]+"'></img>";		
					imgHtml += "</div>";
					for(var j=1; j<numOfImgs; j++){
						imgHtml += "<div class='item'>";
						imgHtml += "<img class='viewImgs' style='width:800px; height:600px;' src='${pageContext.request.contextPath }/resources/img/room/"+imgs[j]+"' ></img>";		
						imgHtml += "</div>";
					}
					imgHtml += "</div>";
					
					//left and right controls
					imgHtml += "<a class='left carousel-control' href='#myCarousel' data-slide='prev'>";	
					imgHtml += "<span class='glyphicon glyphicon-chevron-left'></span>";
					imgHtml += "<span class='sr-only'>Previous</span>"
					imgHtml += "</a>";
					imgHtml += "<a class='right carousel-control' href='#myCarousel' data-slide='next'>";	
					imgHtml += "<span class='glyphicon glyphicon-chevron-right'></span>";
					imgHtml += "<span class='sr-only'>Next</span>"
					imgHtml += "</a>";

					imgHtml += "</div>";
				
				} 
				
				$("#roomimg").html(imgHtml);
				//작성자 프로필	
				var mprofileOutput = "<img class='product-img' style='width:30px; height:30px; border-radius:50%;'";
				if(roomView.bdmprofile != 'nomprofile'){
					console.log()
					mprofileOutput += "src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/"+roomView.bdmprofile+"'>";
				} else {
					mprofileOutput += "src='${pageContext.request.contextPath }/resources/img/logo_beige.jpg'>"; 
				}
				mprofileOutput += "</img>";
				$("#roomMprofile").html(mprofileOutput);
				$("#roomMnickname").html("<div id='mnickname' style='font-size:22px; margin-left:5px; padding-bottom:2px; color: black;'>"+roomView.bdnickname+"</div>");
				//글 내용
				$("#roomContents").html("<textarea style='font-size:15px;' readonly>"+roomView.bdcontents+"</textarea>");
				//추천, 스크랩, 신고 출력
				var roomInfoOutput = ""
				//추천
				if(roomView.rchistory != "n"){
					console.log("추천 기록 있음")
					roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"rchistory\")'><span id='"+roomView.bdcode+"_rchistory'><i class='fa-solid fa-heart'></i></span></a> ";
				} else {					
					console.log("추천 기록 없음")
					roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"rchistory\")'><span id='"+roomView.bdcode+"_rchistory'><i class='fa-regular fa-heart'></i></span></a> ";
				}
				//스크랩
				if(roomView.schistory != "n"){
					console.log("스크랩 기록 있음")
					roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"schistory\")'><span id='"+roomView.bdcode+"_schistory'><i class='fa-solid fa-star' style=''></i></span></a> ";
				} else {					
					console.log("스크랩 기록 없음")
					roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"schistory\")'><span id='"+roomView.bdcode+"_schistory'><i class='fa-regular fa-star'></i></span></a> ";
				}
				//신고
				if(roomView.bdmid == '${sessionScope.loginId}'){
					console.log("글 작성자");
					roomInfoOutput += "<span style='position:absolute; right:0;'><button style='font-size:12px; border:none;'>수정</button>&nbsp;";
					roomInfoOutput += "<button onclick='deleteRoomView(\""+bdcode+"\")' style='font-size:12px; border:none;'>삭제</button></span>";
					
				} else {
					if(roomView.wbhistory != "n"){
						console.log("신고 기록 있음")
						roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"wbhistory\")'><span id='"+roomView.bdcode+"_wbhistory'><i class='fa-solid fa-dove' style='position:absolute; right:0;'></i></span></a> ";
					} else {					
						console.log("신고 기록 없음")
						roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"wbhistory\")'><span id='"+roomView.bdcode+"_wbhistory'><i class='fa-solid fa-land-mine-on' style='position:absolute; right:0;'></i></span></a> ";
					}	
				}
				//console.log(roomInfoOutput);
				$("#roomInfo").html(roomInfoOutput);
				
				//좋아요수, 날짜 출력
				var likesDateOutput = "<span style='color:black; font-size:18px; font-weight:bold;'>좋아요&nbsp;<span id='likesNum'>"+roomView.bdrecommend+"</span>개</span><br>";
				likesDateOutput += "<span style='color:grey; font-size:15px;'>"+roomView.bddate+"</span>"
				$("#likes_date").html(likesDateOutput);
				
				//댓글 출력
				replyPrint();
				
				//bdhits 1 추가
				logUpdate('bdhits', 'up');
				
				modal.style.display = "block";
				//modalImg.src = this.src;
				//captionText.innerHTML = this.alt;
			}
		});
	}
	
	
	// Get the modal
	var modal = document.getElementById("myModal");

	// Get the image and insert it inside the modal - use its "alt" text as a caption
	var img = document.getElementById("myImg");
	var modalImg = document.getElementById("img01");
	var captionText = document.getElementById("caption");


	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";

	  //모달창 비우기
	  $("#roomMprofile").html("");
	  $("#roomMnickname").html("");
	  $("#roomContents").html("");
	  $("#reply").html("");
	  $("#reply").html("");
	  nowBdcode = "";
	  
	}
	
	function log(bdcode, history){
		console.log("log 함수 호출");
		if(history == 'rchistory'){
			console.log("자랑글 추천 요청");		
		} else if(history == 'schistory'){
			console.log("자랑글 스크랩 요청");					
		} else {
			console.log("자랑글 신고 요청");								
		}
			
		if('${sessionScope.loginId}'==''){
			var confirmResult = confirm("로그인 후 이용가능합니다."); 
			console.log(confirmResult);
			if(confirmResult==true){
				location.href = '${pageContext.request.contextPath }/loadToLogin?afterUrl=selectRoomList';
				return;
			} else {
				return;
			}
		}
		
		var currentState="";
		$.ajax({
			type : "get",
			url : "currentHistory",
			data : { "bdcode" : bdcode, "history": history},
			//dataType : "json",
			async : false,
			success: function(result){
				console.log(result);
				currentState = result;				
			}
		});
		
		console.log(bdcode+"의 현재 상태: "+currentState)
		$.ajax({
			type : "get",
			url : "updateLog",
			data : { "bdcode" : bdcode, "history": history, "currentState":currentState},
			//dataType : "json",
			async : false,
			success: function(result){
				//console.log(result);
				if(result == '1'){ //업데이트 성공시
					if(currentState == '0'){ //성공
						if(history == 'rchistory'){
							console.log("추천 성공");
							
							//modal 안 좋아요수 업데이트
							var modalLikeNum = $("#likesNum").text().trim();
							if(modalLikeNum == ""){
								modalLikeNum = 1;
							} else {
								modalLikeNum = parseInt(modalLikeNum)+1;
							}
							$("#likesNum").text(modalLikeNum);
							
							//아이콘 꽉찬 하트로 변경
							$("#"+bdcode+"_rchistory").html("<i class='fa-solid fa-heart'></i>");
							
							//bdlikes +1 
							logUpdate('bdlikes', 'up');
							
						} else if(history == 'schistory'){
							console.log("스크랩 성공");
							$("#"+bdcode+"_schistory").html("<i class='fa-solid fa-star'></i>");
							
							//bdscraps +1 
							logUpdate('bdscraps', 'up');

						} else {
							console.log("신고 성공");
							$("#"+bdcode+"_wbhistory").html("<i class='fa-solid fa-dove' style='position:absolute; right:0;'></i>");
						}

					
					} else { //취소 성공
						if(history == 'rchistory'){
							console.log("추천 취소 성공");
							
							//modal 안 좋아요수 업데이트
							var modalLikeNum = $("#likesNum").text().trim();
							modalLikeNum = parseInt(modalLikeNum)-1;
							$("#likesNum").text(modalLikeNum);
							
							//아이콘 빈 하트로 변경
							$("#"+bdcode+"_rchistory").html("<i class='fa-regular fa-heart'></i>");		

							//bdlikes -1 
							logUpdate('bdlikes', 'down');

							
						} else if(history == 'schistory'){
							console.log("스크랩 취소 성공");
							$("#"+bdcode+"_schistory").html("<i class='fa-regular fa-star'></i>");
							
							//bdscraps -1 
							logUpdate('bdscraps', 'down');
						
						} else {
							console.log("신고 취소 성공");
							$("#"+bdcode+"_wbhistory").html("<i class='fa-solid fa-land-mine-on' style='position:absolute; right:0;'></i>");				
						}						
					}	
				}	
			}
		});		
	}
	
	function deleteRoomView(bdcode){
		console.log(bdcode+"글 삭제 요청");
		var confirmCh = confirm("해당 글을 삭제하시겠습니까?");
		if(confirmCh == false){
			return;
		} 
		
		location.href = "updateBoardDelete?bdcode="+bdcode+"&bdcategory=자랑";

	}
	
	//댓글 출력
	function replyPrint(){
		$.ajax({
			type : "get",
			url : "selectBoardReplyList_ajax",
			data : { "bdcode" : nowBdcode },
			dataType : "json",
			async : false,
			success: function(replys){
				//console.log(replys)
				var replyOutput ="";
				for(var i=0; i<replys.length; i++){			
					//console.log(replys[i]);
					replyOutput += "<div id='reply_"+replys[i].rpcode+"' class='row' onmouseover='toggleReplyMenu(\""+replys[i].rpcode+"\", \"show\")' onmouseout='toggleReplyMenu(\""+replys[i].rpcode+"\", \"hide\")' onstyle='width:100%'>";
					//댓글 작성자 프로필 이미지
					replyOutput += "<div style='width:30px;'>";
					replyOutput += "<img class='product-img' style='width:20px; height:20px; border-radius:50%;'";
					if(replys[i].rpmprofile != 'nomprofile'){
						console.log("프로필 있음")
						replyOutput += "src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/"+replys[i].rpmprofile+"'>";
					} else {
						replyOutput += "src='${pageContext.request.contextPath }/resources/img/logo_beige.jpg'>"; 
					}
					replyOutput += "</img></div>";
					//댓글 내용 부분 시작
					replyOutput += "<div style='width:320px; font-size:15px'>"; 
					//닉네임(진하게)
					replyOutput += "<span style='font-weight:600;'>"+replys[i].rpnickname+"&nbsp;&nbsp;</span>";
					//내용 
					replyOutput += replys[i].rpcontents;
					
					//댓글 작성자에게만 보이는 ...
					if(replys[i].rpmid == '${sessionScope.loginId}'){
						console.log("댓글 작성자");
						replyOutput += "&nbsp;&nbsp;<span id='"+replys[i].rpcode+"_replyMenu' class='rpWriter d_none' onclick='rpdeleteModal(\""+replys[i].rpcode+"\")' style='font-size:15px;'>&#8943;</span>"; 
					}
					
					
					replyOutput += "</div></div>";
				}
				
				//console.log(replyOutput);
				$("#reply").html(replyOutput);
				$("#reply").scrollTop($("#reply")[0].scrollHeight);
			}
		})
	}
	
	function toggleReplyMenu(rpcode, action){
		console.log("댓글 메뉴 보여주기 요청");
		if(action=='show'){
			$("#"+rpcode+"_replyMenu").css("cursor", "pointer");
			$("#"+rpcode+"_replyMenu").removeClass("d_none");
		} else {
			$("#"+rpcode+"_replyMenu").addClass("d_none");			
		}
		
	}
	
	function rpdeleteModal(rpcode){
		console.log("댓글 삭제 모달 요청");
	}

</script>

</html>