<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 회원정보수정</title>

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
    /* width : 350px; */
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
    /* position: absolute; */
    width: 0; 
    height: 0; 
    padding: 0;
    /* overflow: hidden; */
    border: 0;
}


.msg {
	font-size: 15px;
}

.site-btn {

background-color: #00BCD4;

}

.msgTextarea {
	height: 120px;
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
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp"%>

		<section>
			<!-- 본문 -->
        <div class="container">

            <div class="checkout__form">
                <h4>회원정보수정</h4>
                <form class="user" action="updateMyInfoMemberModify" method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck()">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        <!-- ID , 이름 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>아이디<span>*</span></p>
                                        <input type="text" placeholder="영문&숫자 5~10자로 입력해주세요." id="inputMid" name="mid" value="${memberInfo.mid }"
                                        style="background-color: #EAEAEA " readonly="readonly">
                                        <span id="idCheckMsg" class="msg"></span>  
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text" id="inputMname" name="mname" placeholder="2~10자로 입력해주세요."  value="${memberInfo.mname }">
                                        <span id="nameCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>
                        <!-- 비번 , 비번확인 -->
                        <c:if test="${memberInfo.mpw != 12121212}">
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>비밀번호<span>*</span></p>
                                        <input type="text" placeholder="영문&숫자 6~20자로 입력해주세요." id="inputMpw" name="mpw"  value="${memberInfo.mpw }">
									<span id="pwCheckMsg" class="msg"></span>                                      
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>비밀번호확인<span>*</span></p>
                                        <input type="text" placeholder="비밀번호를 확인해주세요." id="checkMpw">
									<span id="pwReCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>
                           </c:if>
                           <c:if test="${memberInfo.mpw == 12121212}">
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <!-- <p>비밀번호<span>*</span></p> -->
                                        <input type="hidden" placeholder="영문&숫자 6~20자로 입력해주세요." id="inputMpw" name="mpw"  value="${memberInfo.mpw }">
									<span id="pwCheckMsg" class="msg"></span>                                      
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <!-- <p>비밀번호확인<span>*</span></p> -->
                                        <input type="hidden" placeholder="비밀번호를 확인해주세요." id="checkMpw" value="${memberInfo.mpw }">
									<span id="pwReCheckMsg" class="msg"></span>                                    
                                    </div>
                                </div>
                            </div>                           
                           </c:if>                             
                        <!-- 닉네임 , 성별 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>닉네임<span>*</span></p>
                                        <input type="text" placeholder="2~10자로 입력해주세요." id="inputMnickname" name="mnickname"  value="${memberInfo.mnickname }">
 									<span id="nicknameCheckMsg" class="msg"></span>                                   
                                    </div>
                                </div>
                            <!-- 전화번호 -->
                           
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>전화번호<span>*</span></p>
                                        <input type="text" id="inputMphone" name="mphone" placeholder="'-' 포함하여 번호 입력해주세요."  value="${memberInfo.mphone }">
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
                                        <input type="text"  id="inputEmailId" name="memailId" placeholder="이메일 아이디"  value="${memberInfo.memailId }">
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
                                        <input type="text" class="selectOption" id="inputEmailDomain" name="memailDomain" placeholder="이메일 도메인"  value="${memberInfo.memailDomain }"></p>
 									<span id="emailDomainCheckMsg"></span>                                         
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-12 col-sm-12">
                                    <div class="checkout__input" style="margin-top: 45px;">
                                        <select id="domainSelect" class="selectOption">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>hanmail.net</option>
										</select>
                                    </div>
                                </div> 
                            </div>               
                            <!-- 관심지역 -->
                            <div class="row">
                                <div class="col-lg-5 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <p>관심지역<span>*</span></p>
                                        <input type="text" class="selectOption" id="inputmregion" name="mregion" value="${memberInfo.mregion }">
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
                                        <input type="text" class="form-control form-control-user" id="sample6_postcode" name="mpostcode" placeholder="우편번호"
                                         value="${memberInfo.mpostcode }"> 
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
                                        <input type="text"  class="form-control form-control-user" id="sample6_address" name="maddress" placeholder="주소"
                                         value="${memberInfo.maddress }">
 									<span id="addressCheckMsg"></span>                                    
                                    </div>
                                </div>
                            </div> 
                            <!-- 상세 주소 -->
                            <div class="row">
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_detailAddress" name="mdetailAddr" placeholder="상세주소"
                                         value="${memberInfo.mdetailAddr }">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12 col-sm-12">
                                    <div class="checkout__input">
                                        <input type="text"  class="form-control form-control-user" id="sample6_extraAddress" name="mextraAddr" placeholder="참고항목"
                                         value="${memberInfo.mextraAddr }">
                                    </div>
                                </div>
                            </div>                            
                            
                            
                            </div>

                          <!-- 파일 업로드 -->
                          <c:if test="${memberInfo.mpw != 12121212}">
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
						</c:if>
                          <!-- 파일 업로드 카카오 display: none -->
                          <c:if test="${memberInfo.mpw == 12121212}">
								<div class="row" style="display: none;">
									<div class="col-lg-6 col-md-12 col-sm-12">
    									<input class="upload-name" type="text"
    									value="${memberInfo.mprofile }" placeholder="첨부파일" id="inputFile" >
    								</div>	
									<div class="col-lg-6 col-md-12 col-sm-12">    						
    									<label for="inputMfile" >파일찾기</label> 
    									<input type="file" id="inputMfile" name="mfile" value="" class="">
									</div>
								</div>	
			
						</c:if>
														
                            <!-- 상태메세지 -->                            
                            <div class="checkout__input">
                                <p>상태메세지</p>
                                <p><textarea class="msgTextarea" id="inputMmessage" name="mmessage" placeholder="100자 이하로 입력해주세요.">${memberInfo.mmessage }</textarea></p>
                            </div>
                          <!-- 끝 -->
						<br>
                        <button type="submit" class="site-btn" style="width: 130px; margin-left: 40%; border-radius: 4px;">
                        수정완료</button>
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