<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 마이페이지 커뮤니티</title>

<script type="text/javascript">
	function writeMemberBoard(nickname){
		console.log("팝업 스트립트 확인!!!");
		let wMemberPopupUrl = "loadToWriteMemberBoard?nickname"+nickname;
		let wMemberPopupOption = "width=200, height=200, top=300px, left=500px, scrollbars=no, resizable=no";

		$.ajax({
			url: "selectWriteMemberInfo_ajax",
			data: {"nickname":nickname},
			async:false,
			dataType:"json",
			success:function(result){
				console.log(nickname);
				wMemberPopup = window.open(wMemberPopupUrl, wMemberPopupOption, nickname);
	    
				wMemberPopup.window.addEventListener("load", function(){
					wMemberPopup.writeMemberBoard(result);
			 	});
			}
		});

/* 		$.ajax({
			url: "selectWriteMemberInfoReply_ajax",
			data: {"nickname":nickname},
			async:false,
			dataType:"json",
			success:function(result){
				console.log(nickname);
				wMemberPopup = window.open(wMemberPopupUrl, wMemberPopupOption, nickname);
	    
				wMemberPopup.window.addEventListener("load", function(){
					wMemberPopup.writeMemberBoard(result);
			 	});
			}
		}); */
	}
		
	
</script>





<%@ include file="/resources/css/BarCss.jsp"%>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- ogani css -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">         
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<!-- Jquery -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 -->


<style type="text/css">

	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}

	#board_column{
		border-bottom: solid gray 3px;
	
	}
	table{
		margin: 20px;
		font-size: 18px;
		table-layout: fixed;
		border-left: 20px; 
	}
	
	td {
	overflow:hidden;		
	white-space : nowrap;		
	text-overflow: ellipsis;
	padding: 10px;
	

	}
	
.site-btn {

background-color: #00BCD4;

}	
	
	
</style>
</head>
<body>
        <!-- TobBar -->
        <c:choose>
                <c:when test="${sessionScope.loginId != 'admin'}">
                        <%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
                </c:when>
                <c:otherwise>
                        <%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
                </c:otherwise>
        </c:choose>
        <!-- End of TobBar -->
	<!-- End of TobBar -->
	
	<main>
		
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp" %>
		
		<section>
		<div style="min-height: 50px;" id="scroll-board"></div>
		<!-- 본문 -->
			<div class="container">
				<div class="checkout__form" style="margin-top: 30px;"><h4>마이페이지 커뮤니티</h4></div>
				<br>
				<br>
				<!-- 작성글 목록 -->
				<div class="row" >				
					<h4 class="checkout__form" style="color: #00BCD4; margin-left: 30px;">작성글 목록</h4>
				</div>
				<div class="row"  style="margin:20px; ">
				<table>
						<tr class="text-center" id="board_column">
							<td>글번호</td>
							<td>제목</td>
							<td>댓글수</td>
							<td>날짜</td>
						</tr>
						<c:forEach items="${board }" var="board">
							<!-- 작성글 목록 -->
								
					<c:choose>	
						<c:when test="${board.bdstate == 2 }">
							<tr style="border-bottom: solid #E0E0E0 1px; color : gray;">
								<td style="text-align: center;">삭제</td>
								<td style="text-align: center; text-decoration : line-through;">${board.bdtitle}</td>	
								<td style="text-align: center; text-decoration : line-through;">${board.bdreply }</td>
								<td style="text-align: center; text-decoration : line-through;">${board.bddate }</td>								
							</tr>
						</c:when>
						<c:when test="${board.bdstate == 0 }">
							<tr style="border-bottom: solid #E0E0E0 1px; color : gray;">
								<td style="text-align: center;">정지</td>
								<td style="text-align: center; text-decoration : line-through;">${board.bdtitle}</td>	
								<td style="text-align: center; text-decoration : line-through;">${board.bdreply }</td>
								<td style="text-align: center; text-decoration : line-through;">${board.bddate }</td>								
							</tr>
						</c:when>						
						<c:otherwise>					
							
							<tr style="border-bottom: solid #E0E0E0 1px;">
								<td style="text-align: center;">${board.bdcode }</td>
								<td style="text-align: center;">
									<c:choose>
										<c:when test="${board.bdcategory.equals('자랑') }">
											<!-- 자랑글 상세 -->
											<a href="selectRoomList?bdcode=${board.bdcode }&jsp=view">
											${board.bdtitle}</a>
										</c:when>
										<c:otherwise>
											<!-- 일반글 상세 -->										
											<a href="selectBoardView?bdcode=${board.bdcode }">${board.bdtitle}</a>
										</c:otherwise>
									</c:choose>
								</td>	
								<td style="text-align: center;">${board.bdreply }</td>
								<td style="text-align: center;">${board.bddate }</td>								
							</tr>
							
					</c:otherwise>						
				</c:choose>							
							
							
						</c:forEach>
				</table>
				<!-- 여백 -->				
					<div style="min-height: 600px;"></div>
				</div>
			
				
				
				
				<!-- 댓글작성글 목록 -->
				<!-- 여백 -->
				<div style="min-height: 230px;" id="scroll-reply"></div>
				<div class="row" >				
					<h4 class="checkout__form" style="color: #00BCD4; margin-left: 30px;">댓글 작성 글 목록</h4>
				</div>
				<!-- 여백 -->				
				<div style="min-height: 50px;"></div>
				<div class="row">
				<table >
						<tr class="text-center" id="board_column">
							<td>댓글번호</td>
							<td>글제목</td>
							<td>댓글내용</td>							
							<td>날짜</td>
						</tr>
						<c:forEach items="${reply }" var="reply">
							
						<!-- 작성댓글 목록 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center;">
				
				<!-- 글 정지 또는 삭제 상태 -->		
				<c:choose>
				<c:when test="${reply.bdstate == 0}">
					
					<c:choose>
					<c:when test="${reply.rpstate == 0}">
						<td style="color:gray;">정지</td>
					</c:when>
					<c:when test="${reply.rpstate == 2}">
						<td style="color:gray;">삭제</td>
					</c:when>					
					<c:otherwise>
						<td style="text-decoration : line-through; color:gray;">${reply.rpcode }</td>
					</c:otherwise> 
					</c:choose>
				
				<td style="color:gray;">정지된 글입니다.</td>
				<td style="text-decoration : line-through; color:gray;">${reply.rpcontents}</td>
				<td style="text-decoration : line-through; color:gray;">${reply.rpdate }</td>
				</c:when>

				<c:when test="${reply.bdstate == 2 }">
					
					<c:choose>
					<c:when test="${reply.rpstate == 0}">
						<td style="color:gray;">정지</td>
					</c:when>
					<c:when test="${reply.rpstate == 2}">
						<td style="color:gray;">삭제</td>
					</c:when>					
					<c:otherwise>
						<td style="text-decoration : line-through; color:gray;">${reply.rpcode }</td>
					</c:otherwise> 
					</c:choose>
				
				<td style="color:gray;">삭제된 글입니다.</td>
				<td style="text-decoration : line-through; color:gray;">${reply.rpcontents}</td>
				<td style="text-decoration : line-through; color:gray;">${reply.rpdate }</td>
				</c:when>


				
				
				<c:otherwise>

							<!-- 댓글 번호 -->
							<c:choose>
							<c:when test="${reply.rpstate == 0}">
								<td style="color:gray;">정지</td>
							</c:when>
							<c:when test="${reply.rpstate == 2 }">
								<td style="color:gray;">삭제</td>
							</c:when>							
							<c:otherwise>
								<td>${reply.rpcode }</td>
							</c:otherwise>
							</c:choose>
								
							
							<!-- 글제목 -->	
								<td style="width: 500px;" >
									<c:choose>
										<c:when test="${reply.rpbdcategory.equals('자랑') }">
											<!-- 자랑 댓글 원본 글 상세 -->
											<a href="selectRoomList?bdcode=${reply.rpbdcode }&jsp=view">
											<span style="text-overflow : ellipsis;">${reply.rpbdtitle}</span>
											</a>
										</c:when>
										<c:otherwise>
											<!-- 일반 댓글 원본 글 상세 -->										
											<a href="selectBoardView?bdcode=${reply.rpbdcode }">${reply.rpbdtitle}</a>
										</c:otherwise>
									</c:choose>
								</td>
							
							<!-- 댓글 내용 -->	
							<c:choose>
							<c:when test="${reply.rpstate == 0}">
								<td style="text-decoration : line-through; color:gray;">${reply.rpcontents }</td>
							</c:when>
							<c:when test="${reply.rpstate == 2 }">
								<td style="text-decoration : line-through; color:gray;">${reply.rpcontents }</td>
							</c:when>							
							<c:otherwise>							
							
								<td style="width: 500px;" >
									<c:choose>
										<c:when test="${reply.rpbdcategory.equals('자랑') }">
											<!-- 자랑 댓글 원본 글 상세 -->
											<a href="selectRoomList?bdcode=${reply.rpbdcode }&jsp=view">${reply.rpcontents }</a>
										</c:when>
										<c:otherwise>
											<!-- 일반 댓글 원본 글 상세 -->										
											<a href="selectBoardView?bdcode=${reply.rpbdcode }">${reply.rpcontents }</a>
										</c:otherwise>
									</c:choose>
								</td>
							
							</c:otherwise>
							</c:choose>								
								
							<!-- 날짜 -->	
							<c:choose>
							<c:when test="${reply.rpstate == 0 || reply.rpstate == 2 }">
								<td style="text-decoration : line-through; color:gray;">${reply.rpdate }</td>
							</c:when>
							<c:otherwise>
								<td>${reply.rpdate }</td>
							</c:otherwise>
							</c:choose>	
				</c:otherwise> 
				</c:choose>		
													
				</tr>
	
				</c:forEach>
				</table>
				<!-- 여백 -->				
				<div style="min-height: 800px;"></div>
				</div>
				
				
				<!-- 스크랩 목록 -->
				<!-- 여백 -->
				<div style="min-height: 230px;" id="scroll-scrap"></div>
				<div class="row" >				
					<h4 class="checkout__form" style="color: #00BCD4; margin-left: 30px;">스크랩 목록 (작성자 상세보기 test 중)</h4>
				</div>								
				<!-- 여백 -->
				<div style="min-height: 50px;" ></div>				
				<div class="row">
				<table>
						<tr class="text-center" id="board_column">
							<td>글번호</td>
							<td>제목</td>
							<td>댓글수</td>
							<td>작성자</td>
							<td>날짜</td>
						</tr>
						
						<c:forEach items="${scrap }" var="scrap">
					<c:choose>
						<c:when test="${scrap.bdstate == 2 }">
							<tr style="border-bottom: solid #E0E0E0 1px; color : gray;">
								<td style="text-align: center;">삭제</td>
								<td style="text-align: center; text-decoration : line-through;">${scrap.bdtitle }</td>	
								<td style="text-align: center; text-decoration : line-through;">${scrap.bdreply }</td>
								<td style="text-align: center; text-decoration : line-through;">${scrap.mnickname }</td>
								<td style="text-align: center; text-decoration : line-through;">${scrap.bddate }</td>																
							</tr>
						</c:when>
						<c:when test="${scrap.bdstate == 0 }">
							<tr style="border-bottom: solid #E0E0E0 1px; color : gray;">
								<td style="text-align: center;">정지</td>
								<td style="text-align: center; text-decoration : line-through;">${scrap.bdtitle }</td>	
								<td style="text-align: center; text-decoration : line-through;">${scrap.bdreply }</td>
								<td style="text-align: center; text-decoration : line-through;">${scrap.mnickname }</td>
								<td style="text-align: center; text-decoration : line-through;">${scrap.bddate }</td>																
							</tr>
						</c:when>						
						<c:otherwise>						
							<!-- 스크랩 목록(스크랩은 자랑글만 가능함 -->
							<tr style="border-bottom: solid #E0E0E0 1px; text-align: center; ">
								<td>${scrap.scbdcode }</td>
								<td>
								<a href="selectRoomList?bdcode=${scrap.scbdcode }&jsp=view">
								${scrap.bdtitle }</a></td>
								<td>${scrap.bdreply }</td>
								<td>
								<span onclick="writeMemberBoard('${scrap.mnickname }')"
								style="text-align: center; cursor: pointer;">${scrap.mnickname }</span></td>
								<td>${scrap.bddate }</td>								
							</tr>														
					</c:otherwise>	
				</c:choose>
						</c:forEach>
				</table>
				<div style="min-height: 600px;"></div>
				</div>



						
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>





</body>



</html>