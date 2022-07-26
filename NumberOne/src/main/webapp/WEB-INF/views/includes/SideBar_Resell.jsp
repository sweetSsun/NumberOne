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
	
	.accordion-button:not(.collapsed){
		color: #00bcd4;
		background-color: #F2F2FF;
	}
	
	.accordion-button:not(.collapsed)::after{
		color: #00bcd4;
		background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%2300bcd4'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
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
						<a href="selectResellPageList?sellBuy=S&ajaxCheck=LIST" title="팔구"><i class="fa-solid fa-store"></i></a>
					</span>
				</div>
				<div class="sideclose_room">
					<span>
						<a href="selectResellPageList?sellBuy=B&ajaxCheck=LIST" title="사구"><i class="fa-solid fa-cart-shopping"></i></a>
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
							<button class="accordion-button collapsed sideresell_title" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
								<i class="fa-solid fa-store"></i>&nbsp;&nbsp;팔구
							</button>
						</h2>
						
						<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
							<div class="accordion-body">
								<ul class="accordion-menu">
								  	<li>
								    	<table class="sideregion_tags">
								    		<tr>
												<td><a href="selectResellPageList?searchVal=all&sellBuy=S">전체</a></td>
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
					
					
					<div class="accordion-item sidetitle_resell">
						<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
							<button class="accordion-button sideresell_title collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
								<i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;사구
							</button>
						</h2>
						
						<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
							<div class="accordion-body">
								<ul class="accordion-menu">
								  	<li>
								    	<table class="sideregion_tags">
								    		<tr>
												<td><a href="selectResellPageList?searchVal=all&sellBuy=B">전체</a></td>
												<td><a href="selectResellPageList?searchVal=SEL&sellBuy=B">서울</a></td>
												<td><a href="selectResellPageList?searchVal=ICN&sellBuy=B">인천</a></td>
											</tr>
											<tr>
												<td><a href="selectResellPageList?searchVal=GGD&sellBuy=B">경기</a></td>
												<td><a href="selectResellPageList?searchVal=GSD&sellBuy=B">경상</a></td>
												<td><a href="selectResellPageList?searchVal=JLD&sellBuy=B">전라</a></td>
											</tr>
											<tr>
												<td><a href="selectResellPageList?searchVal=CCD&sellBuy=B">충청</a></td>
												<td><a href="selectResellPageList?searchVal=GWD&sellBuy=B">강원</a></td>
												<td><a href="selectResellPageList?searchVal=JJD&sellBuy=B">제주</a></td>
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
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose, .sideresell_title").removeClass('sideon')
    console.log("off");
});

$('#sidebar-toggleOn').click(function() {
    $("#sidebar, #sideList, #sidebar-toggleOff, #sideclose, .sideresell_title").addClass('sideon')
    console.log("on");
});

</script>

</html>