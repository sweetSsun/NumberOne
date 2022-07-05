<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 게시판 글목록 페이지</title>
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ include file="/resources/css/CommonCss.jsp" %>
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
	font-size:40px;
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

.gallerylist > ul > li > a .screen .info {
	position:absolute;
	bottom:10%;
	left:30px;
	z-index:2;
	color:#fff;
	font-size:25px;
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

.gallerylist > ul > li > a:hover .top {bottom:35%;}
.gallerylist > ul > li > a:hover .bottom {top:63%;}
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
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
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
												<!-- 대표이미지 있을 경우 출력 -->											
												<img class="roomMainImg" alt="" src="${pageContext.request.contextPath }/resources/img/room/${room.bdimg}"> 
											</c:when>
											<c:otherwise>
												<!-- 대표이미지 없을 경우 로고 출력 -->											
												<img class="roomMainImg" alt="" src="${pageContext.request.contextPath }/resources/img/logo_grey.jpg"> 									
											</c:otherwise>
										</c:choose>
											
										<div class="info">${room.bdnickname }| <i class="fa-regular fa-eye"></i> ${room.bdhits }| <i class="fa-regular fa-thumbs-up"></i> ${room.bdrecommend} | <i class="fa-regular fa-comment"></i> ${room.bdreply} | <i class="fa-regular fa-star"></i> ${room.bdscrap}</div>										
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

  <!-- Modal Content (The Image) -->
  <div class="row" style="width:1200px; height:600px;">
  		<div class="product-title tb col-lg-8">
  			<div id="roomimg" class="product-img-div">
  			</div>
  		</div>
  		<div class="tb col-lg-4" style="background-color:white; padding:10px">
 			<div class="row" style="height:225px;">
 				<div id="roomMprofile" style="color:black; width:60px;"></div>
 				<div id="roomContents" style="width:330px;"></div>
 			</div>
 			<div id="reply" style="height:205px; border:1px solid black; color:black;">
 			    댓글 영역
 			</div>
 			<div id="roomInfo" style="height:35px; color:black; font-size:30px; position:relative;">
 				추천, 스크랩, 신고
 			</div>
 			<div id="replyWriteForm" style="height:100px; border:1px solid black; color:black;">
 				댓글 작성 영역
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
	
	function roomView_ajax(bdcode){
		console.log(bdcode+"번글 roomView() 호출");
		
		$.ajax({
			type : "get",
			url : "selectRoomView",
			data : { "bdcode" : bdcode },
			dataType : "json",
			async : false,
			success: function(roomView){
				console.log(roomView);
				//글 이미지
				$("#roomimg").html("<img class='product-img' style='width:100%; height:100%' src='${pageContext.request.contextPath }/resources/img/room/"+roomView.bdimg+"'></img>");
				//작성자 프로필	
				var mprofileOutput = "<img class='product-img' style='width:60px; height:40px' ";
				if(roomView.bdmprofile != 'nomprofile'){
					console.log()
					mprofileOutput += "src='${pageContext.request.contextPath }/resources/img/mprofileUpLoad/"+roomView.bdmprofile+"'>";
				} else {
					mprofileOutput += "src='${pageContext.request.contextPath }/resources/img/logo_beige.jpg'>"; 
				}
				mprofileOutput += "</img>";
				$("#roomMprofile").html(mprofileOutput);
				//글 내용
				$("#roomContents").html("<textarea style='width:100%; height:225px; resize:none; overflow-y:scroll;' readonly>"+roomView.bdcontents+"</textarea>");
				//추천, 스크랩, 신고 출력
				var roomInfoOutput = " "
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
				if(roomView.wbhistory != "n"){
					console.log("신고 기록 있음")
					roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"wbhistory\")'><span id='"+roomView.bdcode+"_wbhistory'><i class='fa-solid fa-dove' style='position:absolute; right:0;'></i></span></a> ";
				} else {					
					console.log("신고 기록 없음")
					roomInfoOutput += "<a onclick='log(\""+roomView.bdcode+"\", \"wbhistory\")'><span id='"+roomView.bdcode+"_wbhistory'><i class='fa-solid fa-land-mine-on' style='position:absolute; right:0;'></i></span></a> ";
				}
				//console.log(roomInfoOutput);
				
				$("#roomInfo").html(roomInfoOutput);
				
				
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
		
		var currentHistory="";
		$.ajax({
			type : "get",
			url : "currentHistory",
			data : { "bdcode" : bdcode, "history": history},
			//dataType : "json",
			async : false,
			success: function(result){
				console.log(result);
				currentHistory = result;				
			}
		});
		
		console.log(bdcode+"의 현재 상태: "+currentHistory)
		$.ajax({
			type : "get",
			url : "updateLog",
			data : { "bdcode" : bdcode, "history": history, "currentState":currentHistory},
			//dataType : "json",
			async : false,
			success: function(result){
				//console.log(result);
				if(result == '1'){ //업데이트 성공시
					if(currentHistory == '0'){ //성공
						if(history == 'rchistory'){
							console.log("추천 성공");
							$("#"+bdcode+"_rchistory").html("<i class='fa-solid fa-heart'></i>");		
						} else if(history == 'schistory'){
							console.log("스크랩 성공");
							$("#"+bdcode+"_schistory").html("<i class='fa-solid fa-star'></i>");	
						} else {
							console.log("신고 성공");
							$("#"+bdcode+"_wbhistory").html("<i class='fa-solid fa-dove' style='position:absolute; right:0;'></i>");				
						}
					
					} else { //취소 성공
						if(history == 'rchistory'){
							console.log("추천 취소 성공");
							$("#"+bdcode+"_rchistory").html("<i class='fa-regular fa-heart'></i>");					
						} else if(history == 'schistory'){
							console.log("스크랩 취소 성공");
							$("#"+bdcode+"_schistory").html("<i class='fa-regular fa-star'></i>");
						} else {
							console.log("신고 취소 성공");
							$("#"+bdcode+"_wbhistory").html("<i class='fa-solid fa-land-mine-on' style='position:absolute; right:0;'></i>");				
						}						
					}	
				}	
			}
		});		
	}
	
</script>

</html>