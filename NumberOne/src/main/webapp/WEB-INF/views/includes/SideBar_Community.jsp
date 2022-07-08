<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
</head>
<body>
	<!-- 사이드바 : 커뮤니티 -->
		<div class="sidebar" style="background: #eef9ec;">
			<div class="row">
                <div class="col">
                        <div class="sidebar-item">
							<h3 class="text-center font-weight-bold">커뮤니티</h3>
							<hr>
                        </div>
                        <div class="sidebar-item">
                            <h4><a href="${pageContext.request.contextPath}/selectRoomList">자랑</a></h4>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="#">공지</a></h4>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="selectFreeBoardList">자유</a></h4>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="#">질문</a></h4>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="#">정보</a></h4>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="#">후기</a></h4>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="#">지역</a></h4>
                            <div class="blog__sidebar__item__tags">
                                <table id="region_cate">
                                	<tr>
                                		<td><a href="#">전체</a></td>
                                		<td><a href="#">서울</a></td>
                                		<td><a href="#">인천</a></td>
                                	</tr>
                                	<tr>
                                		<td><a href="#">경기</a></td>
                                		<td><a href="#">경상</a></td>
                                		<td><a href="#">전라</a></td>
                                	</tr>
                                	<tr>
                                		<td><a href="#">충청</a></td>
                                		<td><a href="#">강원</a></td>
                                		<td><a href="#">제주</a></td>
                                	</tr>
                                </table>
                            </div>
                        </div>
                       
                       
                </div>
            </div>
		</div>
		<!-- 사이드바 종료 -->
</body>
</html>