<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 후기게시판</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>  
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- Css Styles -->
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
		color : #00bcd4;
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
	#inputSearchText{
		font-size: 18px;
	}
   .bdnickname:hover{
   	color:#00bcd4;
   }
	/* 별찍기  */
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 1em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}

#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    color: #00bcd4;
}
.None_rate{
	color: #F0F0F0;
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
		<!-- 페이지명 -->
		<div class="checkout__form" style="margin-top: 30px;">일반게시판</div>
		<!-- 본문 -->
			<form action="selectCategoryBoardList" method="get" id="actionForm">
			<div class="container">
				<input type="hidden" name="searchVal" value="후기">
					<div class="row ">
						<!-- 검색기능 -->
						<div class="col-5" align="right">
								<select name="searchType" id="searchTypeSel" class="searchType">
									<option value="bdTitle">제목</option>
									<option value="bdContents">내용</option>
									<option value="bdTitleContents">제목+내용</option>
									<option value="bdNickname">작성자</option>
								</select>
						</div>
						<div class="col-7 ">
							<input type="text" name="keyword"  placeholder="검색어를 입력하세요" id="inputSearchText">
							<button class="btn btn-sm btn-secondary">검색</button>
						</div>
					</div>		
				</div>
				<div class="row" style="margin-top: 20px;">
					
				</div>
				
				<div class=" community" style="text-align:center;">
					<span style="font-size:21px;" class="fw-bold text-white">${paging.searchVal }게시판</span>
				</div>
				
				<!-- 게시글 목록 -->
				<div class="row">
				<table class="boardList">
					<thead >
						<tr class="text-center" id="board_column">
							<td style="font-size: 17px;">글번호</td>
							<td style="font-size: 17px;">별점</td>
							<td style="font-size: 17px;">제목</td>
							<td style="font-size: 17px;">작성자</td>
							<td style="font-size: 17px;">날짜</td>
							<td style="font-size: 17px;">조회</td>
							<td style="font-size: 17px;">추천</td>
						</tr>
						
						<c:forEach items="${noticeList }" var="notice">
							<c:if test="${notice.nbfix == 1 }">
							<!-- 공지게시판 -->
							<tr class="fw-bold" style="border-bottom: solid #E0E0E0 1px;">
								<td class="text-center tableCell">${notice.nbcode}</td>
								<td></td>
								<td class="tableCell">
									<a href="selectNoticeBoardView${paging.makeQueryPage(notice.nbcode, paging.page)}">${notice.nbtitle}</a>
								</td>
								<td class="text-center tableCell">관리자</td>
								<td class="text-center tableCell">${notice.nbdate}</td>
								<td class="text-center tableCell">${notice.nbhits }</td>
								<td></td>
							</tr>
							</c:if>
						</c:forEach>
					</thead>
					
					<tbody id="bdCategoryList">
					<!-- 일반게시판 목록 -->
					<c:forEach items="${boardList }" var="board">
						<tr style="border-bottom: solid #E0E0E0 1px;">
							<td class="text-center tableCell">${board.bdcode}</td>
							<td class="bdcategory text-center tableCell">
								<div class="col" class="mb-3"  id="myform">
									<c:choose>
										<c:when test="${board.bdrate == 1 }">
											 <span>★</span>
											 <span class="None_rate">★</span>
											 <span class="None_rate">★</span>
											 <span class="None_rate">★</span>
											 <span class="None_rate">★</span>
										</c:when>
										
										<c:when test="${board.bdrate == 2 }">
											 <span>★</span>
											 <span>★</span>
											 <span class="None_rate">★</span>
											 <span class="None_rate">★</span>
											 <span class="None_rate">★</span>
										</c:when>
										
										<c:when test="${board.bdrate == 3 }">
											 <span>★</span>
											 <span>★</span>
											 <span>★</span>
											 <span class="None_rate">★</span>
											 <span class="None_rate">★</span>
										</c:when>
										
										<c:when test="${board.bdrate == 4 }">
											 <span>★</span>
											 <span>★</span>
											 <span>★</span>
											 <span>★</span>
											 <span class="None_rate">★</span>
										</c:when>
										
										<c:when test="${board.bdrate == 5 }">
											 <span>★</span>
											 <span>★</span>
											 <span>★</span>
											 <span>★</span>
										     <span>★</span>
										</c:when>
										
									</c:choose>
									<!-- <fieldset>
										<input type="radio" name="bdrate" value="5" id="rate1"><label
											for="rate1">★</label>
										<input type="radio" name="bdrate" value="4" id="rate2"><label
											for="rate2">★</label>
										<input type="radio" name="bdrate" value="3" id="rate3"><label
											for="rate3">★</label>
										<input type="radio" name="bdrate" value="2" id="rate4"><label
											for="rate4">★</label>
										<input type="radio" name="bdrate" value="1" id="rate5"><label
											for="rate5">★</label>
									</fieldset> -->
								</div>
							</td>
							<td class="tableCell">
							 	<a href="selectReviewBoardView${paging.makeQueryPage(board.bdcode, paging.page)}">${board.bdtitle}
							 	<c:if test="${board.bdimg != null }">
									<i class="fa-regular fa-image"></i>
								</c:if>
							 		<span class="fw-bold" style="font-size:15px; color:#00bcd4;">&nbsp;${board.bdrpcount }</span> </a>
							 </td>
							<td class="text-center tableCell">
								<span style="cursor: pointer" class="bdnickname" onclick="writeMemberBoard('${board.bdnickname}')">${board.bdnickname}</span>
							</td>
							<td class="text-center tableCell">${board.bddate}</td>
							<td class="text-center tableCell">${board.bdhits }</td>
							<td class="fw-bold text-center tableCell" style="color: #00bcd4;">${board.bdrccount}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div align="right" class="col mt-2">
					<c:if test="${sessionScope.loginId != null }">
						<button type="button" onclick="loadToWriteReview()" style="background-color:#00bcd4;" class="btn btm-sm fw-bold text-white writeButton">글작성</button>
					</c:if>
				</div>
				</div>
				
				<!-- 페이징 시작 -->
				<input type="hidden" id="pageNum" name="page" value="1">
				<div class="block text-center" id="pageList">
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
	                			<li class="paginate_button "><a href="${num }" >${num }</a></li>
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
	//선택한 정렬 select option으로 선택되도록 하기
	var searchValOption = $("#searchValSel option");
	var searchVal = "${paging.searchVal}";
	if (searchVal.length > 0) {
		for (var i = 0; i < searchValOption.length; i++){
			if (searchValOption.eq(i).val() == searchVal){
				searchValOption.eq(i).attr("selected", "selected");
			}
		}
	}
	
	var keyword = '${paging.keyword}';
	if( keyword.length > 0 ){
		$("#inputSearchText").val(keyword);
	}
	
</script>


<script type="text/javascript">
	var checkMsg = '${msg}';
	if ( checkMsg.length > 0 ){
		alert(checkMsg);
	}
	
</script>
<script type="text/javascript">
	
	/* 글작성 버튼 클릭 */
	function loadToWriteReview(){
		location.href="loadToWriteReview";		
	}

</script>

</html>