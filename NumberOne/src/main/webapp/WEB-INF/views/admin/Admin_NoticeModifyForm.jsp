<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공지수정</title>

<%@ include file="/resources/css/CommonCss.jsp" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
	table{
		width:70%;
		border:1px solid black;
		margin-left: auto; margin-right: auto;
	};
	
	th, td{
		padding-left: 40px;
	}
	.roomtxtarea{
		width=:65%;
	}
	
	.mainfile{
		border-style: inherit;
    	border-color: internal-light-dark;
		padding: 6px;
		background-color: #BDB4A3;	
		color: white;
		border-radius: 6px;
	}
	
	span:hover {
		/* border: 1px solid #897B63; */
		padding: 6px;
		background-color: #AFA58F;	
		color: white;
		border-radius: 6px;
	}
	
	.d_none{ display:none; }
	
	.tableHead{ padding-left: 40px; }
</style>

</head>

<!-- jquery -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

<body>

	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Admin.jsp" %>
		
		<section>
		<!-- 본문 -->
			<div class="container">
				<h1 class="text-center">공지 수정페이지 : Admin_NoticeModifyForm.jsp</h1>
				<div>
 				<form action="admin_updateNoticeModify" method="post" enctype="multipart/form-data">
 				<!-- 수정 불가능한 값 숨기고 submit에는 데이터 넘겨주는 변수 -->
 				<input type="hidden" name="nbcode" value="${noticeBoard.nbcode }">
 				<input type="hidden" name="originImg" value="${noticeBoard.nbimg }">
 				<table>
					<tr class="tableRow">
						<th class="tableHead">작성자</th>
						<!-- imhido 부분은 나중에 로그인 아이디로 출력 -->
						<td colspan="3">${mnickname}</td>						
					</tr>
					<tr class="tableRow">
						<!-- th, td에 패딩, 마진을 주고 싶은데 먹히지 않아서 tableHead 클래스로 여백 줬슴당 -->
						<th class="tableHead">제목</th>
						<td colspan="3">
							<input name="nbtitle" type="text" placeholder="제목을 입력하세요" size="35%" value="${noticeBoard.nbtitle }">
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">내용</th>
						<td colspan="3">
							<textarea rows="15" cols="40" name="nbcontents" placeholder="내용을 입력하세요">${noticeBoard.nbcontents }</textarea>
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">대표사진</th>
						<td colspan="3">
							<!--  
							<input type="text" id="mainImgScreen"> <span class="mainfile"><label for="mainImg">대표사진 선택</label></span>
							-->
							<c:if test="${noticeBoard.nbimg != null }">
								<img src="${pageContext.request.contextPath }/resources/img/noticeUpLoad/${noticeBoard.nbimg}" style="max-width:100px;">
							</c:if>
							<input type="file" id="nbImg" name="nbimgfile" class=""> 
						</td>
					</tr>
					<tr class="tableRow">
						<th colspan="4">
							<center>
							<button type="submit">수정</button> 
							<!-- 취소하면 돌아갈 페이지가 없어서 취소는 function 연결만 되어 있음-->
							<button type="button" onclick="withdraw()">취소</button>
							</center>
						</th>
					</tr>
				</table>
				</form>
            </div>

			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$("#nbImg").change(function(){
		var nbImg = $("#nbImg").val().split("path")[1];
		nbImg = nbImg.substring(1);
		console.log("선택된메인이미지: "+nbImg);
		$("#mainImgScreen").val(nbImg);
	})
	
	function withdraw(){
		console.log("취소 버튼 클릭");
		location.href="admin_selectNoticeBoardView?nbcode=${noticeBoard.nbcode}";
	}
</script>

</body>
</html>