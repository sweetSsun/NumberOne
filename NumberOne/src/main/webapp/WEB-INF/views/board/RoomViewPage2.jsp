<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 자취방 자랑게시판2</title>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css"> --%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%-- <%@ include file="/resources/css/BarCss.jsp"%> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">  --%>

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
 	
.gallerylist { 
	max-width:1200px;
	width:100%;
	margin: 2em auto;
}

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
	padding-right: 20px; 
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

#roomContents > div {
	 width:100%; 
	 height:86%; 
	 overflow-y:scroll; 
	 color:black;
	 border: none;
	 padding-right:6px; 
}
#roomContents > textarea:focus { 
	outline: none; 
}
textarea.rvcontents :focus { 
	outline: none; 
	background-color: black;
}

.gallerylist > ul > li > a:hover .top {bottom:36%;}
.gallerylist > ul > li > a:hover .bottom {top:63%;}
.gallerylist > ul > li > a:hover .middle {color:white; opacity: 0.85;}
.gallerylist > ul > li > a:hover .screen::after {opacity:1;}
		
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  z-index:1
  position: fixed; /* Stay in place */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.7); /* Black w/ opacity */
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
	margin-top : 1em;
	margin-bottom : 2em;
	margin-left : auto;
	margin-right : auto;
}

#menuInnerDiv{
	position : absolute;
	top : 45%;
    left : 38%;
	width : 24%; 
	background-color : white;
	border-radius : 10px;
}

div.menu{
	text-align:center;
	font-size : 16px;
	padding : 10px;
	cursor : pointer;
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

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}

.viewImgs{ 
	width:800px; 
	height:600px;
	object-fit: contain;
	
  	background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

#reply{
	height:160px; 
	width:100%; 
	color:black; 
	overflow-y:scroll;
	padding-top: 5px;
	border-bottom: solid 1px #DCDCDC;
	padding-bottom: 10px;
	resize:none;
}

#roomContents{
	padding-top:10px;
	height:220px; 
	color:black;
	margin-bottom:5px;
	border-bottom: solid 1px #DCDCDC;
}

#replyWriteForm{
	 height:80px; 
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

.scroll::-webkit-scrollbar  {
    width: 10px;  /* 스크롤바의 너비 */
    cursor: default;
}

.scroll::-webkit-scrollbar-thumb {
    height: 5%; /* 스크롤바의 길이 */
    background:  #999999; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

.scroll::-webkit-scrollbar-track {
    background: #EAEAEA;  /*스크롤바 뒷 배경 색상*/
}

#inputReply{
	height : 100px;
	width : 100%;
	resize : none;
	padding-top:0;
	margin-top:0;
	border : 1px solid #DCDCDC;
	font-size : 15px; 
}

#replyWriteForm > button{
	background-color:#00bcd4;
	color:white;
	font-weight:600;
	font-size:initial;
}
.pointer { cursor : pointer; }

.pointer:hover{
	color: #00bcd4;
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
		<c:choose>
			<c:when test="${sessionScope.loginId.equals(\"admin\") }">
				<%@ include file="/WEB-INF/views/includes/SideBar_Admin.jsp" %>				
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
			</c:otherwise>
		</c:choose>
		
		<section>
		<!-- 본문 -->
			<div class="container" style="width:1220px !important;">
					<!-- 페이지명 -->
					<div class="checkout__form pointer" style="margin-top: 30px;" onclick="location.href='selectRoomList'">
						자취방 자랑게시판
					</div> 
				
				<div class="row" style="margin:auto;">				
					<div class="col-11"></div>
					<div class="col-1">
						<!-- 글쓰기 버튼 -->
						<c:if test="${sessionScope.loginId != null}">
							<button class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath }/loadToWriteRoom'">글쓰기</button>
						</c:if>
					</div>
					
				</div>
				
				<!-- 자취방 상세보기 -->
				<div class="row" style="width:1210px; height:610px; border:1px solid #DCDCDC" id="modalContents">
					<!-- 자취방 상세 이미지(슬라이드) -->
  					<div class="product-title tb col-lg-8">
  						<div id="roomimg" class="product-img-div" style="width:100%; height:100%;"></div>
  					</div>
  					<!-- 내용 -->
  					<div class="tb col-lg-4" style="background-color:white; padding:10px">
 						<!-- 작성자 프로핖 -->
 						<div class="row" style="height:32px; width:800px;" id="roomWriter">
 							<!-- 작성자 프로필 사진 -->
 							<div id="roomMprofile" style="width:30px;"></div>
 							<!-- 작성자 닉네임 -->
 							<div id="roomMnickname" style="width:372px; padding-bottom:10px;"></div>
 						</div>
 						<!-- 작성글 -->
 						<div id="roomContents"></div>
 						<!-- 댓글 -->
 						<div id="reply" class="scroll"></div>
 						<!-- 추천, 스크랩, 신고 여부 출력-->
 						<div id="roomInfo"></div>
 						<!-- 좋아요수-->
 						<div id="likes_date"></div>
 					
 						<!-- 댓글 입력 폼 -->
 						<div id="replyWriteForm" class="row">	
 							<!-- 댓글 입력 영역 -->
 							<c:choose>
 								<c:when test="${sessionScope.loginId != null }">
		 							<textarea class="scroll" id="inputReply" placeholder="댓글 달기..." style="height:60px;" onkeydown="replyEnter(event)"></textarea>&nbsp;&nbsp;
		 							<button onclick='replyResister()'>게시</button>
			 					</c:when>
 								<c:otherwise>
		 							<textarea class="scroll" id="inputReply" type="text" readonly="readonly" placeholder="로그인 후 이용 가능합니다" style="height:60px;"></textarea>&nbsp;&nbsp;
		 							<button onclick='replyResister()' disabled="disabled">게시</button>
 								</c:otherwise>
 							</c:choose>	
 							
 						</div>		
  					</div>	
  				</div>
				
				<hr style="height:2px; margin-bottom:3rem;">
				
				<div class="row sellbuyhead">
					<div class="col mb-2" style="padding-top:0.2rem;">
						<h3 style="font-size:2.3rem; font-weight:700; color:#00bcd4;">자취방 자랑 - 최신글</h3>
					</div>
					<div align="right" class="col" style="padding-top:0.45rem;">
						<span style="font-size:1.6rem;"> <a href="selectRoomList" style="color:initial !important; font-weight:bold;"><i class="fa-solid fa-square-plus"></i>&nbsp;&nbsp;더보기</a></span>
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

<!-- 메뉴 모달 -->
<!-- The Modal -->
<div id="menuModal" class="modal">

  <!-- Modal Content -->
  <div id="menuInnerDiv">  
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 
</body>


<script type="text/javascript">

//관리자 스크립트
function adminRvBan(){
	console.log("관리자 자랑글 정지")
	
	var rvBanConfirm = confirm("해당 글을 정지하시겠습니까?");
	
	if(rvBanConfirm == 'false'){
		$("#menuModal").css("display", "none");
		return false;
	}
	
	$.ajax({
			type : "get",
			url : "admin_updateRoomStop_ajax",
			data : { "bdcode" : nowBdcode},
			async : false,
			success : function(updateResult){
				if( updateResult > 0 ){
					console.log("관리자 자랑글 정지 성공!");
					//일단 목록 페이지 다시 로드
					location.href = "${pageContext.request.contextPath }/selectRoomList";
				}
			}
		});
	
	//메뉴창 닫기
	$("#menuModal").css("display", "none");
}

function adminRpBan(){
	console.log("관리자 댓글 정지")
	var rpBanConfirm = confirm("해당 댓글을 정지하시겠습니까?");
	
	if(rpBanConfirm == 'false'){
		$("#menuModal").css("display", "none");
		return false;
	}
	
	$.ajax({
			type : "get",
			url : "admin_updateReplyStop_ajax",
			data : { "rpcode" : nowRpcode},
			async : false,
			success : function(updateResult){
				if( updateResult > 0 ){
					console.log("관리자 댓글 정지 성공!");
					replyPrint('top');
					
					//목록 페이지 댓글수 업데이트 (-1)
					logUpdate('bdreplies', 'down');
					
					//메뉴 모달 닫기
					closeMenuModal()
				}
			}
		});	
}
</script>

<script type="text/javascript">
console.log("roomViewPage 접속!");
nowBdcode = ('${bdcode}');
roomView_ajax(nowBdcode)

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
				//console.log(roomView);
				//글작성자 아이디 필드에 저장
				nowBdmid = roomView.bdmid;
				//글 이미지
				var imgHtml = "";
				
				if(roomView.bdimg=='noimg'){
					console.log('noimg');
					imgHtml += "<img alt='NumberOneLogo' style='width:800px; height:600px max-width:800px;' src='${pageContext.request.contextPath }/resources/img/logo_grey.jpg'>";
				} else {
					//console.log(roomView.bddetailimg);
					var imgs = roomView.bddetailimg.split("___");
					imgs.unshift(roomView.bdimg);
					imgs.pop();
					var numOfImgs = parseInt(imgs.length);
					//console.log("이미지 개수: "+numOfImgs);
					
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
					imgHtml += "<img style='width:100%; height:600px; max-width:100%' class='viewImgs' src='${pageContext.request.contextPath }/resources/img/room/"+imgs[0]+"'></img>";		
					imgHtml += "</div>";
					for(var j=1; j<numOfImgs; j++){
						imgHtml += "<div class='item'>";
						imgHtml += "<img class='viewImgs' style='width:100%; height:600px; max-width:100%' src='${pageContext.request.contextPath }/resources/img/room/"+imgs[j]+"' ></img>";		
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
					console.log("작성자 프로필 있음");
					if(roomView.bdmid.substring(0,1) == "@"){
						//카카오 로그인
						console.log("작성자 카카오 회원 사진 출력")
						mprofileOutput += "src='"+roomView.bdmprofile+"'>";							
					} else {
						//일반 로그인
						console.log("작성자 일반 회원 사진 출력")
						mprofileOutput += "src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/"+roomView.bdmprofile+"'>";
					}
				} else {
					mprofileOutput += "src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png'>"; 
				}
				mprofileOutput += "</img>";
				$("#roomMprofile").html(mprofileOutput);
				mnicknameOutput = "<div id='mnickname' style='font-size:18px; font-weight:bold; margin-left:8px; padding-bottom:2px; color: black;'>";
				mnicknameOutput += "<span onclick='writeMemberBoard(\""+roomView.bdnickname+"\")' class='pointer'>"+roomView.bdnickname+"</span>";
	
				//메뉴 출력 할 수 있는 ...
				//로그인 아이디에 따라 메뉴는 다르게 출력됨 
				mnicknameOutput += "<span  style='position:absolute; right:20px; cursor:pointer;' onclick='menuModal(\""+nowBdcode+"\", \""+nowBdmid+"\")' style='font-size:15px; color:black; padding-rignt:10px;'>&#8943;</span>";
				mnicknameOutput += "</div>";
				$("#roomMnickname").html(mnicknameOutput);

				//글 내용
				//var roomContentsOutput = "<textarea class='scroll' readonly style='font-size:15px; resize:none;'>"+roomView.bdcontents+"</textarea>";
				var roomViewContents = roomView.bdcontents.replaceAll(" ", "&nbsp;");
				roomViewContents = roomViewContents.replaceAll("\n", "<br>");
				var roomContentsOutput = "<div class='scroll' readonly style='font-size:15px; resize:none;'>"+roomViewContents+"</div>";
				
				//시간 출력
				roomContentsOutput += "<span style='font-size:15px; color:gray; margin:0px;' title='"+roomView.bddate+"'>";
				roomContentsOutput += timeForToday(roomView.bddate)+"</span>";
				$("#roomContents").html(roomContentsOutput);
				//$("#roomContents").html("<textarea class='scroll' readonly style='font-size:15px; resize:none;'>"+roomView.bdcontents+"</textarea>");
				
				//추천, 스크랩, 신고 출력
				var roomInfoOutput = ""
				//추천
				if(roomView.rchistory != "n"){
					console.log("추천 기록 있음")
					roomInfoOutput += "<a onclick='log(\"rchistory\")' style='cursor:pointer;'><span id='"+roomView.bdcode+"_rchistory'><i class='fa-solid fa-heart'></i></span></a> ";
				} else {					
					console.log("추천 기록 없음")
					roomInfoOutput += "<a onclick='log(\"rchistory\")' style='cursor:pointer;'><span id='"+roomView.bdcode+"_rchistory'><i class='fa-regular fa-heart'></i></span></a> ";
				}
				//스크랩
				if(roomView.schistory != "n"){
					console.log("스크랩 기록 있음")
					roomInfoOutput += "<a onclick='log(\"schistory\")' style='cursor:pointer;'><span id='"+roomView.bdcode+"_schistory'><i class='fa-solid fa-star' style=''></i></span></a> ";
				} else {					
					console.log("스크랩 기록 없음")
					roomInfoOutput += "<a onclick='log(\"schistory\")' style='cursor:pointer;'><span id='"+roomView.bdcode+"_schistory'><i class='fa-regular fa-star'></i></span></a> ";
				}
				//신고
				roomInfoOutput += "<span id='"+roomView.bdcode+"_wbhistory'>";
				if(roomView.wbhistory != "n"){
					console.log("신고 기록 있음")
					roomInfoOutput += "<i class='fa-solid fa-land-mine-on' style='position:absolute; right:0;'></i>";
					nowWb = "y";
				}	
				roomInfoOutput += "</span>";
				//console.log(roomInfoOutput);
				$("#roomInfo").html(roomInfoOutput);
				
				//좋아요수, 날짜 출력
				var likesDateOutput = "<span style='color:black; font-size:18px; font-weight:bold;'>좋아요&nbsp;<span id='likesNum'>"+roomView.bdrecommend+"</span>개</span><br>";
				//likesDateOutput += "<span style='color:grey; font-size:15px;'>"+roomView.bddate+"</span>"
				$("#likes_date").html(likesDateOutput);
				
				//댓글 출력
				replyPrint('top');
				
				//bdhits 1 추가
				logUpdate('bdhits', 'up');
				
				//scroll 최상담으로 이동
				$('html, body').animate({scrollTop:0}, 10);	
			}
		});
		
		
	}

	//시간 함수
	function timeForToday(value) {
		console.log("시간 변경 함수 호출")
	
    	var today = new Date();
    	var timeValue = new Date(value);

    	var betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    	if (betweenTime < 1) return "방금전";
    	if (betweenTime < 60) {
    		return betweenTime+"분전";
    	}

    	var betweenTimeHour = Math.floor(betweenTime / 60);
    	if (betweenTimeHour < 24) {
        	return betweenTimeHour+"시간전";
    	}
	
    	var betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    	if (betweenTimeDay < 365) {
        	return betweenTimeDay+"일전";
    	}
    	return Math.floor(betweenTimeDay / 365)+"년전";
	
		return value;
	}
	
	
	//댓글 출력
	function replyPrint(scroll){
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
					replyOutput += "<div id='reply_"+replys[i].rpcode+"' style='width:100%; margin-bottom:3px;' class='row' onmouseover='toggleReplyMenu(\""+replys[i].rpcode+"\", \"show\")' onmouseout='toggleReplyMenu(\""+replys[i].rpcode+"\", \"hide\")'>";
					
					if(replys[i].rpstate == 2){ //state == 1 댓글 출력 내용
						//[삭제된 댓글입니다.] 출력
						replyOutput += "<div style='font-size:15px; color:grey; margin:0px;'>[삭제된 댓글입니다.]</div>"
						
					} else { //state == 2 댓글 출력 내용
					
						//댓글 작성자 프로필 이미지
						replyOutput += "<div style='width:30px;'>";
						replyOutput += "<img class='product-img' style='width:20px; height:20px; border-radius:50%; margin-top:10px;'";
						if(replys[i].rpprofile != 'nomprofile'){
							console.log("프로필 있음")
							if(replys[i].rpmid.substring(0, 1) == "@"){
								//카카오 로그인
								replyOutput += "src='"+replys[i].rpprofile+"'>";							
							} else {
								//일반 로그인
								replyOutput += "src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/"+replys[i].rpprofile+"'>";
							}
						} else {
							replyOutput += "src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png'>"; 
						}
						replyOutput += "</img></div>";
					
						//댓글 내용 부분 시작
						replyOutput += "<div id='replyContents_"+replys[i].rpcode+"' style='width:320px; font-size:15px; padding-top:0px; word-break:break-word;'>"; 
					
						//닉네임(진하게)
						replyOutput += "<span onclick='writeMemberBoard(\""+replys[i].rpnickname+"\")' class='pointer' style='font-weight:600; margin:0px;'>"+replys[i].rpnickname+"&nbsp;&nbsp;</span>";
					
						//내용
						var reply_transform = replys[i].rpcontents.replaceAll(' ', '&nbsp;');
						reply_transform = reply_transform.replaceAll('\n', '<br>');
						//console.log(reply_transform);
						//replyOutput += replys[i].rpcontents+"<br>";
						replyOutput += reply_transform+"<br>";
					
						//댓글 작성 시간
						replyOutput += "<span style='font-size:10px; color:grey; margin:0px;'>"+replys[i].rpdate+"</span>";
					
						//댓글 작성자와 관리자에게만 보이는 ...
						if(replys[i].rpmid == '${sessionScope.loginId}'){
							console.log("댓글 작성자");
							replyOutput += "&nbsp;&nbsp;<span id='"+replys[i].rpcode+"_replyMenu' class='rpWriter d_none' onclick='menuModal(\""+replys[i].rpcode+"\", \""+replys[i].rpmid+"\")' style='font-size:15px;'>&#8943;</span>"; 
						} else if ('${sessionScope.loginId}'=='admin'){
							console.log("관리자");
							replyOutput += "&nbsp;&nbsp;<span id='"+replys[i].rpcode+"_replyMenu' class='rpWriter d_none' onclick='menuModal(\""+replys[i].rpcode+"\", \""+replys[i].rpmid+"\")' style='font-size:15px;'>&#8943;</span>"; 	
						}
						replyOutput += "</div>";
						
					} //state == 2 댓글 출력 내용 끝
					
					replyOutput += "</div>";
				}
			
				//console.log(replyOutput);
				$("#reply").html(replyOutput);

				if(scroll == "bottom"){
					//댓글 등록시 스크롤 하단으로 이동
					//console.log("하단 요청")
					$("#reply").scrollTop($("#reply")[0].scrollHeight);
				} else if(scroll=="top"){
					//console.log("상단 요청")
					$("#reply").scrollTop(0);
				}
			}
		})
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
	var nowBdcode;
	var nowRpcode;
	var nowBdmid;
	var nowRpmid;
	var nowWb;
	
	function replyEnter(e){
		if(e.keyCode==13 && !e.shiftKey){
			e.preventDefault();
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
					console.log("댓글 등록 성공!");
					$("#inputReply").val("");
					replyPrint('bottom');
					
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
	
	
	function closeMenuModal(){
		console.log("메뉴 모달 닫기 요청");
		//nowRpcode 초기화
		nowRpcode = "";
		nowRpmid = "";
		//모달창 닫기
		$("#menuModal").css("display", "none");
	}
	
	function replyDelete(){
		console.log("댓글 삭제 요청");
		console.log('${sessionScope.loginId}');
		console.log(nowRpmid);
		if(nowRpmid != '${sessionScope.loginId}'){
			alert("script-작성자가 아닙니다");
			return;
		}
		
			
		$.ajax({
			type : "get",
			url : "updateReplyState_ajax2",
			data : { "rpcode" : nowRpcode, "rpmid":nowRpmid},
			async : false,
			success : function(updateResult){
				if( updateResult == 1 ){
					console.log("댓글 삭제 성공!");
					alert("댓글이 삭제되었습니다");
					replyPrint('top');
					
					//목록 페이지 댓글수 업데이트 (-1)
					logUpdate('bdreplies', 'down');
					
					//메뉴 모달 닫기
					closeMenuModal()
				} else if (updateResult == 2){
					console.log("댓글 작성자가 아님!");
					alert("작성자가 아닙니다");
					return;
				} 
			}
		});	
	}

</script>

<script type="text/javascript">
	
	function log(history){
		console.log("log 함수 호출");
		if(history == 'rchistory'){
			console.log("자랑글 추천 요청");		
		} else if(history == 'schistory'){
			console.log("자랑글 스크랩 요청");					
		} else {
			console.log("자랑글 신고 요청");								
		}
			
		if('${sessionScope.loginId}'==''){
			var confirmResult = confirm("script-로그인 후 이용가능합니다"); 
			console.log(confirmResult);
			if(confirmResult==true){
				location.href = '${pageContext.request.contextPath }/loadToLogin?afterUrl=selectRoomListbdcode='+nowBdcode;
				return;
			} else {
				return;
			}
		}
		
		var currentState="";
		$.ajax({
			type : "get",
			url : "currentHistory",
			data : { "bdcode" : nowBdcode, "history": history},
			//dataType : "json",
			async : false,
			success: function(result){
				console.log(result);
				
				if(result == "2"){
					var confirmResult = confirm("로그인 후 이용가능합니다"); 
					console.log(confirmResult);
					if(confirmResult==true){
						location.href = '${pageContext.request.contextPath }/loadToLogin?afterUrl=selectRoomList?bdcode='+nowBdcode;
						return;
					} else {
						return;
					}
				}
				
				currentState = result;				
			}
		});
		
		console.log(nowBdcode+"의 현재 상태: "+currentState)
		$.ajax({
			type : "get",
			url : "updateLog",
			data : { "bdcode" : nowBdcode, "history": history, "currentState":currentState},
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
							$("#"+nowBdcode+"_rchistory").html("<i class='fa-solid fa-heart'></i>");
							
							//bdlikes +1 
							logUpdate('bdlikes', 'up');
							
						} else if(history == 'schistory'){
							console.log("스크랩 성공");
							$("#"+nowBdcode+"_schistory").html("<i class='fa-solid fa-star'></i>");
							
							//bdscraps +1 
							logUpdate('bdscraps', 'up');

						} else {
							console.log("신고 성공");
							$("#"+nowBdcode+"_wbhistory").html("<i class='fa-solid fa-land-mine-on' style='position:absolute; right:0;'></i>");
							nowWb = 'y';
							$("#menuModal").css("display", "none");
						 	alert("신고가 접수되었습니다");
						}

					
					} else { //취소 성공
						if(history == 'rchistory'){
							console.log("추천 취소 성공");
							
							//modal 안 좋아요수 업데이트
							var modalLikeNum = $("#likesNum").text().trim();
							modalLikeNum = parseInt(modalLikeNum)-1;
							$("#likesNum").text(modalLikeNum);
							
							//아이콘 빈 하트로 변경
							$("#"+nowBdcode+"_rchistory").html("<i class='fa-regular fa-heart'></i>");		

							//bdlikes -1 
							logUpdate('bdlikes', 'down');

							
						} else if(history == 'schistory'){
							console.log("스크랩 취소 성공");
							$("#"+nowBdcode+"_schistory").html("<i class='fa-regular fa-star'></i>");
							
							//bdscraps -1 
							logUpdate('bdscraps', 'down');
						
						} else {
							console.log("신고 취소 성공");
							$("#"+nowBdcode+"_wbhistory").html("");	
							nowWb = 'n';
							$("#menuModal").css("display", "none");
							alert("신고가 취소되었습니다");
						}						
					}	
				}	
			}
		});		
	}
	
	function deleteRoomView(){
		console.log(nowBdcode+"글 삭제 요청");
		
		console.log('${sessionScope.loginId}');
		console.log(nowBdmid);
		if(nowBdmid != '${sessionScope.loginId}'){
			alert("script-작성자가 아닙니다");
			return;
		}
		
		var confirmCh = confirm("해당 글을 삭제하시겠습니까?");
		if(confirmCh == false){
			return;
		} 
		
		location.href = "updateBoardDelete?bdcode="+nowBdcode+"&bdcategory=자랑&bdmid="+nowBdmid;
	}
	
	
	function toggleReplyMenu(rpcode, action){
		//console.log("댓글 ... 보여주기 요청");
		if(action=='show'){
			$("#"+rpcode+"_replyMenu").css("cursor", "pointer");
			$("#"+rpcode+"_replyMenu").removeClass("d_none");
		} else {
			$("#"+rpcode+"_replyMenu").addClass("d_none");			
		}
		
	}
	
	function menuModal(objcode, writer){
		console.log("메뉴 모달 요청");
		console.log(objcode);
		var objType = objcode.substring(0, 2);
		console.log(objType);
		var menuOutput = "";
		if(objType=='BD'){
			console.log("자랑글(Rv) 메뉴 요청")
			//아이디에 따라 다른 메뉴 구성
			if('${sessionScope.loginId}' == 'admin'){
				//관리자:정지/취소
				menuOutput += "<div class='menu' style='border-bottom: solid 1px #DCDCDC; color:#FF4956;' onclick='adminRvBan()'>정지</div>";
				menuOutput += "<div class='menu' onclick='closeMenuModal()'>취소</div>";
			} else if('${sessionScope.loginId}' == writer){ 
				//글작성자:수정/삭제/취소
				menuOutput += "<div class='menu' style='border-bottom: solid 1px #DCDCDC; color:#FF4956;' onclick='modifyRoomView()'>수정</div>";
				menuOutput += "<div class='menu' style='border-bottom: solid 1px #DCDCDC; color:#FF4956;' onclick='deleteRoomView()'>삭제</div>";
				menuOutput += "<div class='menu' onclick='closeMenuModal()'>취소</div>";
			} else {
				//다른 회원:신고/취소
				if(nowWb == 'y'){
					menuOutput += "<div class='menu' style='border-bottom: solid 1px #DCDCDC; color:#FF4956;' onclick='log(\"wbhistory\")'>신고 취소</div>";					
				} else {					
					menuOutput += "<div class='menu' style='border-bottom: solid 1px #DCDCDC; color:#FF4956;' onclick='log(\"wbhistory\")'>신고</div>";
				}
				menuOutput += "<div class='menu' onclick='closeMenuModal()'>취소</div>";			
			}
		} else {
			console.log("댓글(Rp) 메뉴 요청")
			nowRpcode = objcode;
			nowRpmid = writer;
			//console.log(writer);
			if('${sessionScope.loginId}' == 'admin'){ //관리자
				//console.log("관리자");
				menuOutput += "<div class='menu' style='border-bottom: solid 1px #DCDCDC; color:#FF4956;' onclick='adminRpBan()'>정지</div>";
				menuOutput += "<div class='menu' onclick='closeMenuModal()'>취소</div>";
			} else if ('${sessionScope.loginId}' == nowRpmid){ //댓글작성자
				//console.log("작성자");
				//console.log("작성자");
				menuOutput += "<div class='menu' style='border-bottom: solid 1px #DCDCDC; color:#FF4956;' onclick='replyDelete()'>삭제</div>";
				menuOutput += "<div class='menu' onclick='closeMenuModal()'>취소</div>";
			}
		}
		//console.log(menuOutput);
		$("#menuInnerDiv").html(menuOutput);
		$("#menuModal").css("display", "block") ;
	}

	function modifyRoomView(){
		console.log("글 수정 버튼 클릭");
		location.href = "${pageContext.request.contextPath}/loadToBoardModify?bdcode="+nowBdcode+"&bdcategory=자랑";
	}
</script>


</html>