<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 커뮤니티 메인</title>
<%@ include file="/resources/css/CommonCss.jsp" %>
<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	table{
		width: 100%;
		
	}
	td{
		
	    border-bottom-width: 3px! important;
   		border-color: white! important;
		
	}
	#BestRoomList{
		min-height: 200px;
		display: flex;
		border: solid #00bcd4 2px;
		border-radius: 5px;
	}
	.square{
	  width: 250px;
	  height: 250px;
	  border: solid #E0E0E0 2px;
	  margin-top: 5%;
	  margin-bottom: 5%;
	}
	.board_category{
	  height: 100px;
	  width: 100px;
	  font-weight: bold;
	  line-height: 100px;
	  text-align: center;
	  background-color:#00bcd4;
	  border-radius: 5px;
	  height: auto;
	}
	h3{
		color: #00bcd4;
	}
	td{
		font-size: 20px;
		background-color: #eaf8ff;
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
		
		<!-- 본문 -->
			<section>
			<div class="container-fluid">
				<h1 class="text-center">게시판 메인 : BoardMain.jsp</h1>
				<div class="row">
					<div class="col mb-2">
						<h3>자취방자랑</h3>
					</div>
					<div align="right" class="col">
						<span style="font-size:17px;"> <a href="selectRoomList"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></span>
					</div>
				</div>
				<!-- 자취방자랑 Best 목록 -->
				<div class="row mb-5" id="BestRoomList">
					<div class="col-3" >
						<div class="square" >
							박스1
						</div>
					</div>
					<div class="col-3" >
						<div class="square">
							박스2
						</div>
					</div>
					<div class="col-3" >
						<div class="square">
							박스3
						</div>
					</div>
					<div class="col-3" >
						<div class="square">
							박스4
						</div>
					</div>
				</div>
				<hr>
				<!-- 자취방자랑 Best 목록 끝 -->
				
				<!-- 게시판 목록 -->
				<!-- 공지게시판 -->
				<div class="row">
					<div class="col-11 mt-2 mb-2 ">
						<h3>커뮤니티</h3>
					</div>
					<div class="col-1">
						<span style="font-size:17px;"> <a href="selectBoardList"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></span>
					</div>
				</div>	
				<div class="row mb-3">
					<div class="col-1 board_category">
						<a href="#"><span class="text-white">공지</span></a>
					</div>
					<div class="col-11 bg-white">
						<table>
							<c:forEach items="${noticeList }" end="2" var="notice">
								<tr>
									<td>
										<a href="selectNoticeBoardView?nbcode=${notice.nbcode }">${notice.nbtitle}</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 자유게시판 -->
				<div class="row mb-3" >
					<div class="col-1 board_category">
						<a href="#"><span class="text-white">자유</span></a>
					</div>
					<div class="col-5 bg-white ">
						<table>
							<c:forEach items="${boardList_Free }" end="2" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-6 bg-white">
						<table>
							<c:forEach items="${boardList_Free }" begin="3" end="5" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 질문게시판 -->
				<div class="row mb-3" >
					<div class="col-1 board_category">
						<a href="#"><span class="text-white">질문</span></a>
					</div>
					<div class="col-5 bg-white">
						<table>
							<c:forEach items="${boardList_Question }" end="2" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-6 bg-white">
						<table>
							<c:forEach items="${boardList_Question }" begin="3" end="5" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 정보게시판 -->
				<div class="row mb-3" >
					<div class="col-1 board_category">
						<a href="#"><span class="text-white">정보</span></a>
					</div>
					<div class="col-5 bg-white">
						<table>
							<c:forEach items="${boardList_Information }" end="2" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-6 bg-white">
						<table>
							<c:forEach items="${boardList_Information }" begin="3" end="5" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 후기게시판 -->
				<div class="row mb-5" >
					<div class="col-1 board_category">
						<a href="#"><span class="text-white">후기</span></a>
					</div>
					<div class="col-5 bg-white">
						<table>
							<c:forEach items="${boardList_Review }" end="2" var="board">
								<c:if test="${board.bdcategory.equals('후기') }">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
					<div class="col-6 bg-white">
						<table>
							<c:forEach items="${boardList_Review }" begin="3" end="5" var="board">
								<c:if test="${board.bdcategory.equals('후기') }">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}
												<span class="text-info fw-bold" style="font-size:15px;">&nbsp;${board.bdrpcount }</span></a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 게시판 목록 종료 -->
				
				<hr>
				
				<!-- 지역게시판-->
				<div class="row mt-3 mb-2">
					<div class="col-11">
						<h3>지역</h3>
					</div>
					<div class="col-1">
						<span style="font-size:17px;"> <a href="#"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></span>
					</div>
					<div class="col ">
						<div class="">
							<a href="#"> <span>서울</span> </a>
						</div>
					</div>
					<div class="col ">
						<div class="">
							<a href="#"> <span>인천</span> </a>
						</div>
					</div>
					<div class="col ">
						<div class="">
							<a href="#"> <span>경기</span> </a>
						</div>
					</div>
					<div class="col">
						<div class="">
							<a href="#"> <span>경상</span> </a>
						</div>
					</div>
					<div class="col ">
						<div class="">
							<a href="#"> <span>전라</span> </a>
						</div>
					</div>
					<div class="col ">
						<div class="">
							<a href="#"> <span>충청</span> </a>
						</div>
					</div>
					<div class="col ">
						<div class="">
							<a href="#"> <span>강원</span> </a>
						</div>
					</div>
					<div class="col ">
						<div class="">
							<a href="#"> <span>제주</span> </a>
						</div>
					</div>
				</div>
				
			</div>
			</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>