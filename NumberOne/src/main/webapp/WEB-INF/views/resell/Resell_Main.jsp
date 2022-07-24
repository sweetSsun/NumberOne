<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 메인</title>

<!-- BarCss 삭제 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>
	
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"
>


<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#pageList button {
	display: none;
}

label {
	cursor: pointer;
}

section {
	max-width: 70%;
	margin: auto;
	margin-top: 0%;
}

.d_none {
	display: none;
}

.scroll::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
	cursor: default;
}

.scroll::-webkit-scrollbar-thumb {
	height: 5%; /* 스크롤바의 길이 */
	background: #999999; /* 스크롤바의 색상 */
	border-radius: 10px;
}

.scroll::-webkit-scrollbar-track {
	background: #EAEAEA; /*스크롤바 뒷 배경 색상*/
}

.bdcategory {
	color: #00bcd4;
}

.bdCategoryList {
	color: #00bcd4;
	border: none;
	font-size: 18px;
}

.bdcategorySel {
	font-weight: bold;
	text-align: center;
	color: #00bcd4;
}

input {
	border-radius: 3px;
	border: solid #E0E0E0 2px;
	height: 28px;
	font-size: 20px;
}

.searchType {
	text-align: center;
	border-radius: 5px;
	font-size: 18px;
	border: solid 1px #00bcd4;
}

#inputSearchText {
	font-size: 18px;
}

.pagination {
	width: 20rem ! important;
	display: inline-block ! important;
	margin-left: auto ! important;
	margin-right: auto ! important;
	margin-top: 1rem ! important;
	font-size: 18px ! important;
}

.pagination a {
	color: black ! important;
	padding: 6px 12px ! important;
	text-decoration: none ! important;
	border-radius: 5px ! important;
}

.pagination span {
	color: black ! important;
	padding: 6px 12px ! important;
	text-decoration: none ! important;
	border-radius: 5px ! important;
}

.pagination a.active {
	background-color: #00bcd4 ! important;
	border-radius: 5px ! important;
	color: white ! important;
}

.bigger {
	font-size: 2rem;
}

.bdCategoryList {
	color: #00bcd4;
	border: none;
	font-size: 18px;
	margin-left: 2%;
}

.bdcategorySel {
	font-weight: bold;
	text-align: center;
	color: #00bcd4;
}

.bold {
	font-weight: bold;
}

/* List CSS */

#regionList {
	width: 100%;
	height: 100%; 
	margin: auto; 
	padding-top : 10px;
	overflow: hidden;
	padding-top: 10px;
	
}

div.row.sellbuyhead{
	margin-top : 2 rem;
	background-color : #00bcd4;
	margin-left : 0%; 
	margin-right : 0%; 	
	height : 3.2rem;
}


div.col.mb-2 h3{ color : white; }

.float_ {
	width: 33.3333333%;
	height: 40rem;
	float: left;
	padding: 1%; 

}

#sellbuyscreen{
	width: 100%;
	height: 34rem;
	margin-bottom: 10px;
}

#sellbuyscreen > a > img {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	object-fit:cover;
}

.bottom {
	font-size:2rem; 
	padding: 0px;
	margin: 0px 0px;
	width : 100%;
	height: 2.4rem;
	overflow: hidden;
	color: initial;
}

#sellList, #buyList{
	height : 43rem;
	/* border : 1px solid  #00bcd4; */
}
</style>
</head>
<body>

	<!-- TopBar -->


	<c:choose>
		<c:when test="${sessionScope.loginId != 'admin'}">
			<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/includes/TopBar_Admin.jsp"%>
		</c:otherwise>
	</c:choose>

	<!-- End of TopBar -->
	<main>
		<!-- 사이드바 -->

		<%@ include file="/WEB-INF/views/includes/SideBar_Resell.jsp"%>
		<!-- 사이드바 End-->
		
					
				<!--팔구 div 시작  -->
	<section>
		<div id="regionList">
				<div class="row sellbuyhead">
					<div class="col mb-2" style="padding-top:0.2rem;">
						<h3 style="font-size:2.3rem; font-weight:700;">팔구</h3>
					</div>
					<div align="right" class="col" style="padding-top:0.45rem;">
						<span style="font-size:1.6rem;"> <a href="selectResellPageList?sellBuy=S" style="color:gold !important; font-weight:bold;"><i class="fa-solid fa-square-plus"></i>&nbsp;&nbsp;더보기</a></span>
					</div>
				</div>
			<div id="sellList">
				<c:forEach items="${SellList}" var="sellList">
					<div class="float_">
						<div id="sellbuyscreen">
							<a href="selectResellView?ubcode=${sellList.ubcode }&ubsellbuy=${sellList.ubsellbuy }&modifyCheck=LIST">
								<img
									alt=""
									src="${pageContext.request.contextPath }/resources/img/resell/${sellList.ubmainimg }"
								>
							</a>
						</div>
						<div class="bottom" style="font-weight:600; position:relative;">
							<span class="soldCheckMsg_ bold"></span>
							<a href="selectResellView?ubcode=${sellList.ubcode }&ubsellbuy=${sellList.ubsellbuy }&modifyCheck=LIST">${sellList.ubtitle }</a>
						</div>
						<div style="height:2rem; font-size:1.6rem; padding:0; color:grey;">${sellList.ubdatedef }&nbsp;
							<span style="color:red; font-size:1.8rem;">
								<i class='fa-regular fa-heart'></i>
							</span>
						</div>
						<div class="bottom" style="font-size:1.7rem; font-weight:600; position:relative;">
							<span onclick="writeMemberSellbuy('${sellList.ubnickname }')" style="height:1.8rem; font-size:1.6rem; padding:0; color:initial; cursor:pointer;">${sellList.ubnickname }</span>
						</div>
					</div>
				</c:forEach>

				<div style="height: 20px; float: left; width: 33.3333333%;"></div>
			</div>

				<!--팔구 div 끝  -->	

				<!--사구 div 시작  -->

			
 				<div class="row sellbuyhead" style="clear:both; margin-top:50px;">
					<div class="col mb-2" style="padding-top:0.2rem;">
						<h3 style="font-size:2.3rem; font-weight:700;">사구</h3>
					</div>
					<div align="right" class="col" style="padding-top:0.45rem;">
						<span style="font-size:17px;"> <a href="selectResellPageList?sellBuy=B" style="color:gold !important; font-weight:bold;"><i class="fa-solid fa-square-plus"></i>&nbsp;&nbsp;더보기</a></span>
					</div>
				</div> 

			<div id="buyList">
				
				<c:forEach items="${BuyList}" var="buyList">
					<div class="float_">
						<div id="sellbuyscreen">
							<a href="selectResellView?ubcode=${buyList.ubcode }&ubsellbuy=${buyList.ubsellbuy }&modifyCheck=LIST">
								<img
									alt=""
									src="${pageContext.request.contextPath }/resources/img/resell/${buyList.ubmainimg }"
								>
							</a>
						</div>
						<div class="bottom" style="font-weight:600; position:relative;">
							<span class="soldCheckMsg_ bold"></span>
							<a href="selectResellView?ubcode=${buyList.ubcode }&ubsellbuy=${buyList.ubsellbuy }&modifyCheck=LIST">${buyList.ubtitle }</a>
						</div>
						<div style="height:2rem; font-size:1.6rem; padding:0; color:grey;">${buyList.ubdatedef }&nbsp;
							<span style="color:red; font-size:1.8rem;">
								<i class='fa-regular fa-heart'></i>
							</span>
						</div>
						<div class="bottom" style="font-size:1.7rem; font-weight:600; position:relative;">
							<span onclick="writeMemberSellbuy('${buyList.ubnickname }')" style="height:1.8rem; font-size:1.6rem; padding:0; color:initial; cursor:pointer;">${buyList.ubnickname }</span>
						</div>
						<input
							type="hidden"
							class="ubstate_"
							value="1"
						>
					</div>
					
				</c:forEach>
						
			</div>




			</div>
			<div style="clear: left;"></div>

					<!-- 사구 div끝  -->

			</div>
		</section>
		
		
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"
	></script>

</body>


<script type="text/javascript">
   var checkMsg = '${msg}';
   if ( checkMsg.length > 0 ){
      alert(checkMsg);
   }
</script>

<script type="text/javascript">

   /* 로그인된 회원인지 체크 */
   let loginCheck = '${sessionScope.loginId}';
   if (loginCheck.length == 0) {
      alert("로그인 후 이용가능합니다");
      location.href = "loadToLogin"

   function searchKeyword() {
      var searchType = document.getElementById("searchType").value;
      console.log(searchType);
      var keyword = document.getElementById("keyword").value;
      console.log(keyword);
      if (searchType == 'sell') {
         location.href = "selectResellPageList?sellBuy=S&searchType="
               + searchType + "&keyword=" + keyword;
      } else {
         location.href = "selectResellPageList?sellBuy=B&searchType="
               + searchType + "&keyword=" + keyword;
         ;
      }

   }
</script>


</html>