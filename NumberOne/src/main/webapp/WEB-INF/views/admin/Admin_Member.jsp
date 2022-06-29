<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 회원관리</title>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha512-+NqPlbbtM1QqiK8ZAo4Yrj2c4lNQoGv8P79DPtKzj++l5jnN39rHA/xsqn8zE9l0uSoxaCdrOgFs6yjyfbBxSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
   #board_column{
      border-bottom: solid gray 3px;
   }
   table{
      margin: 20px;
   }
   
</style>

</head>


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
            <div class="row" style="margin:auto;">
               <h1 class="text-center">회원 관리페이지 : Admin_Member.jsp</h1>
               <div class="col-4 ">

               </div>
               <div class="col-8">
                  <form action="#" method="get">
                  <div class="input-group">
                    <input type="text" class="form-control" name="keyword" placeholder="검색 키워드를 입력하세요!">
                    <span class="input-group-btn">
                      <button class="btn btn-secondary">찾기</button>
                    </span>
                  </div>
                  </form>
               </div>
            </div>
            <div class="row" style="margin-top: 20px;">
               <div class="col">
                  <!-- 말머리 정렬 -->
                   <select id="searchVal" onchange="searchState(this)">
                     <option value="all">전체</option>
                     <option value="active">활동</option>
                     <option value="warning">신고</option>
                     <option value="inactive">정지</option>
                  </select>
               </div>
            </div>
            
            <!-- 게시글 목록 -->
            <div class="row">
            <table >
               <thead >
                  <tr class="text-center" id="board_column">
                     <td>아이디</td>
                     <td>이름</td>
                     <td>닉네임</td>
                     <td>가입일</td>
                     <td>상태</td>
                  </tr>
               </thead>
               <tbody id="mbListTbody">
	               <c:forEach items="${memberList }" var="member">
	                   <!-- 회원관리 목록 -->
	                   <tr class="fw-bold" style="border-bottom: solid gray 1px;">
	                      <td>${member.mid}</td>
	                      <td>${member.mname}</td>
	                      <td>
	                         <a href="#">${member.mnickname}</a>
	                      </td>
	                      <td>${member.mjoindate}</td>
	                      <td>
	                      	<c:choose>
	                      		<c:when test="${member.mstate == 1}">
	                      			<button onclick="">활둥</button>
	                      		</c:when>
	                      		<c:when test="${member.mwarning > 0}">
	                      			<button onclick="">신고</button>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<button onclick="">정지</button>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </td>
	                   </tr>
	                </c:forEach>                 
                </tbody>
            </table>
            </div>
            
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function searchState(selObj){
			console.log("searchState() 동작");
			var searchVal = $("#searchVal").val();
			console.log("정렬 선택 : " + searchVal);
			$.ajax({
				type: "get",
				url: "selectMemberList_ajax",
				data: {"searchVal":searchVal},
				dataType: "json",
				success: function(result){
					console.log(result);					
				}
			});
			
			
			
			$("#mbListTbody").text("");
		}	
		
	</script>
</body>
</html>