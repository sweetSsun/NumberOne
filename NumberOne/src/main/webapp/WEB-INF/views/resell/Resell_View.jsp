<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 폰트어썸 -->
<title>${board.bdtitle } - 1인자:게시판 글상세 페이지</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<style type="text/css">
	section {
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
		height:50px; 
		width:50px;
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
     align-items: center;
     justify-content: center;
     border: solid #E0E0E0 2px;
     margin-top: 2%;
     width: 200px;
     height: 200px;
     
   }
   #upload_Img{
   	width: 200px;
   	height: 200px;
   	object-fit: cover;
   }
   #inputModifyRpBox{
   	border: solid #E0E0E0 2px; 
   	border-radius:5px;
   }
   
   /* 중고거래 */
.Resell_Wrapper{
	width: 450px;
	height: 450px;
	text-align: center;
	left: 50%;
    top: 50%;

}   
.Resell_contents{
	top: 50px;
}
.Resell_img_container{

	text-align: center;
	overflow: hidden;
	width: 450px;
	height: 450px;
	position: relative;
}   
.Resell_img{
    position: relative;
    width: 400px;
    height: 400px;
    display: none;	
}
.active{
    display: block;
}
#prev,#next{
    height: 40px;
    width: 40px;
    position: absolute;
    background-color: #076bb8;
    color: #ffffff;
    margin: auto;
    top: 0;
    bottom: 0;
    border: none;
    border-radius: 3px;
    font-size: 18px;
    font-weight: bolder;
}
#prev{
    left: 5px;
}

#next{
    right: 5px;
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Resell.jsp"%>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">중고거래 상세페이지</h1>


				<div class="container-header container-card_w100 slider">

					<div class="w3-content w3-display-container">
						<img class="mySlides" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}" style="width: 100%">

						<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
							<img class="mySlides" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}" style="width: 100%">
						</c:forEach>
						<div class="w3-left position-left" onclick="plusDivs(-1)">&#10094;</div>
						<div class="w3-right position-right" onclick="plusDivs(1)">&#10095;</div>

						<!--  -->
					</div>


				</div>



				<div class="container-body">
					<!-- 품목명  -->
					<form action="insertResellChat">
						<div class="container-card_goods container-card_w100">
							<c:forEach items="${gd_resellView}" var="gdList">

								<div class="container-card_goods_2">
									<div class="item-basis_1">

										<input type="checkbox" class="selectCheckBox" onclick="clickBox(this, '${gdList.gdname }')" value="${gdList.gdname }">
									</div>
									<div class="item-basis_2 gd_nameList">${gdList.gdname }</div>
									<div class="item-basis_3 gd_priceList">${gdList.gdprice }</div>
									<input type="hidden" class="select_gdcode" value="${gdList.gdcode }"> <input type="hidden" class="select_gdstate"
										value="${gdList.gdstate }"
									>
								</div>

							</c:forEach>


							<input type="hidden" name="cmfrmid" value="${sessionScope.loginId }"> <input type="hidden" name="cmfrmnickname"
								value="${sessionScope.loginNickname }"
							> <input type="hidden" name="cmtomnickname" value="${ub_resellView.ubnickname}"> <input type="hidden" name="cmtomid"
								value="${ub_resellView.ubmid}"
							> <input type="hidden" name="gdtitle" value="${ub_resellView.ubtitle }">


						</div>


						<div class="container-flex_2">

							<div class=item-basis_5>
								<div>
									<p style="font-size: 12.5px">
										<span onclick="writeMemberSellbuy('${zzim.mnickname }')">${zzim.mnickname }</span> &nbsp;&nbsp; <img class="img-profile rounded-circle" style="width: 50px"
											src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${ub_resellView.ubprofile }"
										>
										
									
									</p>
								</div>

							</div>

							<div class=" item-basis_4">
								<button id="sellBuyList" type="button">글목록</button>
							</div>
							<div class="item-basis_4">
								<button id="zzimBtn" type="button">찜</button> <span id="zzimCount">${ub_resellView.ubzzim }</span>
							</div>
							<c:choose>
								<c:when test="${ub_resellView.ubsellbuy == 's' }">
									<a href=""><span class="fw-bold boardCategory"> | 사구 </span></a> 
								</c:when>
								
								<c:otherwise>
									<a href=""><span class="fw-bold boardCategory"> | 팔구 </span></a>
								</c:otherwise>
							</c:choose>
							<span class="fw-bold" style="color:gray; font-size:20px">/</span> 
								<a href="selectRegionBoardList"><span class="bdregion">${ub_resellView.ubrgcode }</span></a>
						</div>
					</div>
					<div class="row idDateHits">
						<div class="col">
							<span class="fw-bold boardTitle">${ub_resellView.ubtitle }</span>  
						</div>
					</div>
					
					<!-- 중고거래 사진 / 본문  -->
					<div class="row" style="margin-top: 40px; border-bottom: solid 1px #E0E0E0">
						<!-- 사진 -->
						<div class="col-5">
							<div class="Resell_img_container">
								<img class="active Resell_img" src="${pageContext.request.contextPath }/resources/img/resell/${ub_resellView.ubmainimg}" style="width: 400px; height: 400px;">
									<c:forEach items="${ub_resellView.ubdetailimg_list}" var="ubdetailimg_list" begin="1">
										<img class="Resell_img" src="${pageContext.request.contextPath }/resources/img/resell/${ubdetailimg_list}" style="width: 400px; height: 400px;">
									</c:forEach>
	<!-- 							<button id="prev" onclick="prev()"> &lt; </button>
									<button id="next" onclick="next()"> &gt; </button> -->
							</div>
						</div>
						<div class="col-7" style="background-color: #eaf8ff">
							<!-- 본문 글 내용-->
							<textarea id="inputReply" rows="10%" cols="30%" readonly>${ub_resellView.ubcontents}</textarea>
						</div>	
					</div>
					
					<!-- 품목정보 -->
					<div class="row">
						<div class="col">
							<c:forEach items="${gd_resellView}" var="gdList">
							<div class="row">
								<div class="col">
									<input type="checkbox" class="selectCheckBox" onclick="clickBox(this, '${gdList.gdname }')" value="${gdList.gdname }">
									<span>${gdList.gdname }</span>
									<span>${gdList.gdprice }</span>
									<input type="hidden" class="select_gdcode" value="${gdList.gdcode }"> <input type="hidden" class="select_gdstate"
										value="${gdList.gdstate }">
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					
				</form>
				
				
				
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
	var images = document.querySelectorAll(".Resell_img_container img");
	let i = images[0]; // current slide
	console.log(i);
	let j = images.length; // total slides
	console.log(j);
	
	function next(){
	    document.getElementByClss("content" + (i+1)).classList.remove("active");
	    i = ( j + i + 1) % j;
	    document.getElementById("content" + (i+1)).classList.add("active");
	    indicator( i+ 1 );
	}
	function prev(){
	    document.getElementById("content" + (i+1)).classList.remove("active");
	    i = (j + i - 1) % j;
	    document.getElementById("content" + (i+1)).classList.add("active");
	    indicator(i+1);
	}
	
</script>


<!-- 슬라이드배너  -->
<script type="text/javascript">
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
		showDivs(slideIndex += n);
	}

	function currentDiv(n) {
		showDivs(slideIndex = n);
	}

	function showDivs(n) {
		var i;
		var x = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("demo");
		if (n > x.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = x.length
		}
		;
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" w3-white", "");
		}
		x[slideIndex - 1].style.display = "block";
		//dots[slideIndex - 1].className += " w3-white";
	}
</script>

<script type="text/javascript">
	// 게시글 경고 모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++) {
		close[i].addEventListener("click", function() {
			$("#ubWarningCheckModal").modal("hide");
		});
	}
</script>

<!--신고 스크립트  -->
<script type="text/javascript">
	window.onload = function(){
		checkResellWarning();
	}
	
	function checkResellWarning() {
		/* 게시글 신고 확인 */
		$.ajax({
			type : "get",
			url : "checkResellWarning_ajax",
			data : {
				"loginId" : loginId,
				"ubcode" : ubcode
			},
			async : false,
			success : function(wnCheck) {
				console.log("신고유무 확인 : " + wnCheck);
				if (wnCheck == "Yes") {
					$("#ubWarning").addClass("text-danger");
				}
			}
		});
	}


///////////////////////////[신고]/////////////////////////////////
	function ubWarningCheckModal() {
		/* 게시글 신고 클릭 시 모달창 출력 */
		if ($("#ubWarning").hasClass("text-danger")) {
			alert("이미 신고접수된 게시물입니다.");
		} else {
			$("#ubWarningCheckModal").modal('show');
		}
	}


	function insertResellWarning() {
		/* 게시글 신고 */
		console.log("게시글 신고자 : " + loginId);
		console.log("신고할 글번호 : " + ubcode);
		if ($("#ubWarning").hasClass("text-danger")) {
			deleteResellWarning();
		} else {
			$.ajax({
				type : "get",
				url : "insertResellWarning_ajax",
				data : {
					"loginId" : loginId,
					"ubcode" : ubcode
				},
				async : false,
				success : function(insertResult) {
					console.log(insertResult);
					if (insertResult > 0) {
						alert("게시글 신고가 접수되었습니다.")
						$("#ubWarning").addClass("text-danger");
					}
				}
			});
		}
	}

	function deleteResellWarning() {
		/* 신고 취소 // 22.07.06 신고취소 안되도록 수정 */
		$("#ubWarning").removeClass("text-danger");
		$.ajax({
			type : "get",
			url : "deleteResellWarning_ajax",
			data : {
				"loginId" : loginId,
				"ubcode" : ubcode
			},
			async : false,
			success : function(deleteResult) {
				console.log(deleteResult);
			}
		});
	}
</script>

<script type="text/javascript">
	// 게시글 삭제 경고 모달창 close 하는 스크립트
	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++) {
		close[i].addEventListener("click", function() {
			$("#ubDeleteCheckModal").modal("hide");
		});
	}
</script>


<script type="text/javascript">
	/* 게시글 수정, 삭제 */
	function resellModifyForm() {
		/* 게시글 수정 페이지 이동  */
		let modifyCheck = 'MODIFY';
		location.href = "loadToResellModifyForm?ubcode=" + ubcode
				+ "&ubsellbuy=" + ubsellbuy + "&modifyCheck=" + modifyCheck;
	}

	function ubDeleteCheckModal() {
		/* 게시글 삭제버튼 클릭 시 모달 출력 */
		$("#ubDeleteCheckModal").modal('show');
	}
	function updateResellDelete() {
		/* 게시글 삭제(상태변경) */
		//모달창에서 "네" 버튼 클릭 시 삭제
		location.href = "updateResellDelete?ubcode=" + ubcode + "&ubsellbuy="
				+ ubsellbuy;
	}
</script>

<!-- 글목록으로 돌아가기 -->
<script type="text/javascript">
	let sellbuy_List = document.querySelector("#sellBuyList");
	//console.log(sellbuy_List);
	
	sellbuy_List.addEventListener("click", backList);
	
	function backList() {
		console.log("글목록버튼 클릭이벤트");
		location.href = "selectResellPageList?sellBuy=" + ubsellbuy;
	}

</script>

<!-- 체크박스 선택이벤트 스크립트  -->
<script type="text/javascript">
	/* 체크박스 클릭 이벤트 */
	let gd_names = [];
	const cmfrmid = loginId;
	const cmfrmnickname = document.getElementsByName("cmfrmnickname")[0].value;
	const cmtomnickname = document.getElementsByName("cmtomnickname")[0].value;
	const cmtomid = ubmid;
	const gdtitle = document.getElementsByName("gdtitle")[0].value;
	

	function clickBox(sel_boxTag, selOp) {
		if (sel_boxTag.checked == true) {
			// 클릭이벤트 발생 시 체크박스가 checked 된 경우에만 실행
			gd_names.push(selOp);	// checked 되었을 때 상품명을 gd_names 변수에 push 해서 담아준다.

			/* 데이터 확인 */
			console.log("선택된체크박스 : ", sel_boxTag);
			console.log("보내는아이디 : ", cmfrmid);
			console.log("보내는닉네임 : ", cmfrmnickname);
			console.log("받는닉네임 : ", cmtomnickname);
			console.log("받는아이디 : ", cmtomid);
			console.log("상품이름 : ", gd_names);
			console.log("글 제목 : ", gdtitle);			
	
	} else {
        var ubIdx = gd_names.findIndex( (element) => element === selOp );
        console.log(ubIdx);
        gd_names.splice(ubIdx, 1);   // checked 해제 했을 때 상품명을 ub_names 변수에서 빼준다.
        
        /* 데이터 확인 */
        console.log("<"+selOp+" 해제>");
        console.log("상품이름 : ", gd_names);
	}
	}
</script>

<!--채팅 활성화  -->
<script type="text/javascript">
chatBtn.addEventListener('click', chatInsert_Ajax);

/* 챗버튼 클릭 이벤트핸들러 */
function chatInsert_Ajax() {
   // 로그인 확인
   $.ajax({
      type : 'get',
      url : 'selectLoginOut_ajax',
      async : false,
      success : function(result){
         if (result == "2"){ 
            if(confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?")){
               location.href = "loadToLogin"
               return;
            }
            return;
         }
         
         // 체크 확인
         if(gd_names.length == 0){
            alert('관심있는 상품을 선택해주세요');
            return;
         }
         
         
         $.ajax({
   
            type : 'post',
            url : 'insertResellChat',
            traditional : true,     // 배열 전송위해서 필요.  
            async : false,
            data : {
               'gd_names' : gd_names,
               'cmfrmid' : cmfrmid,
               'cmfrmnickname' : cmfrmnickname,
               'cmtomnickname' : cmtomnickname,
               'cmtomid' : cmtomid,
               'gdtitle' : gdtitle
            },
            dataType : 'json',
            success : function(chatResult) {
               alert('바르고 고운 말을 써주세요.');
               console.log("chatResult : ", chatResult);
      
               popupChat(chatResult);
      
            }
         })
      }
   })
}

</script>
</html>

