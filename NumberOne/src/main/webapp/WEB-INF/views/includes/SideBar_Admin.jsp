<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
</head>
<body>
	<!-- 사이드바 : 관리자-->
		<div class="sidebar" style="background: #c0c0c0;">
			<div class="row">
                <div class="col">
                        <div class="sidebar-item">
							<h3 class="text-center font-weight-bold">관리자페이지</h3>
							<hr>
                        </div>
                        <div class="sidebar-item">
                            <h4><a href="admin_selectMemberList?page=1">회원 관리</a></h4>
                        </div>
                        <div class="sidebar-item" >
                            <h4><a href="admin_selectNoticeList?searchVal=all&keyword=&page=1">공지 관리</a></h4>
                        </div>
                       	<div class="sidebar-item">
                            <h4><a href="admin_selectResellList">중고거래 관리</a></h4>
                        </div>
                        <div class="sidebar-item">
                            <h4><a href="admin_selectBoardList">커뮤니티 관리</a></h4>
                        </div>
                        <div class="sidebar-item">
                            <h4><a href="admin_selectReplyList">댓글 관리</a></h4>
                        </div>
                        <div class="sidebar-item">
                            <h4><a href="admin_selectQuestionList">문의 관리</a></h4>
                        </div>
                </div>
            </div>
		</div>
		<!-- 사이드바 종료 -->
</body>
</html>