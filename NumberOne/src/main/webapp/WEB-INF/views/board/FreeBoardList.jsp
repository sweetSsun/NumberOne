<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/resources/css/CommonCss.jsp" %>
</head>
<body>
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		
		<section>
		<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">본문</h1>
				<h3>로그인 아이디 : ${sessionScope.loginId}</h3>
                <h3>로그인 프로필 : ${sessionScope.loginProfile}</h3>
				<p>Hello, World!</p>
				<p>Hello, World!</p>
				<p>Hello, World!</p>
				<p>Hello, World!</p>
				<p>Hello, World!</p>
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	

</body>
</html>