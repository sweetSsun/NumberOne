<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>

<style type="text/css">
	.sidemenu{
	     margin-top: 10%;
	     padding: 0;
	     text-align: center;
	}

	.sidetitle{
		margin-top: 30%;
		margin-bottom: 30%;
	}

	.sideroom{
		margin: 15%;
	}
	
	.sideregion{
		text-align: center;
	}
	
</style>


</head>
<body>
	<!-- 사이드바 : 커뮤니티 -->
		<div class="sidebar" style="background: #eaf8ff;">
			<div class="row">
               </div>
                  <div class="sideroom" >
                      <h4><a href="#">공지방</a></h4>
                  </div>
                  <div class="sideroom" >
                      <h4><a href="selectFreeBoardList">자유방</a></h4>
                  </div>
                  <div class="sideroom" >
                      <h4><a href="#">질문방</a></h4>
                  </div>
                  <div class="sideroom" >
                      <h4><a href="#">정보방</a></h4>
                  </div>
                  <div class="sideroom" >
                      <h4><a href="#">후기방</a></h4>
                  </div>
               </div>
                   
                   
               <div class="sideregion" >
                   <h4><a href="#">지역</a></h4>
                   <div class="blog__sidebar__item__tags">
                       <table id="region_cate">
                       	<tr>
                       		<td><a href="#">전체</a></td>
                       		<td><a href="#">서울</a></td>
                       		<td><a href="#">인천</a></td>
                       	</tr>
                       	<tr>
                       		<td><a href="#">경기</a></td>
                       		<td><a href="#">경상</a></td>
                       		<td><a href="#">전라</a></td>
                       	</tr>
                       	<tr>
                       		<td><a href="#">충청</a></td>
                       		<td><a href="#">강원</a></td>
                       		<td><a href="#">제주</a></td>
                       	</tr>
                       </table>
                   </div>
                </div>  
                       
                </div>
            </div>
		</div>
		<!-- 사이드바 종료 -->
</body>
</html>