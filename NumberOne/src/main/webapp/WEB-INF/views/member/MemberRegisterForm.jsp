<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 회원가입페이지</title>

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
    width : 350px;
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




</style>

</head>
<body>
	<!-- TobBar -->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End of TobBar -->

	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp"%>

		<section>
			<!-- 본문 -->
        <div class="container">

            <div class="checkout__form">
                <h4>회원가입</h4>
                <form class="user" action="insertRegisterWrite" method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck()">
                    <div class="row">
                        <div class="col-lg-12 col-md-6">
                        <!-- ID , 이름 -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>아이디<span>*</span></p>
                                        <input type="text" placeholder="영문&숫자 5~10자로 입력해주세요." id="inputMid" name="mid">
                                        <span id="idCheckMsg" class="msg"></span>  
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text" id="inputMname" name="mname" placeholder="2~10자로 입력해주세요.">
                                        <span id="nameCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>
                        <!-- 비번 , 비번확인 -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>비밀번호<span>*</span></p>
                                        <input type="text" placeholder="영문&숫자 6~20자로 입력해주세요." id="inputMpw" name="mpw">
									<span id="pwCheckMsg" class="msg"></span>                                      
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>비밀번호확인<span>*</span></p>
                                        <input type="text" placeholder="비밀번호를 확인해주세요." id="checkMpw">
									<span id="pwReCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>                            
                        <!-- 닉네임 , 성별 -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>닉네임<span>*</span></p>
                                        <input type="text" placeholder="2~10자로 입력해주세요." id="inputMnickname" name="mnickname">
 									<span id="nicknameCheckMsg" class="msg"></span>                                   
                                    </div>
                                </div>
                            <!-- 전화번호 -->
                           
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>전화번호<span>*</span></p>
                                        <input type="text" id="inputMphone" name="mphone" placeholder="'-' 포함하여 번호 입력해주세요.">
 									<span id="phoneCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                                <div class="col-lg-6">
                            </div> 
                            </div> 
                                                        
                                                      
                            <!-- 이메일 --> 
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="checkout__input">
                                        <p>이메일<span>*</span></p>
                                        <input type="text"  id="inputEmailId" name="memailId" placeholder="이메일 아이디">
 									<span id="emailIdCheckMsg"></span>                                        
                                    </div> 
                                </div> 
                                <div class="col-lg-1">
                                    <div class="checkout__input" style="margin-top:50px; margin-left:18px;">    
                                       @
                                    </div> 
                                </div>                                
                                <div class="col-lg-4">
                                    <div class="checkout__input">
                                        <p style="margin-top: 45px;">
                                        <input type="text" id="inputEmailDomain" name="memailDomain" placeholder="이메일 도메인"></p>
 									<span id="emailDomainCheckMsg"></span>                                         
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="checkout__input" style="margin-top: 45px;">
                                        <select id="domainSelect">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>hanmail.net</option>
										</select>
                                    </div>
                                </div> 
                            </div>                                                          
                            <!-- 주소 -->
                           <div class="checkout__input">
                                <p>주소<span>*</span></p>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <input type="text" class="form-control form-control-user" id="sample6_postcode" name="mpostcode" placeholder="우편번호"> 
 									<span id="postcodeCheckMsg"></span>                                    
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div >
                                        <input type="button"  class="addr-btn" style="color : white; background-color: #999999; border: 0px;"
                                        onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                    </div>
                                </div>
                            </div>
                            <!-- 기본 주소 -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_address" name="maddress" placeholder="주소">
 									<span id="addressCheckMsg"></span>                                    
                                    </div>
                                </div>
                            </div> 
                            <!-- 상세 주소 -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_detailAddress" name="mdetailAddr" placeholder="상세주소">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_extraAddress" name="mextraAddr" placeholder="참고항목">
                                    </div>
                                </div>
                            </div>                            
                            
                            
                            </div>

                          <!-- 파일 업로드 -->
 							<div class="filebox checkout__input">
							<p>프로필 사진</p>
    							<input class="upload-name" value="첨부파일" placeholder="첨부파일" id="inputFile" >
    							<label for="inputMfile" >파일찾기</label> 
    							<input type="file" id="inputMfile" name="mfile" >
							</div>						
                            <!-- 상태메세지 -->                            
                            <div class="checkout__input">
                                <p>상태메세지</p>
                                <p><textarea cols="102" rows="2" id="inputMmessage" name="mmessage" placeholder="100자 이하로 입력해주세요." ></textarea></p>
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
	
	<!-- 스크립트 시작 -->
	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
	
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
    	$("#inputMid").keyup(function(){
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
    	if($("#inputEmailDomail").val().length == 0){
    		alert("이메일도메인을 입력해주세요.");
    		$("#inputEmailDomail").focus();
    		return false;
    	}
    	
    	/*주소 유무*/
    	if($("#sample6_postcode").val().length == 0){
    		alert("주소를 입력해주세요.");
    		$("#sample6_postcode").focus();
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