<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 작성글 조회</title>

<!-- BarCss 삭제 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listCss.css" type="text/css">

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

section {
	max-width: 70%;
	margin: auto;
	margin-top: 0%;
}

.bigger {
	margin : 0.5rem;
	font-size: 2rem;
}

.bdCategoryList {
	color: #00bcd4;
	border: none;
	font-size: 18px;
	margin-left: 2%;
}

.bdcategorySel {
	font-weight: bold;
	text-align: center;
	color: #00bcd4;
}

.bold {
	font-weight: bold;
}

/* List CSS */
#regionList {
	width: 100%;
	height: 100%;
	margin: auto;
	padding-top: 10px;
	overflow: hidden;
	padding-top: 10px;
}

div.row.sellbuyhead {
	margin-top: 2 rem;
	background-color: #00bcd4;
	margin-left: 0%;
	margin-right: 0%;
	height: 3.2rem;
}

div.col.mb-2 h3 {
	color: white;
}

.float_ {
	width: 33.3333333%;
	height: 40rem;
	float: left;
	padding: 1%;
}

#sellbuyscreen {
	width: 100%;
	height: 34rem;
	margin-bottom: 10px;
}

#sellbuyscreen>a>img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	object-fit: cover;
}

.bottom {
	font-size: 2rem;
	margin: 0px 0px;
	width: 100%;
	height: 2.4rem;
	overflow: hidden;
	color: initial;
}

.list {
	height: 43rem;
	/* border : 1px solid  #00bcd4; */
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

.nolist {
	/* room, resell 리스트가 없는 경우 길이 줄이기 */
	height: 10rem;
}

.d_none{ display:none;}

</style>
</head>
<body>

	<!-- TopBar -->


	<c:choose>
		<c:when test="${sessionScope.loginId != 'admin'}">
			<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/includes/TopBar_Admin.jsp"%>
		</c:otherwise>
	</c:choose>

	<!-- End of TopBar -->
	<main>
		<!-- 사이드바 -->

		<%@ include file="/WEB-INF/views/includes/SideBar_Resell.jsp"%>
		<!-- 사이드바 End-->
					
	<section>
		<!-- 페이지명 -->
		<div class="checkout__form" style="margin-top: 30px;"><span style="color:coral;">${nickname }</span>님의 작성글 조회</div> 
	

				<!--roomlist div 시작  
				<div class="row sellbuyhead">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">자취방 자랑게시판</h3>
					</div>
				</div>
				-->
				
				<div class="row sellbuyhead" style="clear: both; margin-top: 50px;">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">자취방 자랑게시판</h3>
					</div>
				</div>
				
				<div id="roomList" class="list">
					<c:forEach items="${roomList}" var="room">
						<div class="float_">
							<div id="sellbuyscreen">
								
							<c:choose>
								<c:when test="${room.bdimg != null}">
									<a href="${pageContext.request.contextPath }/selectRoomList?bdcode=${room.bdcode}">
										<img alt="" src="${pageContext.request.contextPath }/resources/img/room/${room.bdimg }">
									</a>
									</c:when>
									
									<c:otherwise>
										<a href="#">  
											<img alt="" src="${pageContext.request.contextPath }/resources/img/logo_bada.png">
										</a>
									</c:otherwise>
							</c:choose>
							</div>
						<div class="bottom" style="font-weight:600; position:relative;">
							<span class="soldCheckMsg_ bold"></span>
							<a href="#">${room.bdtitle }</a>				
						</div>
						<div style="height:2rem; font-size:1.6rem; padding:0; color:grey;">
							${room.bddate }
						</div>
						<div class="bottom" style="font-size:1.7rem; font-weight:600; position:relative;">
							<span onclick="writeMemberSellbuy('${room.bdnickname }')" style="height:1.8rem; font-size:1.6rem; padding:0; color:initial; cursor:pointer;">${room.bdnickname }</span>
						</div>
					</div>
				</c:forEach>
				
					<div style="height: 20px; float: left; width: 33.3333333%;"></div>
				</div>
				
				<div id="noRoomList" class="d_none bigger">작성글이 존재하지 않습니다.</div>
				<!--roomlist div 끝  -->

				

				<!--중고거래 div 시작  -->
				<div class="row sellbuyhead" style="clear: both; margin-top: 50px;">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">중고거래</h3>
					</div>
				</div>

				<div id="resellList" class="list">

					<c:forEach items="${resellList}" var="resell">
						<div class="float_">
							<div id="sellbuyscreen">
							<c:choose>
								<c:when test="${resell.ubmainimg != null}">
									<a href="selectResellView?ubcode=${resell.ubcode }&ubsellbuy=${resell.ubsellbuy }&modifyCheck=LIST"> <img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${resell.ubmainimg }">
									</a>
									</c:when>
									
									<c:otherwise>
										<a href="selectResellView?ubcode=${resell.ubcode }&ubsellbuy=${resell.ubsellbuy }&modifyCheck=LIST">  <img alt="" src="${pageContext.request.contextPath }/resources/img/logo_bada.png">
									</a>
									
									</c:otherwise>
							</c:choose>
							</div>
							<div class="bottom" style="font-weight: 600; position: relative;">
								<span class="soldCheckMsg_ bold"></span> <a href="selectResellView?ubcode=${resell.ubcode }&ubsellbuy=${resell.ubsellbuy }&modifyCheck=LIST">${resell.ubtitle }</a>
							</div>
							<div style="height: 2rem; font-size: 1.6rem; padding: 0; color: grey;">${resell.ubdate }&nbsp;
							</div>
							<div class="bottom" style="font-size: 1.7rem; font-weight: 600; position: relative;">
								<span onclick="writeMemberSellbuy('${resell.ubnickname }')" style="height: 1.8rem; font-size: 1.6rem; padding: 0; color: initial; cursor: pointer;">${resell.ubnickname }</span>
							</div>
						</div>

					</c:forEach>
					
					<div style="height: 20px; float: left; width: 33.3333333%;"></div>
				</div>
				<div id="noResellList" class="d_none bigger">작성글이 존재하지 않습니다.</div>
				<!-- 중고거래 div 끝 -->


				<!--일반게시판 div 시작  -->
				<div class="row sellbuyhead" style="clear: both; margin-top: 50px;">
					<div class="col mb-2" style="padding-top: 0.2rem;">
						<h3 style="font-size: 2.3rem; font-weight: 700;">일반게시판</h3>
					</div>
				</div>

				<div class="row">
				<table class="boardList">
					<thead >
						<tr class="text-center" id="board_column">
							<td style="font-size: 17px;">글번호</td>
							<td style="font-size: 17px;">카테고리</td>
							<td style="font-size: 17px;">제목</td>
							<td style="font-size: 17px;">작성자</td>
							<td style="font-size: 17px;">날짜</td>
							<td style="font-size: 17px;">조회</td>
							<td style="font-size: 17px;">추천</td>
						</tr>
					</thead>
					
					<tbody id="bdCategoryList">
					<c:forEach items="${boardList }" var="board">
						<c:if test="${board.bdcategory != '자랑' }">
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td class="text-center tableCell">${board.bdcode}</td>
							<td class="bdcategory text-center tableCell">
								<a href="selectCategoryBoardList?searchVal=${board.bdcategory }">
									${board.bdcategory}
								</a>
							
							</td>
							<td class="tableCell">
								<c:choose>
									<c:when test="${board.bdcategory eq '후기'  }">
										<a href="selectReviewBoardView${paging.makeQueryPage(board.bdcode, paging.page) }">${board.bdtitle} 
									 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span> </a>
									</c:when>
									
									<c:otherwise>
									 	<a href="selectBoardView${paging.makeQueryPage(board.bdcode, paging.page)}">${board.bdtitle}
									 		<c:if test="${board.bdimg != null }">
									 		<i class="fa-regular fa-image"></i>
									 		</c:if>
									 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span> </a>
									</c:otherwise>
								</c:choose>
							 </td>
							<td class="text-center tableCell">
								<span style="cursor: pointer" class="bdnickname" onclick="writeMemberBoard('${board.bdnickname}')">${board.bdnickname}</span>
							</td>
							<td class="text-center tableCell" id="bddate">${board.bddate}</td>
							<td class="text-center tableCell">${board.bdhits }</td>
							<td class="fw-bold text-center tableCell" style="color: #00bcd4;">${board.bdrccount}</td>
						</tr>
						</c:if>
					</c:forEach>
					<tr id="noBoardList" class="d_none"><td style = "padding-left:1rem;">작성글이 존재하지 않습니다.<td></tr>
					</tbody>
				</table>
				</div>
				<!-- 일반게시판 div 끝 -->
				

		</section>


	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>

<script type="text/javascript">
	
	const roomSize = '${roomSize}';
	const resellSize = '${resellSize}';
	const boardSize = '${boardSize}'
	
	if(roomSize == '0'){
		//자취방 자랑글 없으면
		$("#roomList").addClass("d_none");
		$("#noRoomList").removeClass("d_none");
	}
	
	if(resellSize == '0'){
		//중고거래글 없으면
		$("#resellList").addClass("d_none");
		$("#noResellList").removeClass("d_none");
	}
	
	if(boardSize == '0'){
		//일반게시글 없으면
		$("#noBoardList").removeClass("d_none");
	}


</script>

</html>