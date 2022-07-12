<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 마이페이지 회원정보</title>

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

<style type="text/css">

	.checkout__form {
	  padding: 100px 100px;
	  cursor: default;
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
	font-weight: bold; 
	cursor: default;
	/* background-color: #EAEAEA; */
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

.textarea {
  display:block; 
  overflow:hidden; 
  width:100%; 
  height:2rem; 
  padding-left:1rem;
  padding-top:0.8rem;
  font-size:1rem; 
  font-weight:bold;
  color:#000; 
  border:1px solid #808080; 
  resize:none;
  border-radius : 4px;
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
                <h4>마이페이지 회원정보</h4>
                <!-- <form> -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        
                        <!-- 프로필 사진 , 상태메세지 -->
                            <div class="row">
                                <div class="col-lg-3 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p class="fw-bold" style="color: #808080;">프로필사진</p>
                            <c:choose> 
                            	<c:when test="${memberInfo.mprofile != null}">
                            		<c:choose>
                        				<c:when test="${sessionScope.loginId != null && sessionScope.kakaoId == null}">
                                	 		<img style="height: 200px; width: 200px; border: 1px solid #808080; padding: 10px;" 
                                        	class="img-account-profile rounded-circle col-md-12 col-sm-12"
                                    		src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/${sessionScope.loginProfile }">                        	
                            			</c:when>
                         				<c:when test="${sessionScope.kakaoId != null }">
                                	 		<img style="height: 200px; width: 200px; border: 1px solid #808080; padding: 10px;" 
                                        	class="img-account-profile rounded-circle col-md-12 col-sm-12"
                                    		src="${sessionScope.loginProfile }"> 
                                    	</c:when>  	
                            		</c:choose>
                            	</c:when>                          	
                           		<c:otherwise>
                                	 <img style="height: 200px; width: 200px; border: 1px solid #808080; padding: 10px;" 
                                        class="img-account-profile rounded-circle col-md-12 col-sm-12"
                                    src="${pageContext.request.contextPath }/resources/img/mprofileUpLoad/profile_simple.png">
                             	</c:otherwise>   
                            </c:choose>                                         
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p class="fw-bold" style="color: #808080;">아이디</p>
                                        <input type="text" id="inputMid" name="mid" readonly="readonly" value="${memberInfo.mid }">   
                                    </div>                                    
                                    <div class="checkout__input ">
                                        <p class="fw-bold" style="color: #808080;">상태메세지</p>
                                			<textarea class="textarea" id="inputMmessage" name="mmessage" readonly="readonly">${memberInfo.mmessage }</textarea>                                                               
                                    </div>
                                </div>
                            </div>                   
                        
                        
                        
                        <!-- 이름,닉네임 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p class="fw-bold" style="color: #808080;">이름</p>
                                        <input type="text" id="inputMname" name="mname" readonly="readonly" value="${memberInfo.mname }">                                    
                                    </div>
                                </div>    
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p class="fw-bold" style="color: #808080;">닉네임</p>
                                        <input type="text"id="inputMnickname" name="mnickname" readonly="readonly" value="${memberInfo.mnickname }">                                  
                                    </div>
                                </div>
                             </div>   
                        
                        <!-- 비번 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12" >
                                    <div class="checkout__input" style="display:none">
                                        <p class="fw-bold" style="color: #808080;">비밀번호</p>
                                        <input type="hidden" id="inputMpw" name="mpw" readonly="readonly" value="${memberInfo.mpw }">                                     
                                    </div>
                                </div>
                            </div>                            

                        <!-- 이메일,전화번호 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p class="fw-bold" style="color: #808080;">이메일</p>
                                        <input type="text"  id="inputEmail" name="memail" readonly="readonly" value="${memberInfo.memail }">                                       
                                    </div> 
                                </div>                                    
                      <!-- 전화번호 -->
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p class="fw-bold" style="color: #808080;">전화번호</p>
                                        <input type="text" id="inputMphone" name="mphone" readonly="readonly" value="${memberInfo.mphone }">
 									<span id="phoneCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>  

                            <!-- 관심지역 -->
                           <div class="checkout__input">
                                <p class="fw-bold" style="color: #808080;">관심지역</p>
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text" id="inputmregion" name="mregion"
                                         readonly="readonly" value="${memberInfo.mregion }">                                  
                                    </div>
                                </div>
                            </div>
							</div>
                                                          
                            <!-- 주소 -->
                           <div class="checkout__input">
                                <p class="fw-bold" style="color: #808080;">주소</p>
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text" id="sample6_postcode" name="mpostcode"
                                         readonly="readonly" value="${memberInfo.mpostcode }">                                  
                                    </div>
                                </div>
                            </div>
                            <!-- 기본 주소 -->
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text" id="sample6_address" name="maddress" 
                                        readonly="readonly" value="${memberInfo.maddress }">                                 
                                    </div>
                                </div>
                            </div> 
                            <!-- 상세 주소 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text" id="sample6_detailAddress" name="mdetailAddr" 
                                        readonly="readonly" value="${memberInfo.mdetailAddr }">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text" id="sample6_extraAddress" name="mextraAddr" 
                                        readonly="readonly" value="${memberInfo.mextraAddr }">
                                    </div>
                                </div>
                            </div>                            
                          </div>
                          <!-- 끝 -->
						
						<br>
                        <div class="row">
                        	<div class="col-lg-12 col-md-12 col-sm-12">						
                        		<button type="submit" class="site-btn" style="width: 130px; border-radius: 4px;"
                        		onclick = "location.href = 'loadToMyInfoModifyForm' " >
                        		수정</button>
                        		<button type="submit" class="site-btn" style="width: 130px; border-radius: 4px;"
                        		onclick = "location.href = 'updateMemberWithdraw' " > 
                        		탈퇴</button>                        
                        	</div>
                         </div>
                    </div>
                <!-- </form> -->
            </div>
        </div>
    </section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>
	
	<!-- 스크립트 시작 -->
	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
	
	<!-- textarea 길이 조절 -->
<script>
    var txtArea = $(".textarea");
    if (txtArea) {
        txtArea.each(function(){
            $(this).height(this.scrollHeight);
        });
    }
</script>



	
	<!-- 다음 우편번호 서비스 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath }/resources/MemberJs/daumPostCode.js"></script>
    
	<!-- 아이디 중복 체크 -->
    <script type="text/javascript">
    
    var inputIdCheck =false;
    var inputPwCheck = false;
    var inputNameCheck = false;
    var inputNicknameCheck = false;
    
    $(document).ready(function(){
    	console.log("스크립트 확인!");
    	
    	<!-- 아이디 중복 확인 -->
    	$("#inputMid").focusout(function(){
    		var inputId = $("#inputMid").val();
    		console.log("inputId : "+inputId);
    		
    		if(inputId.length == 0) {
    			$("#idCheckMsg").text("아이디를 입력 해주세요.").css("color" , "red");
    			inputIdCheck =false;
    		}else if( inputId.length < 5 || inputId.length > 10 ){
				$("#idCheckMsg").text("아이디는 5~10자리 입니다.").css("color", "red");
				inputIdCheck = false;
    		}else {

    			$.ajax({
    				type : "get",
    				url : "selectMemberId_ajax",
    				data : {"inputId" : inputId },
    				success : function(result){
    					
    					
    					if(result=="OK") {
    					$("#idCheckMsg").text("사용가능한 아이디 입니다.").css("color" , "green");    
    					inputIdCheck =true;
    					}else {
    					$("#idCheckMsg").text("이미 사용중인 아이디 입니다.").css("color" , "red");  		
    					inputIdCheck =false;
    					}
    				}
	
    			});
    			
    		}
    		
    	})

    });
    
    </script>
    

    <!-- 비밀번호 길이 확인 -->
    <script type="text/javascript">
		$("#inputMpw").keyup(function(){
			var inputPw = $("#inputMpw").val();
			console.log("inputPw : " + inputPw);
			if( inputPw.length == 0 ){
				$("#pwCheckMsg").css("color","red").text("비밀번호를 입력해주세요.");
				inputPwCheck = false;
			} else if( inputPw.length < 6 || inputPw.length > 20 ){
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
		$("#checkMpw").keyup(function(){
			var inputPw = $("#inputMpw").val();
			console.log("inputPw : " + inputPw);
			var checkPw = $("#checkMpw").val();
			console.log("checkPw : " + checkPw);
	
			if( inputPw == checkPw ){
				$("#pwReCheckMsg").css("color","green").text("비밀번호가 일치합니다.");
				inputPwCheck = false;
			} else {
				$("#pwReCheckMsg").css("color","red").text("비밀번호가 일치하지 않습니다.");
				inputPwCheck = true;
				
			}
		});
		</script>		
		
		
		
		
		
    <!-- 이름 길이 확인 -->
    <script type="text/javascript">
		$("#inputMname").keyup(function(){
			var inputName = $("#inputMname").val();
			console.log("inputName : " + inputName);
			if( inputName.length == 0 ){
				$("#nameCheckMsg").css("color","red").text("이름을 입력해주세요.");
				inputNameCheck = false;
			} else if( inputName.length < 2 || inputName.length > 10 ){
				$("#nameCheckMsg").text("이름은 2~10자리 입니다.").css("color", "red");
				inputNameCheck = false;
				
			} else {
				$("#nameCheckMsg").css("color","green").text("사용가능한 이름 입니다.");
				inputNameCheck = true;
				
			}
		});
		</script>
		
    <!-- 닉네임 길이 확인 -->
    <script type="text/javascript">
		$("#inputMnickname").keyup(function(){
			var inputNickname = $("#inputMnickname").val();
			console.log("inputNickname : " + inputNickname);
			if( inputNickname.length == 0 ){
				$("#nicknameCheckMsg").css("color","red").text("닉네임을 입력해주세요.");
				inputNicknameCheck = false;
			} else if( inputNickname.length < 2 || inputNickname.length > 10 ){
				$("#nicknameCheckMsg").text("닉네임은 2~10자리 입니다.").css("color", "red");
				inputNicknameCheck = false;				
			} else {
				$("#nicknameCheckMsg").css("color","green").text("사용가능한 닉네임 입니다.");
				inputNicknameCheck = true;
				
			}
		});
		</script>					
		
		
		
		
		

<!-- 입력칸 유무 확인 -->
     <script type="text/javascript">
    
    function joinFormCheck(){
    	/*아이디 유뮤*/
    	
    	console.log("joinFormCheck 호출");
    	console.log(inputIdCheck);
    	
    	if(!inputIdCheck){
    		alert("아이디를 입력해주세요");
    		$("#inputMid").focus();
    		return false;
    	}
    	/*이름 유무*/
    	if($("#inputMname").val().length == 0){
    		alert("이름을 입력해주세요.");
    		$("#inputMname").focus();
    		return false;
    	}
    	
    	/*비밀번호 유무*/
    	if($("#inputMpw").val().length == 0){
    		alert("비밀번호를 입력해주세요.");
    		$("#inputMpw").focus();
    		return false;
    	}
    	
    	/*비밀번호 확인*/
    	if($("#checkMpw").val() != $("#inputMpw").val()){
    		alert("비밀번호 확인해주세요.");
    		$("#checkMpw").focus();
    		return false;
    	}

    	/*닉네임 유무*/
    	if($("#inputMnickname").val().length == 0){
    		alert("닉네임을 입력해주세요.");
    		$("#inputMnickname").focus();
    		return false;
    	}
    	
    	/*전화번호 유무*/
    	if($("#inputMphone").val().length == 0){
    		alert("전화번호를 입력해주세요.");
    		$("#inputMphone").focus();
    		return false;
    	} 
    	
    	/*이메일 유무*/
    	if($("#inputEmailId").val().length == 0){
    		alert("이메일을 입력해주세요.");
    		$("#inputEmailId").focus();
    		return false;
    	}   
    	if($("#inputEmailDomain").val().length == 0){
    		alert("이메일도메인을 입력해주세요.");
    		$("#inputEmailDomain").focus();
    		return false;
    	}
    	
    	/*관심지역 유무*/
    	if($("#inputmregion").val().length == 0){
    		alert("관심지역을 선택해주세요.");
    		$("#inputmregion").focus();
    		return false;
    	} 
    	
   

    }
    
    </script>
	
	
	<!-- 이메일 도메인 script -->
	<script type="text/javascript">
		
	$("#domainSelect").change(function(){	
		var domainVal = $("#domainSelect").val();
		console.log(domainVal);
		$("#inputEmailDomain").val(domainVal);	
		});	
	
	</script>

	<!-- 관심지역 script -->
	<script type="text/javascript">
		
	$("#regionSelect").change(function(){	
		var regionVal = $("#regionSelect").val();
		console.log(regionVal);
		$("#inputmregion").val(regionVal);	
		});	
	
	</script>	
	
	
	<!-- 파일 input 이름 생성 -->
	<script type="text/javascript">
	$("#inputMfile").on('change',function(){
		  var fileName = $("#inputMfile").val();
		  $(".upload-name").val(fileName);
		});
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