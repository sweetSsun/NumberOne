<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<%@ include file="/resources/css/BarCss.jsp" %>

<style type="text/css">

	.logoimg{
		margin-top: 2%;  
		padding-left: 35%;
	}
	
	.menubar_left{
		margin-top: auto;
		text-align: left;
	}
	
	.menubar_right{
		margin-top: auto;
		text-align: right;
		font-size: 16px;
	}
	
</style>

</head>


<body>
	<header class="bg-white" id="header_menu">
		<div class="container" style="width: 70%;">
		
		
			<div class="row">			
				
				<!-- 로고이미지 -->
				<div class="col-lg-12 col-sm-12" style="min-width: 800px;">
					<a href="${pageContext.request.contextPath }/"><img class="logoimg" style="height:100px; min-width:140px;"src="${pageContext.request.contextPath }/resources/img/logo_bada.png"></a>
					
					<span>					
						<p style="float: left; font-size: 15px; margin-left: 20px; margin-top: 4rem; margin-bottom: 10px;">						
							<a href="admin_loadToAdminMainPage">
							<img class="img-profile rounded-circle" style="height:50px; width:50px" src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png">&nbsp;&nbsp;관리자님</a>
						</p>
			
					 	<!-- 살아남은 미니박수^^~! -->
						 <p style="float: right; font-size: 12.5px; margin-right: 20px; margin-top: 4rem; margin-bottom: 10px;">
							수고해주시는 관리자님께 박수 &nbsp;<img class="img-profile rounded-circle" style="height: 50px; width:50px" src="${pageContext.request.contextPath }/resources/img/clap.png">
						 </p>
					 </span>				 
			 	 </div>
			</div>
			 
			<div class="row">	
				<!-- Home, 커뮤니티, 중고거래 목록 -->
				<div class="col-lg-7 col-md-7 col-sm-7 menubar_left">
					<ul>
						<li style="margin-right: 30px;">
							<a href="loadToBoardMainPage">커뮤니티</a>
						</li>

						<li class="nav-item ">
							<a href="selectResellMainPage">중고거래</a>

						</li>
					</ul>
				</div>
					
				<!-- 로그인, 회원가입, 고객센터 -->
				<div class="col-lg-5 col-md-5 col-sm-5 menubar_right">
					<ul>
						<!-- 로그아웃 -->
						<li style="margin-right: 15px;"><a href="selectMemberLogout">로그아웃</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</header>
	
</body>
<script type="text/javascript">
console.log("스크립트 확인!");

function popupChat(){
	console.log("popupChat 호출");
	let popOption = "width=450px, height=550px, top=300px, left=500px, scrollbars=no, resizable=no";
	let openUrl = 'loadToChat';
	window.open(openUrl, 'pop', popOption);
};

</script>
<!-- 마이페이지 미니브라우저 (커뮤니티부터!) -->
<script type="text/javascript">

   var wMemberPopup = "";
  
   
   function writeMemberBoard(nickname){
      console.log("팝업 스트립트 확인!!!");
      let wMemberPopupUrl = "loadToWriteMemberBoard?nickname="+nickname;
      let wMemberPopupOption = "width=660, height=820, top=300px, left=500px, scrollbars=no, resizable=no";
      
      
      $.ajax({
         url: "selectWriteMemberInfo_ajax",
         data: {"nickname":nickname},
         async:false,
         dataType:"json",
         success:function(result){
           //console.log(result);
            //console.log(nickname);
            wMemberPopup = window.open(wMemberPopupUrl, "", wMemberPopupOption, nickname);
            
            wMemberPopup.window.addEventListener("load", function(){
               wMemberPopup.writeMemberBoard(result);
            });
            
         }
      });
   }

      
   function boardreplySwitch(nickname, type){
         console.log("팝업 작성글 버튼 클릭!!!");
         
         var popUpUrl = "";
         if(type == 'b'){
            popUpUrl = "selectWriteMemberInfo_ajax";
         }else if(type == 'r') {
            popUpUrl = "selectWriteMemberInfoReply_ajax";
         }else if(type == 's') {
           popUpUrl = "selectWriteMemberInfoSellBuy_ajax"; 
         }

         $.ajax({
            url: popUpUrl,   
            data: {"nickname":nickname},
            async:false,
            dataType:"json",
            success:function(result){
               //console.log(result);
               //console.log(nickname);
                  
               if(type == 'b'){
                  wMemberPopup.writeMemberBoard(result);
               }else if(type == 'r') {
                  wMemberPopup.writeMemberReply(result);
               }else if(type == 's') {
                 wMemberPopup.writeMemberSellBuy(result); 
               }

            }
         });
      
   }
   


</script>

<!-- 마이페이지 미니브라우저 (중고거래부터!) -->
<script type="text/javascript">

   var wMemberPopup = "";
  
   
   function writeMemberSellbuy(nickname){
      console.log("(중고거래)팝업 스트립트 확인!!!");
      let wMemberPopupUrl = "loadToWriteMemberBoard?nickname="+nickname;
      let wMemberPopupOption = "width=660, height=820, top=300px, left=500px, scrollbars=no, resizable=no";
      
      
      $.ajax({
         url: "selectWriteMemberInfoSellBuy_ajax",
         data: {"nickname":nickname},
         async:false,
         dataType:"json",
         success:function(result){
           //console.log(result);
            //console.log(nickname);
            wMemberPopup = window.open(wMemberPopupUrl, "", wMemberPopupOption, nickname);
            
            wMemberPopup.window.addEventListener("load", function(){
               wMemberPopup.writeMemberSellBuy(result);
            });
            
         }
      });
   }

      
   function boardreplySwitch(nickname, type){
         console.log("팝업 작성글 버튼 클릭!!!");
         
         var popUpUrl = "";
         if(type == 'b'){
            popUpUrl = "selectWriteMemberInfo_ajax";
         }else if(type == 'r') {
            popUpUrl = "selectWriteMemberInfoReply_ajax";
         }else if(type == 's') {
           popUpUrl = "selectWriteMemberInfoSellBuy_ajax"; 
         }

         $.ajax({
            url: popUpUrl,   
            data: {"nickname":nickname},
            async:false,
            dataType:"json",
            success:function(result){
               //console.log(result);
               //console.log(nickname);
                  
               if(type == 'b'){
                  wMemberPopup.writeMemberBoard(result);
               }else if(type == 'r') {
                  wMemberPopup.writeMemberReply(result);
               }else if(type == 's') {
                 wMemberPopup.writeMemberSellBuy(result); 
               }

            }
         });
      
   }
   


</script>

</html>