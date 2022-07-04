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
	
	#BestRoomList{
		min-height: 200px;
		display: flex;
		border: solid black 3px;
	}
	.square{
	  width: 300px;
	  height: 300px;
	  border: solid gray 2px;
	}
	.board_category{
	  height: 100px;
	  width: 100px;
	  font-weight: bold;
	  line-height: 100px;
	  text-align: center;
	  background-color:#004804;
	}
	h2{
		color: #004804;
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
					<div class="col-11">
						<h2>자취방자랑</h2>
					</div>
					<div class="col-1">
						<h5><a href="selectRoomList">더보기</a></h5>
					</div>
				</div>
				<!-- 자취방자랑 Best 목록 -->
				<div class="row" id="BestRoomList">
					<div class="col-4" >
						<div class="square" >
							박스1
						</div>
					</div>
					<div class="col-4" >
						<div class="square">
							박스2
						</div>
					</div>
					<div class="col-4" >
						<div class="square">
							박스3
						</div>
					</div>
				</div>
				<hr>
				<!-- 자취방자랑 Best 목록 끝 -->
				
				<!-- 게시판 목록 -->
				<!-- 공지게시판 -->
				<div class="row">
					<div class="col-11">
						<h2>커뮤니티</h2>
					</div>
					<div class="col-1">
						<h5><a href="selectBoardList">더보기</a></h5>
					</div>
				</div>	
				<div class="row " style="border-bottom: solid gray 2px;">
					<div class="col-1 board_category">
						<span class="text-white">공지</span>
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
				<div class="row" style="border-bottom: solid gray 2px;">
					<div class="col-1 board_category">
						<span class="text-white">자유</span>
					</div>
					<div class="col-11 bg-white">
						<table>
							<c:forEach items="${boardList_Free }" end="2" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 질문게시판 -->
				<div class="row" style="border-bottom: solid gray 2px;">
					<div class="col-1 board_category">
						<span class="text-white">질문</span>
					</div>
					<div class="col-11 bg-white">
						<table>
							<c:forEach items="${boardList_Question }" end="2" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 정보게시판 -->
				<div class="row" style="border-bottom: solid gray 2px;">
					<div class="col-1 board_category">
						<span class="text-white">정보</span>
					</div>
					<div class="col-11 bg-white">
						<table>
							<c:forEach items="${boardList_Information }" end="2" var="board">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a>
										</td>
									</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 후기게시판 -->
				<div class="row" style="border-bottom: solid gray 2px;">
					<div class="col-1 board_category">
						<span class="text-white">후기</span>
					</div>
					<div class="col-11 bg-white">
						<table>
							<c:forEach items="${boardList_Review }" end="2" var="board">
								<c:if test="${board.bdcategory.equals('후기') }">
									<tr>
										<td>
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a>
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
				<div class="row ">
					<div class="col-11">
						<h2>지역</h2>
					</div>
					<div class="col-1">
						<h5><a href="">더보기</a></h5>
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