<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">

.sideroom a{
	border: none;
}


</style>

</head>

<body>
	
	<!-- 햄버거 -->
	<div id="sidebar-toggleOff">
		<a class="sideOffImg" title="메뉴 축소"><i class="fa fa-bars"></i></a>
	</div>
	
	<!-- 사이드바 -->
	<div id="sidebar">
		
		<!-- 사이드바 닫혔을 때 -->
		<div id="sideclose">
			<div class="sidemenu" style="color: white;">
			
				<div id="sidebar-toggleOn" class="sidetitle_close" style="padding-bottom: 12px; padding-top: 12px; border-color: white; color: white;">
					<span><a class="sideOnImg" title="메뉴 확장"><i class="fa fa-bars"></i></a></span>
				</div>
				
				<div class="sideclose_room">
					<span>
						<a href="selectResellPageList?sellBuy=S" title="팔구"><i class="fa-solid fa-store"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectResellPageList?sellBuy=B" title="사구"><i class="fa-solid fa-cart-shopping"></i></a>
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
				
				
				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item sidetitle_resell">
						<h2 class="accordion-header" id="panelsStayOpen-headingOne">
							<button class="accordion-button sideregion_title" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								<i class="fa-solid fa-store"></i>&nbsp;&nbsp;팔구
							</button>
						</h2>
						
						<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
							<div class="accordion-body">
								<ul class="accordion-menu">
								  	<li>
								    	<table class="sideregion_tags">
								    		<tr>
												<td><a href="selectResellPageList?sellBuy=S">전체</a></td>
												<td><a href="selectResellPageList?searchVal=SEL&sellBuy=S">서울</a></td>
												<td><a href="selectResellPageList?searchVal=ICN&sellBuy=S">인천</a></td>
											</tr>
											<tr>
												<td><a href="selectResellPageList?searchVal=GGD&sellBuy=S">경기</a></td>
												<td><a href="selectResellPageList?searchVal=GSD&sellBuy=S">경상</a></td>
												<td><a href="selectResellPageList?searchVal=JLD&sellBuy=S">전라</a></td>
											</tr>
											<tr>
												<td><a href="selectResellPageList?searchVal=CCD&sellBuy=S">충청</a></td>
												<td><a href="selectResellPageList?searchVal=GWD&sellBuy=S">강원</a></td>
												<td><a href="selectResellPageList?searchVal=JJD&sellBuy=S">제주</a></td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
						</div>
					</div>
					
					
					<div class="accordion-item sideroom_region">
						<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
							<button class="accordion-button sideregion_title collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
								<i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;사구
							</button>
						</h2>
						
						<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
							<div class="accordion-body">
								<ul class="accordion-menu">
								  	<li>
								    	<table class="sideregion_tags">
								    		<tr>
												<td><a href="selectResellPageList?sellBuy=S">전체</a></td>
												<td><a href="selectResellPageList?searchVal=SEL&sellBuy=S">서울</a></td>
												<td><a href="selectResellPageList?searchVal=ICN&sellBuy=S">인천</a></td>
											</tr>
											<tr>
												<td><a href="selectResellPageList?searchVal=GGD&sellBuy=S">경기</a></td>
												<td><a href="selectResellPageList?searchVal=GSD&sellBuy=S">경상</a></td>
												<td><a href="selectResellPageList?searchVal=JLD&sellBuy=S">전라</a></td>
											</tr>
											<tr>
												<td><a href="selectResellPageList?searchVal=CCD&sellBuy=S">충청</a></td>
												<td><a href="selectResellPageList?searchVal=GWD&sellBuy=S">강원</a></td>
												<td><a href="selectResellPageList?searchVal=JJD&sellBuy=S">제주</a></td>
											</tr>
										</table>
									</li>
								</ul>
							</div>
						</div>
					</div>
  
				</div>
			
			</div>
		</div>
	</div>
	

</body>

<script type="text/javascript">
	
$('#sidebar-toggleOff').click(function() {    
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose, #drop_sell, #drop_buy").removeClass('sideon')
    console.log("off");
});

$('#sidebar-toggleOn').click(function() {
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose, #drop_sell, #drop_buy").addClass('sideon')
    console.log("on");
});

</script>

</html>