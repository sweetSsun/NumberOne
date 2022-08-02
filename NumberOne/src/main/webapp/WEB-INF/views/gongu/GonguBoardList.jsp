<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공구게시판 진행</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listCss.css" type="text/css">
<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
		background-color: white;
	}
	
	.boardList{
		margin: auto;
	}
	.tableCell{
		font-size: 20px;
	}
	#board_column{
		border-bottom: solid #E0E0E0 2px;
	}
	.boardList{
		margin: auto;
	}
	.tableCell{
		font-size: 20px;
	}
	.bdcategory{
		color : gray;
	}
	.bdCategoryList{
		color : #00bcd4;
		border: none;
		font-size: 20px;
	}
	.bdcategorySel{
		font-weight: bold;
		text-align : center;
		color : #00bcd4;
	}
	input{
		border-radius:3px;
		border: solid #E0E0E0 2px;
		height: 28px;
		font-size: 20px;
	}
	.searchType{
		text-align: center;
		border-radius: 5px;
		font-size: 20px;
		border: solid 1px #00bcd4;
	}
	.community{
		background-color: #00bcd4;
	}
	.malmeori{
		display: none;
	}
	#inputSearchText{
		font-size: 18px;
	}
	
	section div.checkout__form{
	/* 페이지 제목 */
	color: #1c1c1c; 
    font-weight: 700; 
    border-bottom: 1px solid #e1e1e1;
    padding-bottom: 20px;
    margin-bottom: 25px;
    font-size : 24px;
}

</style>
</head>
<body>
	    <!-- TopBar -->
        <c:choose>
            <c:when test="${sessionScope.loginId != 'admin'}">
                  <%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
            </c:when>
            <c:otherwise>
                  <%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
            </c:otherwise>
        </c:choose>
        <!-- End of TopBar -->
	
	<main>
		
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Gongu.jsp" %>
		
		<section>
			<!-- 페이지명 -->
			<div class="checkout__form" style="margin-top: 30px;">공구게시판</div>		

		<!-- 본문 -->
			<form action="selectGonguBoardList?gbstate=ing" method="get" id="actionForm">
			<!-- <input type="hidden" name="searchVal" value="all"> -->
			<div class="container">
				<div class="row ">
					<!-- 검색기능 -->
					<div class="col-5" align="right">
							<select name="searchType" class="searchType" id="searchTypeSel">
								<option value="gbTitle">제목</option>
								<option value="gbContents">내용</option>
								<option value="gbTitleContents">제목+내용</option>
							</select>
					</div>
					<div class="col-7 ">
						<input type="text" name="keyword" placeholder="검색어를 입력하세요" id="inputSearchText">
						<button class="btn btn-sm btn-secondary">검색</button>
					</div>
				</div>		
			</div>
			<div class="row" style="margin-top: 20px;">
					
			</div>
				
			<div class="community" style="text-align:center;">
				<span style="font-size:21px;" class="fw-bold text-white">공구게시판</span>
			</div>
				
				<!-- 게시글 목록 -->
				<div class="row">
				<table class="boardList">
					<thead >
						<tr class="text-center" id="board_column">
							<td style="font-size: 17px;">글번호</td>
							<td style="font-size: 17px;">카테고리</td>
							<td style="font-size: 17px;">제목</td>
							<td style="font-size: 17px;">작성자</td>
							<td style="font-size: 17px;">날짜</td>
							<td style="font-size: 17px;">조회</td>
						</tr>
						
						<c:forEach items="${noticeList_fix }" var="notice_fix">
							<c:if test="${notice_fix.nbfix == 1 }">
							<!-- 공구게시판 : 상단에 띄울 고정 공지-->
							<tr class="fw-bold" style="border-bottom: solid #E0E0E0 1px;">
								<td class="text-center tableCell">${notice_fix.nbcode}</td>
								<td class="text-center tableCell"></td>
								<td class="tableCell">
									<a href="selectGonguBoardView?codeIdx=${notice_fix.nbcode }">${notice_fix.nbtitle}</a>
								</td>
								<td class="text-center tableCell">관리자</td>
								<td class="text-center tableCell">${notice_fix.nbdate}</td>
								<td class="text-center tableCell">${notice_fix.nbhits }</td>
							</tr>
							</c:if>
						</c:forEach>
					</thead>
					
					<!-- gbstate == 1 인 일반 공구들 -->
					<tbody id="bdCategoryList">
					<c:forEach items="${GonguList }" var="gongu">
						<c:if test="${gongu.gbstate == 1 }">
						<%-- <c:if test="${gongu.gbfix != 1 }"> --%>
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td class="text-center tableCell">${gongu.gbcode}</td>
							<td class="bdcategory text-center tableCell">진행</td>
							<td class="tableCell">
								<a href="selectGonguBoardView${paging.makeQueryPage(gongu.gbcode, paging.page)}">${gongu.gbtitle}
							 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;"></span> </a>
							</td>
							<td class="text-center tableCell">
								관리자
							</td>
							<td class="text-center tableCell">${gongu.gbdate}</td>
							<td class="text-center tableCell">${gongu.gbhits }</td>
						</tr>
						</c:if>
					</c:forEach>
					</tbody>
				</table>
				<%-- <div align="right" class="col mt-2">
					<c:if test="${sessionScope.loginId == 'admin' }">
						<button  onclick="loadToBoardWrite()" style="background-color:gray;" class="btn btm-sm fw-bold text-white writeButton">글작성</button>
					</c:if>
				</div> --%>
				</div>

				<!-- 페이징 시작 -->
				<input type="hidden" id="pageNum" name="page" value="1">
				<div class="block text-center" id="pageList" >
					<ul class="pagination">
					<c:choose>
		           		<c:when test="${paging.prev }">
		           			<li class="paginate_button"><a href="${paging.page -1 }" >이전</a></li>
		           		</c:when>
		           		<c:otherwise>
	           				<li class="paginate_button"><span>이전</span></li>
		           		</c:otherwise>
  					</c:choose>
	               	
	               	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="num" step="1">
	                	<c:choose>
	                		<c:when test="${paging.page == num }">
	                			<li class=""><a class="active">${num }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="paginate_button"><a href="${num }" >${num }</a></li>
	                		</c:otherwise>
	                	</c:choose>
	               	</c:forEach>
	               	
	               	<c:choose>
		           		<c:when test="${paging.next }">
		                	<li class="paginate_button"><a href="${paging.page +1 }" >다음</a></li>
		           		</c:when>
		           		<c:otherwise>
	           				<li class="paginate_button"><span>다음</span></li>
		           		</c:otherwise>
  					</c:choose>
					</ul>
				</div>
				<!-- 페이징 끝 -->
			</form>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	//선택한 검색 select option 으로 선택되도록 하기 
	var searchOption = $("#searchTypeSel option");
	var searchType = "${paging.searchType}";
	if ( searchType.length > 0 ){
		for ( var i = 0; i<searchOption.length; i++){
			if (searchOption.eq(i).val() == searchType){
				searchOption.eq(i).attr("selected", "selected");
			}
		}	
	}
</script>
<script type="text/javascript">
	var actionForm = $("#actionForm");
	// $(".paginate_button a").click(function(e){ // click 이벤트는 동적 처리 불가능
	$(document).on("click", ".paginate_button a", function(e){ // on 이벤트로 변경
		e.preventDefault();
		console.log("pageNum click");
		$("#pageNum").val($(this).attr("href"));
		console.log($("#pageNum").val());
		actionForm.submit();
	});
</script>
<script type="text/javascript">

</script>
<script type="text/javascript">

	/* 선택한 검색 select option으로 선택되도록 하기 */
	var searchOption = $("#searchTypeSel option");
	console.log("searchOption.length : " + searchOption.length);
	var searchType = "${paging.searchType}";
	if( searchType.length > 0 ){
		for ( var i=0; i<searchOption.length; i++){
			if( searchOption.eq(i).val() == searchType ){
				searchOption.eq(i).attr("selected", "selected");
			}
		}
	}
	
	var keyword = '${paging.keyword}';
	if( keyword.length > 0 ){
		$("#inputSearchText").val(keyword);
	}
	
</script>



</html>