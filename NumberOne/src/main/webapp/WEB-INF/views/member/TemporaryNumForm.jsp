<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 임시번호 입력</title>

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

.lookforBtn {
border: 0px;
background-color: white;
}

.lookforBtn:hover {
	color: #00BCD4;
	
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
		<%-- <%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp"%>--%>
 
		<section>
			<!-- 본문 -->
        <div class="container">

            <div class="checkout__form">
                <h4>인증번호 입력</h4>
                <br>
                <!-- <form class="user" action="selectTemporaryNum" method="post"> -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        <!-- ID -->
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input"  style="text-align: center;">
                                 		<input type="hidden" style="width: 420px; height:15px; border:1px;" value="아이디" readonly="readonly" tabindex="-1">
                             		</div>
                             	</div>
                            </div>
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<input type="hidden" id="checkMid" name="mid" value="${checkId }" style="width: 400px;"> 
                             		</div>
                             	</div>
                            </div>
                        <!-- 인증번호 -->
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input"  style="text-align: center; padding-left:4px;">
                                 		<input type="text" style="width: 420px; height:20px; border:1px; font-size: 20px;" 
                                 		value="인증번호를 입력해주세요." readonly="readonly" tabindex="-1">
                             		</div>
                             	</div>
                            </div>
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<input type="password" id="checkMpw" name="mpw" style="width: 400px;"> 
                             		<span id="resultMsg" class="msg" style="text-align: left;"></span> 
                             		</div>
                             	</div>
                            </div>
                             <!-- <div class="row"> -->
                       
                        <!-- 확인 버튼 -->    
                        <div class="row" id="findButton">
                             <div class="col-lg-12 col-md-12 col-sm-12">
                             	<div class="checkout__input"  style="text-align: center;">                        
                        			<button class="site-btn" style="border-radius: 4px;" onclick="searchPw()">확인</button>
                             	</div>
                             </div>
                       </div>          
                                     
                       <br>
                        <!-- 결과 span Msg-->
                             <div class="row">
                             	<div class="col-lg-12 col-md-12 col-sm-12">
                             		<div class="checkout__input" style="text-align: center;">
                                 		<span id="TemporaryNumResultMsg" style="width: 400px; "></span> 
                             		</div>
                             		<div id="TemporaryNumResult"></div>
                             	</div>
                            </div>                                            							
   							
                         </div>                            
  					</div> 
                <!-- </form> -->
            </div>
        </div>
    </section>
	</main>
	


	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>
	<!--jquery & bootstrap(5js)-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<script type="text/javascript">

		
	   
		function searchPw() {
			console.log("인증번호 함수 연결!")
		
			var mid=$("#checkMid").val();
			var mpw=$("#checkMpw").val();
			console.log(mid+" "+mpw);
			
			if(mpw.length == 0) {
				$("#TemporaryNumResultMsg").text("인증번호를 입력 해주세요.").css("color" , "red");				
			}else {
			
				$.ajax({
					type : "get",
					url : "selectTemporaryNum_ajax",
					data : {"mid" : mid , "mpw" : mpw },
				
					success : function(result){
						if(result.length != 0) {
						var obj =$("#TemporaryNumResultMsg").text("인증번호가 확인되었습니다.\n비밀번호를 변경하시기 바랍니다.").css("color" , "green"); 
						obj.html(obj.html().replace(/\n/g,'<br/>'));
						$("#findButton").css("display", "none");
						var output = "";
						output+="<form action=\"updateTemporaryNum\" method=\"post\" enctype=\"multipart/form-data\ onsubmit=\"return joinFormCheck()\">"
						
						output +="<div class=\"checkout__input\" style=\"text-align: center;\">"
						output +="<input type=\"hidden\" value=\"${checkId }\" id=\"checkMid\" name=\"mid\"style=\"width: 400px;\"> "							
						output +="<input type=\"password\" id=\"changeMpw\" name=\"mpw\" style=\"width: 400px;\" placeholder=\"변경할 비밀번호를 입력해주세요.\">"
							output +="<span id=\"pwCheckMsg\" class=\"msg\"></span>"
						output +="</div>"
							
						output +="<div class=\"checkout__input\" style=\"text-align: center;\">"
						output +="<input type=\"password\" id=\"reCheckMpw\"  name=\"reCheckMpw\" style=\"width: 400px;\"  placeholder=\"비밀번호를 다시 확인해주세요.\"> "
							output +="<span id=\"pwReCheckMsg\" class=\"msg\"></span>"
						output +="</div>"
						
						output +="<button type=\"submit\" onclick = \"location.href = 'loadToLogin' \" class=\"site-btn\" style=\"border-radius: 4px; margin-left: 39%;\">비밀번호 변경하기</button>"						
						
						output+="</form>"
						
						$("#TemporaryNumResult").html(output);  
						
						}else {
						$("#TemporaryNumResultMsg").text("인증번호가 틀렸습니다.").css("color" , "red");  		
						}
				}

			});			
				
			}
		}
	
	</script>
	
<script type="text/javascript">

console.log("비번 변경 스크립트 확인");
var changeMpw = $("#changeMpw").val();
console.log("changeMpw : " + changeMpw);

var inputPwCheck = false;

<!-- 비밀번호 길이 확인 -->

	$("#changeMpw").keyup(function(){
		//var changeMpw = $("#changeMpw").val();
		//console.log("changeMpw : " + changeMpw);
		if( changeMpw.length == 0 ){
			$("#pwCheckMsg").css("color","red").text("비밀번호를 입력해주세요.");
			inputPwCheck = false;
		} else if( changeMpw.length < 6 || changeMpw.length > 20 ){
			$("#pwCheckMsg").text("비밀번호는 6~20자리 입니다.").css("color", "red");
			inputPwCheck = false;			
		} else {
			$("#pwCheckMsg").css("color","green").text("사용가능한 비밀번호 입니다.");
			inputPwCheck = true;
			
		}
	});
	</script>
	
	
<!-- 비밀번호 재확인 -->
<script type="text/javascript">
	$("#reCheckMpw").keyup(function(){
		var changeMpw = $("#changeMpw").val();
		console.log("changeMpw : " + changeMpw);
		var reCheckMpw = $("#reCheckMpw").val();
		console.log("reCheckMpw : " + reCheckMpw);

		if( changeMpw == reCheckMpw ){
			$("#pwReCheckMsg").css("color","green").text("비밀번호가 일치합니다.");
			inputPwCheck = false;
		} else {
			$("#pwReCheckMsg").css("color","red").text("비밀번호가 일치하지 않습니다.");
			inputPwCheck = true;
			
		}
	});
	</script>


<script type="text/javascript">
    function joinFormCheck(){
	
    	/*비밀번호 유무*/
    	if($("#changeMpw").val().length == 0){
    		alert("비밀번호를 입력해주세요.");
    		$("#changeMpw").focus();
    		return false;
    	}    	
    	
    	if($("#changeMpw").val().length < 6 || $("#changeMpw").val().length >20){
    		alert("비밀번호는 6~20자리 입니다.");
    		$("#changeMpw").focus();
    		return false;
    	}
	
    	/*비밀번호 확인*/
    	if($("#reCheckMpw").val() != $("#changeMpw").val()){
    		alert("비밀번호를 확인해주세요.");
    		$("#reCheckMpw").focus();
    		return false;
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