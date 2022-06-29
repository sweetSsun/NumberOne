<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일인자 : 마이페이지</title>
<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">마이페이지</h1>
				<!-- 사구/팔구 -->
				<div class="row">
					<div class="col-6">
						<h1 class="bg-info">사구(구분용배경)</h1>
						<table id="BuyTable">
							<tr>
								<td>아이패드 삽니다. 애플펜슬도 삽니다. 연락주세요</td>
							</tr>
							<tr>
								<td>닌텐도 삽니다</td>
							</tr>
							<tr>
								<td>노트북 삽니다</td>
							</tr>
						</table>
					</div>
					<div class="col-6">
						<h1 class="bg-warning">팔구</h1>
						<table id="SellTable">
							<tr>
								<td>가방 팝니다. 네고 사절</td>
							</tr>
							<tr>
								<td>포켓몬 빵 개당 1500원 직거래만</td>
							</tr>
							<tr>
								<td>이벤트 참여하고 상품받아가세요</td>
							</tr>
						</table>
					</div>
				<hr>
				</div>
				
				<!-- 채팅내역 -->
				<div class="row">
					<div class="col">
						<h1 class="bg-primary">채팅내역</h1>
						<table id="chatList">
							
						</table>
					</div>
				</div>
				
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
</body>
</html>