<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
</head>
<body>
	<!-- 사이드바 : 마이페이지 -->
		<div class="sidebar" style="background: #eef9ec;">
			<div class="row">
                <div class="col">
                        <div class="sidebar-item">
							<h3 class="text-center font-weight-bold">
							<a href="selectMyInfoMemberView">회원정보</a></h3>
							<hr>
                        </div>
                        <div class="sidebar-item">
                            <h4><a href="selectMyInfoCommunityView">커뮤니티</a></h4>
                            <ul class="list-unstyled">
                                <li><a href="selectMyInfoCommunityView">글</a></li>
                                <li><a href="selectMyInfoCommunityView#reply">댓글</a></li>                                
                                <li><a href="selectMyInfoCommunityView#scrap">스크랩</a></li>
                            </ul>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="selectMyInfoResellView">중고거래</a></h4>
                            <ul class="list-unstyled">
                                <li><a href="selectMyInfoResellView">팔구사구</a></li>
                                <li><a href="selectMyInfoResellView#scroll-chat">채팅</a></li>
                                <li><a href="selectMyInfoResellView#scroll-zzim">찜목록</a></li>
                            </ul>
                        </div>
                       
                       <div class="sidebar-item">
                            <h4>문의</h4>
                            <ul class="list-unstyled">
                                <li><a href="selectMyInfoQuestionListView">1:1 문의</a></li>
                            </ul>
                        </div>
                </div>
            </div>
		</div>
		<!-- 사이드바 종료 -->
</body>
</html>