<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%@ include file="/resources/css/BarCss.jsp" %>

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
				<div class="sideclose_room">
					<span>
						<a href="#" title="채팅"><i class="fa-solid fa-comment-dots"></i></a>
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
				
				
				<div class="dropdown sideroom">
					  <a id="drop_sell" class="sideregion_title dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="true">
					    <i class="fa-solid fa-store"></i>&nbsp;&nbsp;팔구
					  </a>
					
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
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
				
				
				<div class="dropdown sideroom">
					  <a id="drop_buy" class="sideregion_title dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="true">
					    <i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;사구
					  </a>
					
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					  	<li>
					    	<table class="sideregion_tags">
					    		<tr>
									<td><a href="selectResellPageList?sellBuy=B">전체</a></td>
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
				
				
				<div id="chatroom" class="sideroom">
					<span>
						<a href="#"><i class="fa-solid fa-comment-dots"></i>&nbsp;&nbsp;채팅</a>
					</span>
				</div>
				
			</div>
			
			
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	

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



$('#drop_sell').click(function() {
	if($("#drop_buy").hasClass('padding_plus')){		
		$("#drop_buy").removeClass('padding_plus')
		$("#chatroom").removeClass('padding_plus')
	} else{
		$("#drop_buy").addClass('padding_plus')
		$("#chatroom").addClass('padding_plus')
	}
	
});

$('#drop_buy').click(function(){
	if($("#drop_buy").hasClass('padding_plus')){
		if($("#chatroom").hasClass('padding_plus')){
			$("#drop_buy").removeClass('padding_plus')
			$(".dropdown-menu").css("transform","translate(0px, 43px)");
		}
	} else {
		if($("#chatroom").hasClass('padding_plus')){
			$("#chatroom").removeClass('padding_plus')
		} else{
		$("#chatroom").addClass('padding_plus')
		}
	}
});

	
</script>

</html>