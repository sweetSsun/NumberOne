<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1인자 - 중고거래 팔구게시판</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"
	referrerpolicy="no-referrer"></script>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/dadeda074b.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/resell.css" type="text/css">


</head>
<body>
	<!-- TobBar -->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End of TobBar -->

	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp"%>

		<section>
			<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">중고거래 팔구게시판</h1>
				<div class="d_top">

					<div class="flex_div flex-p0 flex_between">
						<div class="item_start">
							<select class="select-size" onchange="selectRegion(1)" id="regionInfo">
								<option value="전국">전국</option>
								<option value="서울">서울</option>
								<option value="인천">인천</option>
								<option value="경기">경기</option>
								<option value="충청">충청</option>
								<option value="전라">전라</option>
								<option value="경상">경상</option>
								<option value="제주">제주</option>

							</select> <span class="regionCheck" id="mregion">전국목록</span>
						</div>

						<c:if test="${sessionScope.loginId != null }">
							<div class="item_end">
								<a href="loadToResellWriteForm?sell_buy=S">글작성</a>
							</div>
						</c:if>
					</div>

					<div class="flex_div flex-p0 flex_center">
						<div class="search-bar">
							<div class="flex_div flex-p0 flex_between">
								<div class="item_start">
									<select id="searchType">
										<option value="ubtitle">제목</option>
										<option value="ubmid">작성자</option>
										<option value="total">제목+내용</option>

									</select>
								</div>
								<div>
									<input class="search-bar_input" type="search" placeholder="검색" id="keyword">
								</div>
							</div>
							<div class="">
								<button onclick="searchKeyword(1)">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>


					</div>
				</div>

				<div class="d_body">
					<div class="text-left">
						팔구게시판
						<div></div>
					</div>

					<div class="list_grid grid_m grid_m-t" id="regionList">

						<c:forEach items="${sell_buyList}" var="sell_List">

							<div class="flex_div">

								<div class="flex_div flex-p2 ">
									<div class="">
										<a href="selectResellView?ubcode=${sell_List.ubcode }&ubsellbuy=${sell_List.ubsellbuy }&modifyCheck=LIST"><img alt=""
											src="${pageContext.request.contextPath }/resources/img/resell/${sell_List.ubmainimg }" class="img_size"></a>
									</div>

								</div>

								<div class="flex_card ">
									<div class="card_top">
										<a href="selectResellView?ubcode=${sell_List.ubcode }&ubsellbuy=${sell_List.ubsellbuy }}&modifyCheck=LIST">${sell_List.ubtitle }</a>
									</div>

									<div class="card_body font-s text-right padding-right text-bold">${sell_List.ubnickname }</div>


									<div class="card_footer font-s text-right padding-right">${sell_List.ubdate }</div>

								</div>
							</div>
						</c:forEach>

					</div>

					<div class="flex_div flex_center">

						<div id="pageNumber">
							<c:choose>
								<c:when test="${paging.page <=1 }">
                   [이전]
                   </c:when>
								<c:otherwise>
									<a href="selectResellPageList?page=${paging.page-1 }&sellBuy=S"> [이전]</a>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" step="1">
								<c:choose>
									<c:when test="${paging.page == num }">
										<span style="font-size: 20px">&nbsp;${num }&nbsp;</span>
									</c:when>
									<c:otherwise>
										<a href="selectResellPageList?page=${num}&sellBuy=S">${num }</a>
									</c:otherwise>

								</c:choose>

							</c:forEach>
							<c:choose>
								<c:when test="${paging.page >= paging.maxPage }">
                       [다음]
                       </c:when>
								<c:otherwise>
									<a href="selectResellPageList?page=${paging.page+1 }&sellBuy=S">[다음]</a>
								</c:otherwise>

							</c:choose>

						</div>

					</div>
				</div>

				<!-- 팔구div끝  -->

			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
//현재 페이지가 출력될 때 checkData 함수 실행
		var selRegion = regionInfo.options[regionInfo.selectedIndex].value;
		const loginRegion = '${sessionScope.loginRegion}'; 
		const checkSearch = '${checkSearch}';   //검색확인용
	window.onload = function(){
		const regionInfo = document.getElementById("regionInfo"); 
		// ID가 'regionInfo'인 select태그의 option들 중 선택된 인덱스의 option태그 value를 변수에 저장
		console.log("선택된지역" + selRegion);
		const checkMsg = '${msg}';   //글작성 확인용
		if(checkMsg.length >0){		// 파라메터를 확인해서 단순 목록페이지이동인지, 글작성 후 페이지이동 인지 확인 
			alert(checkMsg);  // 글작성 후 페이지이동 했을 시에만 글작성 성공메시시출력
		}
			
			
		if(checkSearch=='OK'){ // 검색을 통해 페이지이동해 왔을 때 		
			document.getElementById("mregion").innerText = "[" + selRegion
			+ "] 지역 목록입니다.";		
			//ID가 'mregion인 태그의 Text부분에 selRegion(선택된 option의 value가 저장된 변수)을 출력.
			// 수정****   검색을 통해 이동해 왔을 시 Text를 '' <- 공백으로 처리하고
			//           중앙에 [검색어] 로 검색된 목록입니다.' 라는 메세지 출력하자
		}
		else{     
			//checkSearch의 값이 'OK' 가 아닐경우 선택된 지역이 없으므로, 페이지 접속 시 회원의 관심지역이 자동 선택되어 출력되도록 한다.	
			selRegion = loginRegion;  //회원의 관심지역을 선택된option의 value에 덮어쓰기.
			console.log("관심지역" + selRegion);
			document.getElementById("mregion").innerText = "[" + selRegion
			+ "] 지역 목록입니다.";        // 덮어씌워진 값을 ID가 mregion인태그의 Text에 출력
			
			for(var i =0; i<regionInfo.options.length; i++){
				//select 태그가 갖고있는 option의 갯수(길이)만큼 반복문을 실행한다.
				if(regionInfo.options[i].value==selRegion){
					 //option의 value 와 회원의 관심지역이 일치하는지 확인		
					regionInfo.options[i].selected = "true";
					 // 일치하는 경우 그 option에 selected 속성을 주어 선택되도록 한다.
				}			
			}
		}	

	
};


</script>

<!-- 지역 검색 -->
<script type="text/javascript">

	var output_page = '';
	var output_pagerNum = '';

	/* 지역선택 이벤트  */
	
	function selectRegion(page) {
		console.log("selectRegion이벤트 호출");
		selRegion = regionInfo.options[regionInfo.selectedIndex].value;
		//선택된 option의 value를 변수에 저장.
		$.ajax({   //ajax를 통해 선택된 지역의 목록을 가져온다.
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					data : {
						"searchVal" : selRegion,
						"sellBuy" : 'S',
						"ajaxCheck" : 'REGION',
						"page" : page
					},
					success : function(result) {
						 output_page = '';
						alert("성공");
						console.log("결과 : " + result);
						listOutput(result);	//목록 출력용 함수
						document.getElementById("regionList").innerHTML = output_page;
					}

				})

		
		$.ajax({	// 페이지 번호 출력용 ajax
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					data : {					
						"searchVal" : selRegion,
						"sellBuy" : 'S',
						"ajaxCheck" : 'PAGE',
						"page" : page
					},
					success : function(result) {
						alert("page_ajax");
						console.log("결과페이지 : " + result.page);
						output_pagerNum = '';
						if (result.page <= 1) {
							output_pagerNum = '[이전]';
						}
						else {
							output_pagerNum = '<button onclick="selectRegion('
									+ (result.page - 1) + ')">[이전]</button>';
						}
						for (var i = 1; i <= result.endPage; i++) {

							if (result.endPage == i) {
								output_pagerNum += '<span style=\"font-size: 20px\">&nbsp;'
										+ i + '&nbsp;</span>';
							} else {
								output_pagerNum += '<button onclick="selectRegion('
										+ i + ')">' + i + '</button>';
							}
						}
						if (result.page >= result.maxPage) {
							output_pagerNum += '[다음]';
						} else {
							output_pagerNum += '<button onclick="selectRegion('
									+ (result.page + 1) + ')">[다음]</button>';
						}
						document.getElementById("pageNumber").innerHTML = output_pagerNum;
					}
				})

		document.getElementById("mregion").innerText = "[" + selRegion
				+ "] 지역 목록입니다.";
	}
</script>

<!-- 검색 스크립트  -->
<script type="text/javascript">
 /* 검색버튼 클릭시 이벤트함수 */	 
	function searchKeyword(page){
		var searchType = document.getElementById("searchType").value;
		console.log(searchType);
		var keyword = document.getElementById("keyword").value;
		console.log(keyword);
		//검색버튼의 click 이벤트 발생시  선택된 검색타입과 작성된 검색어를 변수에 담는다.
		
	$.ajax({   // 검색타입과 검색어에 일치하는 목록을 불러오기 위한 ajax
			type : "get",
			url : "selectResellRegionList_ajax",
			dataType : "json",
			data : {"keyword" : keyword, "sellBuy" : "S", "ajaxCheck" : 'REGION', "searchVal" : selRegion, "searchType" : searchType},
			success : function(result){
				console.log("결과 : "+result);
				output_page = '';
					listOutput(result);  //목록 출력용 함수
					
				document.getElementById("regionList").innerHTML = output_page;
			}					
	})
	
	$.ajax({	//검색된 목록의 페이지번호 출력을 위한 ajax
					type : "get",
					url : "selectResellRegionList_ajax",
					dataType : "json",
					data : {
						"keyword" : keyword,
						"searchVal" : selRegion,
						"sellBuy" : 'S',
						"ajaxCheck" : 'PAGE',
						"page" : page,
						 "searchType" : searchType
					},
					success : function(result) {
						output_pagerNum = '';
						alert("page_ajax");
						console.log("결과페이지 : " + result.page);
						
						if (result.page <= 1) {
							output_pagerNum = '[이전]';
						}
						else {
							output_pagerNum = '<button onclick="searchKeyword('
									+ (result.page - 1) + ')">[이전]</button>';
						}
						for (var i = 1; i <= result.endPage; i++) {

							if (result.endPage == i) {
								output_pagerNum += '<span style=\"font-size: 20px\">&nbsp;'
										+ i + '&nbsp;</span>';
							} else {
								output_pagerNum += '<button onclick="searchKeyword('
										+ i + ')">' + i + '</button>';
							}
						}
						if (result.page >= result.maxPage) {
							output_pagerNum += '[다음]';
						} else {
							output_pagerNum += '<button onclick="searchKeyword('
									+ (result.page + 1) + ')">[다음]</button>';
						}
						document.getElementById("pageNumber").innerHTML = output_pagerNum;
					}
				})
	}
	
</script>

<!-- 페이지 출력 함수 --> 
<script type="text/javascript">

function listOutput(result){
	
	for ( var i in result) {
				
	output_page += '<div class=\"flex_div\">'
		+ '<div class=\"flex_div flex-p2\">'
		+ '<div class=\"\">'
		+ '<a href=\"selectResellView?ubcode='+result[i].ubcode+'&ubsellbuy='+result[i].ubsellbuy+'&modifyCheck=LIST\"><img alt=\"\"'
		+ 'src=\"${pageContext.request.contextPath }/resources/img/resell/'+result[i].ubmainimg+'\" class=\"img_size\"></a>'
		+ '</div>'
		+ '</div>'
		+ '<div class=\"flex_card\">'
		+ '<div class=\"card_top\">'
		+ '<a href=\"selectResellView?ubcode='+result[i].ubcode+'&ubsellbuy='+result[i].ubsellbuy+'&modifyCheck=LIST\">'+result[i].ubtitle+'</a>'
		+ '</div>'
		+ '<div class=\"card_body font-s text-right padding-right text-bold\">'
		+ result[i].ubnickname
		+ '</div>'
		+ '<div class=\"card_footer font-s text-right padding-right\">'
		+ result[i].ubdate + '</div></div>'
		+ '</div>';
	}
}
</script>

</html>