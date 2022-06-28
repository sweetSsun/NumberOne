<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/resources/css/BarCss.jsp" %>
</head>
<body>
	<!-- 사이드바 : 마이페이지 -->
		<div class="sidebar" style="background: #eef9ec;">
			<div class="row">
                <div class="col">
                        <div class="sidebar-item">
							<h3 class="text-center font-weight-bold">회원정보</h3>
							<hr>
                        </div>
                        <div class="sidebar-item">
                            <h4><a href="#">커뮤니티</a></h4>
                            <ul class="list-unstyled">
                                <li><a href="#">글/댓글</a></li>
                                <li><a href="#">스크랩</a></li>
                            </ul>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="#">중고거래</a></h4>
                            <ul class="list-unstyled">
                                <li><a href="#">사구팔구</a></li>
                                <li><a href="#">채팅</a></li>
                                <li><a href="#">찜목록</a></li>
                            </ul>
                        </div>
                       
                       <div class="sidebar-item">
                            <h4>문의</h4>
                            <ul class="list-unstyled">
                                <li><a href="#">1:1 문의</a></li>
                            </ul>
                        </div>
                </div>
            </div>
		</div>
		<!-- 사이드바 종료 -->
</body>
</html>