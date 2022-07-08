<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
<style type="text/css">
	.malmuri{
		height: 200px;
		width: 100px;
		border-radius: 10px;
		border: solid gray 1px;
		
	}
</style>
</head>
<body>
	<!-- 사이드바 : 커뮤니티 -->
		<div class="sidebar" style="background: white;">
			<div class="row">
                <div class="col">
                        <div class="sidebar-item bg-info malmuri" >
							<h3 class="text-center font-weight-bold "><a href="selectBoardList">공지</a></h3>
                        </div>
                        
                        <div class="sidebar-item bg-white malmuri" >
                            <h4><a href="${pageContext.request.contextPath}/selectRoomList">자랑</a></h4>
                        </div>
                        <div class="sidebar-item bg-white malmuri" >
                            <h4><a href="#">자유</a></h4>
                        </div>
                        <div class="sidebar-item bg-white malmuri">
                            <h4><a href="selectFreeBoardList">질문</a></h4>
                        </div>
                        <div class="sidebar-item bg-white malmuri" >
                            <h4><a href="#">정보</a></h4>
                        </div>
                        <div class="sidebar-item bg-white malmuri" >
                            <h4><a href="#">후기</a></h4>
                        </div>
                        <div class="sidebar-item bg-white malmuri" >
                            <h4><a href="#">지역</a></h4>
                        </div>
                       
                       
                       
                </div>
            </div>
		</div>
		<!-- 사이드바 종료 -->
</body>
</html>