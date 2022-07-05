<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 로그인페이지</title>

<%@ include file="/resources/css/CommonCss.jsp"%>
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp"%>

		<section>
			<!-- 본문 -->
        <div class="container">

            <div class="checkout__form">
                <h4>로그인</h4>
                <br>
                <form class="user" action="selectMemberLogin" method="post">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                        <!-- ID , 이름 -->
                             <div class="row">
                             	<div class="col-lg-12 col-md-6">
                             		<div class="checkout__input"  style="text-align: center;">
                                 		<input type="text" style="width: 420px; height:15px; border:1px;" value="아이디" readonly="readonly" tabindex="-1">
                             		</div>
                             	</div>
                            </div>
                             <div class="row">
                             	<div class="col-lg-12 col-md-6">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<input type="text" id="userMid" name="mid" style="width: 400px;"> 
                             		</div>
                             	</div>
                            </div>
                        <!-- 비번 , 비번확인 -->
                             <div class="row">
                             	<div class="col-lg-12 col-md-6">
                             		<div class="checkout__input"  style="text-align: center;">
                                 		<input type="text" style="width: 420px; height:15px; border:1px;" value="비밀번호" readonly="readonly" tabindex="-1">
                             		</div>
                             	</div>
                            </div>
                             <div class="row">
                             	<div class="col-lg-12 col-md-6">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<input type="text" id="userMpw" name="mpw" style="width: 400px;"> 
                             		</div>
                             	</div>
                            </div>
                            
                        <!-- 로그인 버튼 -->    
                        <center><button type="submit" class="site-btn" style="border-radius: 4px;">로그인</button></center>
                       <br>
                        <!-- 카카오 로그인 -->
                            <div class="text-center">
                                <a class="small" id="kakaoLoginBtn"></a>
                            </div>
                        
                        <br>
                        <!-- 아이디찾기 , 비밀번호찾기 -->
                            <div class="row">
                            	<div class="col-lg-6 col-md-1">
                                	<div class="checkout__input" style="text-align: right;">
                                 		<a class="small" href="loadToLookforId">아이디 찾기</a>
                                	</div>
                              	</div>                             	
                             	<div class="col-lg-6 col-md-1">
                             		<div class="checkout__input" style="text-align: left;">
                                 		<a class="small" href="loadToLookforPw">비밀번호 찾기</a>
                             		</div>
                             	</div>
                            </div>                        							
   							
                         </div>                            
  					</div> 
                </form>
            </div>
        </div>
    </section>
	</main>
	


	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>
	
	<!-- 스크립트 시작 -->
	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

<!-- 카카오로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('9a2a6ba1fad2654ddfe813c953d32deb');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
	
	<!-- 카카오로그인 버튼 -->
	<script type="text/javascript">
	Kakao.Auth.createLoginButton({
		  container: '#kakaoLoginBtn',
		  size:'large',
		  success: function(response) {
		    console.log(response);
		    	
		    /* 정보가져오기 시작 */
		    Kakao.API.request({
		    	  url: '/v2/user/me',
		    	  success: function(res) {
		    	    console.log(res);
		    	    console.log("res.id : "+ res.id);
		    	    console.log("res.kakao_account.email : "+ res.kakao_account.email);
		    	    console.log("res.kakao_account.profile.nickname : "+ res.kakao_account.profile.nickname);
		    	    console.log("res.kakao_account.profile.profile_image_url : "+ res.kakao_account.profile.profile_image_url);
		    	    

		    	    // 아이디, 이메일, 닉네임, 프로필
		    	     memberKakaoLogin(res.id, res.kakao_account.email, res.kakao_account.profile.nickname, res.kakao_account.profile.profile_image_url);
		    	    // controller >> service 아이디로 회원정보 조회
		    	    // 조회되는 회원 정보가 있으면 로그인 처리 후 메인페이지로
		    	    // 조회되는 회원 정보가 없으면 아이디, 이메일, 닉네임, 프로필, 회원가입 처리
		    	    
		    	  },
		    	  fail: function(error) {
		    	    console.error(error)
		    	  }
		    	})
		   	/* 정보가져오기 끝 */
		  
		  
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
	</script>
	
	<script type="text/javascript">
		function memberKakaoLogin(mid,memail,mnickname,mprofile){

			console.log(mid);
			console.log(memail);
			console.log(mnickname);
			console.log(mprofile);
			
			location.href="memberKakaoLogin?mid="+mid+"&memail="+memail+"&mnickname="+mnickname+"&mprofile="+mprofile;
			
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	
	
		
</body>

</html>