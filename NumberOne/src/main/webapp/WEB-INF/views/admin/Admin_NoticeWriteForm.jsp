<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공지작성</title>

<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
   table{
      width:70%;
      border:1px solid black;
   };
   
   th{
      border:1px solid black;
   }
   .roomtxtarea{
      width=:1000px;
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
				<h1 class="text-center">회원관리 페이지</h1>
				<div>
					<select>
						<option value="">활동
						<option value="">신고
						<option value="">정지
					</select>
				</div>
				
				<div>
            <form action="writeRoom" method="post" enctype="multipart/form-data">
            <table>
               <tr>
                  <th>작성자</th>
                  <td colspan="3">imhido</td>                  
               </tr>
               <tr>
                  <th>게시판</th>
                  <td>   
                     <!-- 자랑게시판은 자랑으로 고정 -->
                     <select id="selCategory">
                        <option value="자랑"> 자랑
                        <option value="자유"> 자유
                        <option value="질문"> 질문
                        <option value="정보"> 정보
                        <option value="후기"> 후기
                     </select>
                     <!-- input은 히든해서 쓰세요 -->
                     <input type="text" name="bdcategory" placeholder="카테고리" id="categoryInput">
                  </td>
                  <th>지역</th>
                  <td>
                     <!-- 자랑게시판은 사용 불가 -->
                     <select id="selRegion">
                        <option value="ALL"> 전국
                        <option value="SEL"> 서울
                        <option value="ICN"> 인천
                        <option value="GGD"> 경기도
                        <option value="GWD"> 강원도
                        <option value="CCD"> 충청도
                        <option value="JLD"> 전라도
                        <option value="GSD"> 경상도
                        <option value="JJD"> 제주도
                     </select>
                     <!-- input은 히든해서 쓰세요 -->
                     <input type="text" name="bdrgcode" placeholder="지역" id="regionInput">
                  </td>
               </tr>
               <tr>
                  <th>제목</th>
                  <td colspan="3">
                     <input name="bdtitle" type="text" placeholder="제목을 입력하세요" size="45">
                  </td>
               </tr>
               <tr>
                  <th>내용</th>
                  <td colspan="3">
                     <textarea rows="15" cols="50" name="bdcontents" placeholder="내용을 입력하세요"></textarea>
                  </td>
               </tr>
               <tr>
                  <th>대표사진</th>
                  <td colspan="3">
                     <input type="text" id="mainImgScreen"> <span class="mainfile"><label for="mainImg">대표사진 선택</label></span>
                     <input type="file" id="mainImg" name="bdimg"> 
                  </td>
               </tr>
               <tr>
                  <th>상세사진</th>
                  <td colspan="3">
                     <input type="text" id="detailImgScreen"> <span class="mainfile"><label for="detailImg">상세사진 선택</label></span>
                     <input type="file" multiple="multiple" id="detailImg" name="bddetailimg[]">
                  </td>
               </tr>
               <tr>
                  <th colspan="4"><button type="submit">등록</button></th>
               </tr>
            </table>
            </form>
            </div>

			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>