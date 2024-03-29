<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 회원가입페이지</title>
	
<!--jquery & bootstrap(5css)-->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">



<!-- ogani css -->
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">  --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">         
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style type="text/css">

	.checkout__form {
	  padding: 100px 100px;
	}

	.selectOption{
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
	
	textarea {
		padding: 10px;
		border: 1px solid #808080;
		border-radius : 4px;
	}

	
/* 첨부파일 CSS */
/* 1. 인풋 스타일 변경 */
.filebox .upload-name {
	font-size:15px;
    display: inline-block;
    height: 40px;
   /*  width : 350px; */
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #808080;
    border-radius : 4px;
    /* width: 78%; */
    color: #999999;
}
/* 2. label 스타일 변경 */
.filebox label {
	font-size:15px;
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
    margin-top: 0px;
    border-radius : 4px;
}
/* 3. 기존 디자인 없애기 */
.filebox input[type="file"] {
    position: absolute;
    width: 0; 
    height: 0; 
    padding: 0;
    overflow: hidden;
    border: 0;
}


.msg {
	font-size: 15px;
}

.site-btn {

background-color: #00BCD4;

}

.msgTextarea {
	height: 100%;
	width: 100%;
	border-radius: 5px; 
	padding:10px 10px;
	resize: none;
  	overflow-y: scroll;
}

.msgTextarea::-webkit-scrollbar {
    width: 10px;  /* 스크롤바의 너비 */
    
}

.msgTextarea::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    background:  #999999; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

.msgTextarea::-webkit-scrollbar-track {
    background: #EAEAEA;  /*스크롤바 뒷 배경 색상*/
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
                <h4>회원가입</h4>
                <form class="user" action="insertRegisterWrite" method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck()">
                    <div class="row">
                        <div class="col-lg-12  col-md-12 col-sm-12">
                        <!-- ID , 이름 -->
                            <div class="row">
                                <div class="col-lg-6  col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>아이디<span>*</span></p>
                                        <input type="text" placeholder="영문&숫자 5~12자 입력해주세요. (특수문자 제외) " id="inputMid" name="mid" 
                                        onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
                                        <span id="idCheckMsg" class="msg"></span>  
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text" id="inputMname" name="mname" placeholder="2~10자로 입력해주세요.">
                                        <span id="nameCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>
                        <!-- 비번 , 비번확인 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>비밀번호<span>*</span></p>
                                        <input type="password" placeholder="영문&숫자 6~20자로 입력해주세요." id="inputMpw" name="mpw">
									<span id="pwCheckMsg" class="msg"></span>                                      
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>비밀번호확인<span>*</span></p>
                                        <input type="password" placeholder="비밀번호를 확인해주세요." id="checkMpw">
									<span id="pwReCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>                            
                        <!-- 닉네임 , 성별 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>닉네임<span>*</span></p>
                                        <input type="text" placeholder="2~10자로 입력해주세요. (특수문자 제외) " id="inputMnickname" name="mnickname" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
 									<span id="nicknameCheckMsg" class="msg"></span>                                   
                                    </div>
                                </div>
                            <!-- 전화번호 -->
                           
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>전화번호<span>*</span></p>
                                        <input type="text" id="inputMphone" name="mphone" placeholder="'-' 포함하여 번호 입력해주세요." onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
 									<span id="phoneCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                            </div> 
                            </div> 
                                                        
                                                      
                            <!-- 이메일 --> 
                            <div class="row">
                                <div class="col-lg-5 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>이메일<span>*</span></p>
                                        <input type="text"  id="inputEmailId" name="memailId" placeholder="이메일 아이디">
 									<span id="emailIdCheckMsg"></span>                                        
                                    </div> 
                                </div> 
                                <div class="col-lg-1 col-md-12 col-sm-12">
                                    <div class="checkout__input" style="margin-top:50px; margin-left:18px;">    
                                       @
                                    </div> 
                                </div>                                
                                <div class="col-lg-4 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p style="margin-top: 45px;">
                                        <input type="text" id="inputEmailDomain" name="memailDomain" placeholder="이메일 도메인"></p>
 									<span id="emailDomainCheckMsg"></span>                                         
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-12 col-sm-12">
                                    <div class="checkout__input" style="margin-top: 45px;">
                                        <select id="domainSelect"  class="selectOption">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
										</select>
                                    </div>
                                </div> 
                            </div> 
                            
   
                            
                            <!-- 관심지역 -->
                            <div class="row">
                                <div class="col-lg-5 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>관심지역<span>*</span></p>
                                        <input type="text"  id="inputmregion" name="mregion" placeholder="관심지역 선택" readonly="readonly">
 									<span id="regionCheckMsg"></span>                                        
                                    </div> 
                                </div>
                                <div class="col-lg-2 col-md-12 col-sm-12"> 
                                    <div class="checkout__input" style="margin-top: 45px;">
                                        <select id="regionSelect" class="selectOption">
										<option disabled selected>지역선택</option>
										<option value="서울">서울</option>
										<option value="인천">인천</option>
										<option value="경기">경기</option>
										<option value="경상">경상</option>
										<option value="전라">전라</option>
										<option value="충청">충청</option>										
										<option value="강원">강원</option>
										<option value="제주">제주</option>										
										</select>
                                    </div>                                      
                                </div>                                                                  
                            </div>                            
                                              
                            <!-- 주소 -->
                           <div class="checkout__input">
                                <p>주소</p>
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text" class="form-control form-control-user" id="sample6_postcode" name="mpostcode" placeholder="우편번호"> 
 									<span id="postcodeCheckMsg"></span>                                    
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div >
                                        <input type="button"  class="addr-btn" style="color : white; background-color: #999999; border: 0px;"
                                        onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                    </div>
                                </div>
                            </div>
                            <!-- 기본 주소 -->
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_address" name="maddress" placeholder="주소">
 									<span id="addressCheckMsg"></span>                                    
                                    </div>
                                </div>
                            </div> 
                            <!-- 상세 주소 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_detailAddress" name="mdetailAddr" placeholder="상세주소">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_extraAddress" name="mextraAddr" placeholder="참고항목">
                                    </div>
                                </div>
                            </div>                            
                            
                            
                            </div>

                          <!-- 파일 업로드 -->
 							<div class="filebox checkout__input col-lg-12 col-md-12 col-sm-12">
							<p>프로필 사진</p>
							<div class="row">
									<div class="col-lg-6 col-md-12 col-sm-12">
    									<input class="upload-name" 
    									value="${memberInfo.mprofile }" placeholder="첨부파일" id="inputFile" >
    								</div>	
									<div class="col-lg-6 col-md-12 col-sm-12">    						
    									<label for="inputMfile" >파일찾기</label> 
    									<input type="file" id="inputMfile" name="mfile" value="" class="">
									</div>
								</div>	
							</div>	
												
                            <!-- 상태메세지 -->                            
                            <div class="checkout__input">
                                <p>상태메세지</p>
                                <p><textarea class="msgTextarea" id="inputMmessage" name="mmessage" placeholder="100자 이하로 입력해주세요." ></textarea></p>
                            </div>
                          <!-- 끝 -->
						<br>
                        <button type="submit" class="site-btn" style="width: 130px; margin-left: 40%; border-radius: 4px;">
                        회원가입</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>
	<!--jquery & bootstrap(5js)-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  
	
	<!-- 다음 우편번호 서비스 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath }/resources/MemberJs/daumPostCode.js"></script>
    
 

 <script type="text/javascript">
	//특수문자 입력 방지
	function characterCheck(obj){
	var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-+┼<>@\#$%&\'\"\\\(\=]/gi; 
	//허용할 특수문자는 여기서 삭제하면 됨
	//지금은 띄어쓰기도 특수문자 처리됨 참고하셈
	if( regExp.test(obj.value) ){
		alert("특수문자 & 공백은 입력하실 수 없습니다.");
		obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
		}
	}


	//아이디 한글 금지!
 	$("#inputMid").keyup(function(event){ 
		if (!(event.keyCode >=37 && event.keyCode<=40)) { 
			var inputVal = $(this).val(); 
			var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
			if(check.test(inputVal)){ 
				$(this).val(""); 
				alert("영문으로 입력해주세요.");
			} 
		} 
	});
 	</script>  
 	
	<!-- 아이디 중복 체크 -->
    <script type="text/javascript">
    
    var inputIdCheck =false;
    var inputPwCheck = false;
    var inputNameCheck = false;
    var inputNicknameCheck = false;
    var inputEmailCheck = false;
    
    $(document).ready(function(){
    	console.log("스크립트 확인!");
    	
    	<!-- 아이디 중복 확인 -->
    	$("#inputMid").keyup(function(){
    		var inputId = $("#inputMid").val();
    		console.log("inputId : "+inputId);
    		
    		if(inputId.length == 0) {
    			$("#idCheckMsg").text("아이디를 입력 해주세요.").css("color" , "red");
    			inputIdCheck =false;
    		}else if( inputId.length < 5 || inputId.length > 12 ){
				$("#idCheckMsg").text("아이디는 5~12자리 입니다.").css("color", "red");
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

    <!-- 닉네임 중복 확인 -->
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
				
    			$.ajax({
    				type : "get",
    				url : "selectMemberNickname_ajax",
    				data : {"inputNickname" : inputNickname },
    				success : function(result){
    					
    					
    					if(result=="OK") {
    					$("#nicknameCheckMsg").text("사용가능한 닉네임 입니다.").css("color" , "green");    
    					inputIdCheck =true;
    					}else {
    					$("#nicknameCheckMsg").text("이미 사용중인 닉네임 입니다.").css("color" , "red");  		
    					inputIdCheck =false;
    					}
    				}
	
    			});
				
			}
		});
		</script>
		
		<!-- 이메일 중복 확인 -->
 		<script type="text/javascript">
  			
  		/*
		var emailId = $("#inputEmailId").val();
 		var memailDomain = $("#inputEmailDomain").val();
 		var inputEmail = "";
 		inputEmail = emailId+"@"+memailDomain;
 		console.log("inputEmail : "+ inputEmail);
 		*/
 		
 		const emailId = $("#inputEmailId");
 		const emailDomain = $("#inputEmailDomain");
 		const emailDomainSel = $("#domainSelect");
 		
 		
		//이메일 아이디 입력하면 중복 확인으로 연결하는 함수
 		emailId.on("focusout", function() {
 			if(emailId.val().lengh == 0){
 				return;
 			}
 			
 			console.log("이메일 아이디 입력");
 	 		
 			if( emailDomain.val().length != 0){
 				console.log("도메인도 입력")
 	 			var inputEmail = emailId.val()+"@"+emailDomain.val();
 				console.log("입력한 이메일: "+inputEmail)
 	 			selectMemberEmail_ajax(inputEmail);
 			}
         });
 		
 		
		//이메일 도메인 직접 입력하면 중복 확인으로 연결하는 함수
 		emailDomain.on("propertychange change keyup paste input", function() {
 			//propertychate, input은 작동을 하지 않는 듯 하다...
 			console.log("이메일 도메인 입력");
 	 		
 			if( emailId.val().length != 0){
 				console.log("아이디도 입력")
 	 			var inputEmail = emailId.val()+"@"+emailDomain.val();
 	 			selectMemberEmail_ajax(inputEmail);
 			}
         });
		
		//이메일 도메인 선택하면 중복 확인으로 연결하는 함수
 		emailDomainSel.on("change", function() {
 			console.log("이메일 도메인 선택");
 	 		
 			if( emailId.val().length != 0){
 				console.log("아이디도 입력")
 	 			var inputEmail = emailId.val()+"@"+emailDomainSel.val();
 	 			selectMemberEmail_ajax(inputEmail);
 			}
         });
		

 		
 		function selectMemberEmail_ajax(inputEmail){
 			
			console.log("이메일 중복 체크 함수 호출")
			$.ajax({
				type : "get",
				url : "selectMemberEmail_ajax",
				data : {"inputEmail" : inputEmail },
				success : function(result){
					console.log(result);
					
					if(result=="OK") {
					//$("#recheckEmail").text("사용가능한 닉네임 입니다.").css("color" , "green");  
					console.log("이메일 사용 가능")
					inputEmailCheck =true;
					
					}else {
					//$("#recheckEmail").text("이미 사용중인 닉네임 입니다.").css("color" , "red");  		
					console.log("이메일 사용 불가능")
					inputEmailCheck =false;
					alert("이미 사용중인 이메일 입니다")
					$("#inputEmailId").val("");
					$("#inputEmailDomain").val("");
					$("#inputEmailId").focus();
					}
				}

			});
 		}
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
		


<!-- 입력칸 유무 확인 -->
     <script type="text/javascript">
    
    function joinFormCheck(){
    	/*아이디 유뮤*/
    	
    	console.log("joinFormCheck 호출");
    	console.log(inputIdCheck);
    	
/*     	if(!inputIdCheck){
    		alert("아이디를 입력해주세요");
    		$("#inputMid").focus();
    		return false;
    	} */
    
  	
    	/*아이디 유무*/
    	if($("#inputMid").val().length == 0){
    		alert("아이디를 입력해주세요.");
    		$("#inputMid").focus();
    		return false;
    	}
    	
    	if($("#inputMid").val().length < 5 || $("#inputMid").val().length >12){
    		alert("아이디는 5~12자리 입니다.");
    		$("#inputMid").focus();
    		return false;
    	}

    	
    	/*이름 유무*/
    	if($("#inputMname").val().length == 0){
    		alert("이름을 입력해주세요.");
    		$("#inputMname").focus();
    		return false;
    	}

    	if($("#inputMname").val().length < 2 || $("#inputMname").val().length >10){
    		alert("이름은 2~10자리 입니다.");
    		$("#inputMname").focus();
    		return false;
    	}
    	
    	/*비밀번호 유무*/
    	if($("#inputMpw").val().length == 0){
    		alert("비밀번호를 입력해주세요.");
    		$("#inputMpw").focus();
    		return false;
    	}    	
    	
    	if($("#inputMpw").val().length < 6 || $("#inputMpw").val().length >20){
    		alert("비밀번호는 6~20자리 입니다.");
    		$("#inputMpw").focus();
    		return false;
    	}
    	
    	
    	/*비밀번호 확인*/
    	if($("#checkMpw").val() != $("#inputMpw").val()){
    		alert("비밀번호를 확인해주세요.");
    		$("#checkMpw").focus();
    		return false;
    	}

    	/*닉네임 유무*/
    	if($("#inputMnickname").val().length == 0){
    		alert("닉네임을 입력해주세요.");
    		$("#inputMnickname").focus();
    		return false;
    	}   	
    	
    	if($("#inputMnickname").val().length < 2 || $("#inputMnickname").val().length >10){
    		alert("닉네임은 2~10자리 입니다.");
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
		//console.log(domainVal);
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

	
	
		
</body>

</html>