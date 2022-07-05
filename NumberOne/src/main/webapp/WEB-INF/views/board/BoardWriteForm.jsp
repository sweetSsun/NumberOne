<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/CommonCss.jsp" %>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/86a85cd392.js" crossorigin="anonymous"></script>
<title>1인자 - 게시글 작성페이지</title>
<!-- Jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style type="text/css">
	select{
		width: 200px;
		text-align : center;
		border : none;
		color : #004804;
	}
	option{
		color : #004804;
		font-weight: bold;
	}
	.bdtitle{
		border: none;
		font-weight: bold;
		font-size: 35px;
		margin: auto;
	}
	.bdcontents{
		border-radius: 5px;
		border: solid gray 2px;
	}
	.btn-wrapper{
		width: 100%;
		text-align: center;
		display:inline-block;
	}
	.buttons{
		margin: auto;
		display: block;
		
	}
	.selectPlaceHolder{
		display: none;
	}
	textarea{
		spellcheck: false;
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
				<h1 class="text-center">게시판 글작성페이지 : BoardWriteForm.jsp</h1>
				<form action="insertBoardWrite" method="post" enctype="multipart/form-data" >
					<input type="hidden" name="bdmid" value="${sessionScope.loginId }">
				<div class="row">
					<div class="col-6">
						게시판<span class="text-danger">*</span>
						<select name="bdcategory" required>
							<option value="" disabled selected class="selectPlaceHolder">필수</option>
							<option value="자유">자유</option>
							<option value="질문">질문</option>
							<option value="정보">정보</option>
							<option value="후기">후기</option>
						</select>
					</div>
					<div class="col-6">
						지역
						<select name="bdrgcode">
							<option value="" disabled selected class="selectPlaceHolder">선택</option>
							<option value="ALL">전국</option>
							<option value="SEL">서울</option>
							<option value="ICN">인천</option>
							<option value="GWD">강원</option>
							<option value="CCD">충청</option>
							<option value="GGD">경기</option>
							<option value="JLD">전라</option>
							<option value="GSD">경상</option>
							<option value="JJD">제주</option>
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<input class="bdtitle" name="bdtitle" type="text" >
				</div>
				<hr>
				<div class="row">
					<textarea class="bdcontents" rows="15" name="bdcontents"></textarea>
				</div>
				<div class="row mt-4">
					<input type="file" name="bdimgfile">
				</div>
				<div class="row mt-4">
					<div class="col btn-wrapper">
						<input class="btn btn-lg buttons bg-success fw-bold text-white" type="submit" value="작성">
						<input onclick="writeBoardCancel()" class="btn btn-lg buttons bg-success fw-bold text-white" type="button" value="취소">
					</div>
				</div>
			</form>
			</div>	
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	
</script>

<script type="text/javascript">
	//현재 로그인중인 아이디
	var loginId = '${sessionScope.loginId}';
	
	
</script>

<script type="text/javascript">
	function writeBoardCancel(){
		/* 작성취소 */
		history.back();
		
	}
</script>

</html>