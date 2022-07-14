<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%@ include file="/resources/css/BarCss.jsp" %>

<style type="text/css">

ul {
	list-style:none;
}

.dropdown_menu:after {
	display:block; content:''; clear:both;
}
.dropdown_menu > li {
	position:relative; float:left; margin-right:5px;
}
.dropdown_menu > li > a{
	display:block; height:40px; line-height:40px;
}
.dropdown_menu > li:hover .dorpdown_list {
	display:block;
}
.dropdown_menu .dorpdown_list {
	display:none; position:absolute; padding: 0; text-align:center; font-size: 16px;
}


</style>

</head>

<body>
	
	<!-- 햄버거 -->
	<div id="sidebar-toggleOff">
		<a class="sideOffImg"><i class="fa fa-bars"></i></a>
	</div>
	
	<!-- 사이드바 -->
	<div id="sidebar">
		
		<!-- 사이드바 닫혔을 때 -->
		<div id="sideclose">
			<div class="sidemenu" style="color: white;">
			
				<div id="sidebar-toggleOn" class="sidetitle_close" style="padding-bottom: 12px; padding-top: 12px; border-color: white; color: white;">
					<span><a class="sideOnImg"><i class="fa fa-bars"></i></a></span>
				</div>
				
				<div class="sideclose_room">
					<span>
						<a href="selectResellPageList?sellBuy=S"><i class="fa-solid fa-store"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectResellPageList?sellBuy=B"><i class="fa-solid fa-cart-shopping"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="#"><i class="fa-solid fa-comment-dots"></i></a>
					</span>
				</div>
				
			</div>
		</div>
		
		
		<!-- 사이드바 열었을 때 -->
		<div id="sideList">

			<div class="sidemenu">
			
				<div class="sidetitle">
					<span><a href="selectResellMainPage">중고거래</a></span>
				</div>
				
				<div class="sideroom">
					<ul class="dropdown_menu">
						<li class="sideregion_title">
							<span>
								<a href="selectResellPageList?sellBuy=S"><i class="fa-solid fa-store"></i>&nbsp;&nbsp;팔구</a>
							</span>
							
							<!-- <ul class="dorpdown_list">
								<li>
									<table class="sideregion_tags">
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
								</li>
							</ul> -->
						</li>
					</ul>
				</div>
				
				
				<div class="sideroom">
					<ul class="dropdown_menu">
						<li class="sideregion_title">
							<span>
								<a href="selectResellPageList?sellBuy=B"><i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;사구</a>
							</span>
						</li>
					</ul>
				</div>
				
				
				<div class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-comment-dots"></i>&nbsp;&nbsp;채팅</a>
					</span>
				</div>
			</div>
			
			<div class="sideregion">
				<div class="sideregion_title">
					<span><i class="fa-solid fa-map-location-dot"></i>&nbsp;&nbsp;지역</span>
				</div>
						
				<div>
					<table class="sideregion_tags">
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
			
			
			<!-- 연습중 -->
			<ul class="dropdown_menu">
				<li class="sideregion_title">
					<span><a href="selectResellPageList?sellBuy=S"><i class="fa-solid fa-store"></i>&nbsp;&nbsp;팔구</a></span>
						
					<ul class="dorpdown_list">
						<li>
							<table class="sideregion_tags">
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
						</li>
					</ul>
				</li>
			</ul>
			
			
		</div>
	</div>
		
</body>

<script type="text/javascript">

$('#sidebar-toggleOff').click(function() {    
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose").removeClass('sideon')
    console.log("off");
});

$('#sidebar-toggleOn').click(function() {
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose").addClass('sideon')
    console.log("on");
});

</script>

</html>