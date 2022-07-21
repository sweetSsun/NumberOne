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
				<h2 class="text-center">중고거래 상세페이지 : Resell_View</h2>
				<form action="insertResellChat">
					<div class="row">
						<div class="col">
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





</html>