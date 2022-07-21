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
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
				        제목1
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
				      <div class="accordion-body">
				        내용1
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
				        제목2
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
				      <div class="accordion-body">
				        내용2
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