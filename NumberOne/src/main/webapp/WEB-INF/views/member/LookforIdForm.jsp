<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 아이디찾기페이지</title>

	
<!--jquery & bootstrap(5css)-->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">



<!-- ogani css -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">         
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style type="text/css">

	.checkout__form {
	  padding: 100px 200px;
	}

	#domainSelect{
	font-size: 17px;
	height: 45px;
	width: 130px;
	border-radius : 4px;
	}

	.checkout__input {
	font-size: 17px;
	}
	
	.checkout__input input {
	border: 1px solid #808080;
}

	.gender__input {
	border: 1px solid #808080;
	height: 45px;
	width: 440px;
	border-radius : 4px;		
		
	}

.msg {
	font-size: 15px;
}

.site-btn {

background-color: #00BCD4;

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
	<!-- End of TopBar -->

	<main>
		<!-- 사이드바 -->
		<%-- <%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp"%> --%>

		<section>
			<!-- 본문 -->
        <div class="container">

            <div class="checkout__form">
                <h4>아이디 찾기</h4>
                <br>
                
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        <!-- 이름 -->
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input"  style="text-align: center;">
                                 		<input type="text" style="width: 420px; height:16px; border:1px;" value="이름"  readonly="readonly"  tabindex="-1">
                             		</div>
                             	</div>
                            </div>
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<input type="text" id="checkMname" name="mname" style="width: 400px;"><br> 
                             		<span id="nameCheckMsg" class="msg" style="text-align: left;"></span> 
                             		</div>
                             	</div>
                            </div>
                            
                        <!-- 메일주소 -->
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input"  style="text-align: center;">
                                 		<input type="text" style="width: 420px; height:15px; border:1px;" value="메일주소"  readonly="readonly"  tabindex="-1">
                             		</div>
                             	</div>
                            </div>
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<input type="text" id="checkMemail" name="memail" style="width: 400px;"><br>  
                             		<span id="emailCheckMsg" class="msg"></span> 
                             		</div>
                             	</div>
                            </div>
                            
                        <!-- 찾기버튼 -->    
                        <div class="row" id="findButton">
                             <div class="col-lg-12 col-md-12 col-sm-12">
                             	<div class="checkout__input"  style="text-align: center;">                        
                        			<button class="site-btn" style="border-radius: 4px;" onclick="searchId()">찾기</button>
                             	</div>
                             </div>
                       </div>          
                                     
                       <br>
                        <!-- 결과 span Msg-->
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<span id="resultLookforIdMsg" style="width: 400px; "></span> 
                             		</div>
                             		<div id="login"></div>
                             	</div>
                            </div>                                            							
   							
                         </div>                            
  					</div> 
                
            </div>
        </div>
    </section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>
	<!--jquery & bootstrap(5js)-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
  
	
	<script type="text/javascript">

		
	   
		function searchId() {
			console.log("아이디 찾기 함수 연결!")
		
			var checkMname=$("#checkMname").val()
			var checkMemail=$("#checkMemail").val()
			console.log(checkMname+checkMemail);
			
			if(checkMname.length == 0) {
				$("#nameCheckMsg").text("이름을 입력 해주세요.").css("color" , "red");
			}else if(checkMemail.length == 0) {
				$("#emailCheckMsg").text("이메일을 입력 해주세요.").css("color" , "red");				
			}else {
			
				$.ajax({
					type : "get",
					url : "selectLookforId_ajax",
					data : {"checkMname" : checkMname , "checkMemail" : checkMemail },
				
					success : function(result){
						if(result.length != 0) {
						$("#resultLookforIdMsg").text("귀하의 아이디는 "+result+" 입니다.").css("color" , "green"); 
						$("#findButton").css("display", "none");
						var output = "";
						output +="<div>"
						output +="<button onclick = \"location.href = 'loadToLogin' \" class=\"site-btn\" style=\"border-radius: 4px; margin-left: 30%;\">로그인하러가기</button>&nbsp;"
						output +="<button onclick = \"location.href = 'loadToLookforPw' \" class=\"site-btn\" style=\"border-radius: 4px; \">비밀번호찾기</button>"
						output +="</div>"
						$("#login").html(output);  
						
						}else {
						$("#resultLookforIdMsg").text("일치하는 회원정보가 없습니다.").css("color" , "red");  		
						}
				}

			});			
				
			}
			
			
			
			
		}
	
	</script>

	<!-- ra 메세지 -->
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>

		
</body>

</html>