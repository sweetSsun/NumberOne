<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 검색결과 페이지</title>
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ include file="/resources/css/BarCss.jsp" %>
<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
		background-color: white;
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
		color : #00bcd4;
	}
	.bdCategoryList{
		color : #00bcd4;
		border: none;
		font-size: 18px;
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
		font-size: 18px;
		border: solid 1px #00bcd4;
	}
	#inputSearchText{
		font-size: 18px;
	}
	.community{
		background-color: #00bcd4;
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
		<!-- 본문 -->
			<div class="container">
				<div class="row" style="margin:auto;">
					<h2 class="text-center">검색결과 페이지 : BoardSearchList.jsp</h2>
				</div>
				<form action="selectBoardSearchList" method="get" onsubmit="return searchTextCheck();">
					<c:choose>
						<c:when test="${bdcategory != null }">
							<input type="hidden" name="bdcategory" value="${bdcategory }">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="bdcategory" value="">
						</c:otherwise>
					</c:choose>
					
					<div class="row ">
						<!-- 검색기능 -->
						<div class="col-5" align="right">
								<select name="searchType" class="searchType">
									<option value="bdtitle">제목</option>
									<option value="bdcontents">내용</option>
									<option value="bdtitlecontents">제목+내용</option>
									<option value="bdnickname">작성자</option>
								</select>
						</div>
						<div class="col-7 ">
							<input type="text" name="searchText" placeholder="검색어를 입력하세요" id="inputSearchText">
							<button class="btn btn-sm btn-secondary">검색</button>
						</div>
					</div>		
				</form>
						
				</div>
				
				<div class="row mt-3 mb-3">
					<!-- 검색결과 안내  -->
					<h3 class="text-center">[ <span class="text-info">${param.searchText}</span> ] 로 검색한 결과 입니다.</h3>  
				</div>
				
				<c:choose>
					<c:when test="${bdcategory == '' }">
						<div class=" community" style="text-align:center;">
							<span style="font-size:21px;" class="fw-bold text-white">전체게시판 검색 결과</span>
						</div>
					</c:when>
					
					<c:otherwise>
						<div class=" community" style="text-align:center;">
							<span style="font-size:21px;" class="fw-bold text-white">${bdcategory}게시판 검색 결과</span>
						</div>			
					</c:otherwise>
				</c:choose>
				
				<!-- 게시글 목록 -->
				<div class="row">
				<table class="boardList">
					<thead >
						<tr class="text-center" id="board_column">
							<td style="font-size: 17px;">글번호</td>
							<td style="font-size: 17px;">말머리</td>
							<td style="font-size: 17px;">제목</td>
							<td style="font-size: 17px;">작성자</td>
							<td style="font-size: 17px;">날짜</td>
							<td style="font-size: 17px;">조회</td>
							<td style="font-size: 17px;">추천</td>
						</tr>
						
					</thead>
					
					<tbody id="bdCategoryList">
					<!-- 일반게시판 목록 -->
					<c:forEach items="${searchBdList }" var="searchBd">
						<c:if test="${searchBd.bdcategory != '자랑' }">
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td class="text-center tableCell">${searchBd.bdcode}</td>
							<td class="bdcategory text-center tableCell">${searchBd.bdcategory}</td>
							<td class="tableCell">
							 	<a href="selectBoardView?bdcode=${searchBd.bdcode }">${searchBd.bdtitle} 
							 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${searchBd.bdrpcount }</span> </a>
							 </td>
							<td class="text-center tableCell">
								<a href="#">${searchBd.bdnickname}</a>
							</td>
							<td class="text-center tableCell">${searchBd.bddate}</td>
							<td class="text-center tableCell">${searchBd.bdhits }</td>
							<td class="fw-bold text-center tableCell" style="color: #00bcd4;">${searchBd.bdrccount}</td>
						</tr>
						</c:if>
					</c:forEach>
					</tbody>
				</table>
				<div align="right" class="col mt-2">
					<c:if test="${sessionScope.loginId != null }">
						<button  onclick="loadToBoardWrite()" style="background-color:#00bcd4;" class="btn btm-sm fw-bold text-white writeButton">글작성</button>
					</c:if>
				</div>
				</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	
</script>

<script type="text/javascript">

	/* 글쓰기 버튼 클릭 */
	function loadToBoardWrite(){
		//글작성 페이지로 이동 
		var bdcategory = "";
		location.href= "loadToBoardWrite?bdcategory="+bdcategory;
	}

	/* 게시판 말머리 선택 */
	function bdCategorySel(categorySel){
		console.log("categorySel: " + categorySel);
		
		var output = "";
		$.ajax({
			type : "get",
			url : "getBoardCategoryList_ajax",
			data : { "bdcategory" : categorySel},
			dataType : "json",
			async : false,
			success : function(bdCategoryList){
				console.log(bdCategoryList);
				
				for(var i = 0; i< bdCategoryList.length; i++ ){
					output += "<tr style=\"border-bottom: solid #E0E0E0 1px;\">";
					output += "<td class=\"text-center\">" + bdCategoryList[i].bdcode + "</td>";
					output += "<td class=\"bdcategory text-center\">" + bdCategoryList[i].bdcategory + "</td>";
					output += "<td><a href='selectBoardView?bdcode=" + bdCategoryList[i].bdcode + "'>" + bdCategoryList[i].bdtitle + "</a>"
					output += "<span class=\"fw-bold\" style=\"font-size:15px; color:#00bcd4;\">&nbsp;" + bdCategoryList[i].bdrpcount + "</span></td>"
					output += "<td class=\"text-center\"><a href=\"#\">" + bdCategoryList[i].bdnickname + "</a></td>";
					output += "<td class=\"text-center\">" + bdCategoryList[i].bddate + "</td>";
					output += "<td class=\"text-center\">" + bdCategoryList[i].bdhits + "</td>";
					output += "<td class=\"text-center text-info fw-bold\">" + bdCategoryList[i].bdrccount + "</td>";
					output += "</tr>";
				}
			}
		});
		$("#bdCategoryList").html(output);
	}
	
</script>
<script type="text/javascript">
	function searchTextCheck(){
		/* 검색어 입력유무 확인 */
		var inputSearchText = $("#inputSearchText").val();
		
		if( inputSearchText.length == 0 ){//검색어를 입력하지 않았으면 
			alert("검색어를 입력해주세요!");
		
			return false;
		}
	}
</script>

</html>