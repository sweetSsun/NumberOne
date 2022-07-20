<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/resources/css/BarCss.jsp" %>
<title>1인자 - 후기글 수정페이지</title>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   

<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	select{
		width: 200px;
		text-align : center;
		border : none;
		color : #00bcd4;
	}
	option{
		color :#00bcd4;
		font-weight: bold;
	}
	.bdtitle{
		border: none;
		font-weight: bold;
		font-size: 20px;
		height: 22px;
		margin: auto;
	}
	.bdcontents{
		border-radius: 5px;
		border: solid gray 2px;
		font-size: 19px;
	}
	.btn-wrapper{
		width: 100%;
		text-align: center;
		display:inline-block;
	}
	.buttons{
		margin: auto;
		display: block;
		
	}
	.selectPlaceHolder{
		display: none;
	}
	textarea:focus {
 	   outline: none;
	}
	input:focus{
	   outline: none;	
	}
	.bdCategoryList{
		color : #00bcd4;
		border: none;
		font-size: 20px;
	}
	.bdRegionSel{
		color : #00bcd4;
		border: none;
		font-size: 20px;
	}
	
	/*  */
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    color: #00bcd4;
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    color: #00bcd4;
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    color: #00bcd4;
}
	.img-container{
     overflow: hidden;
     display: flex;
     align-items: center;
     justify-content: center;
     border: solid #E0E0E0 2px;
     margin-top: 5%;
     width: 200px;
     height: 200px;
     
   }
   #upload_Img{
   	width: 200px;
   	height: 200px;
   	object-fit: cover;
   }
	span.x{ 
		/* 사진 X 버튼 */
		background-color: #00bcd4; 
		border-radius: 100%; 
		color: white; 
		position: absolute; 
		top: 10px; 
		right: 5px; 
		cursor: pointer;
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
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Community.jsp" %>
		
		<section>
			<!-- 본문 -->
			<div class="container">
				<h2 class="text-center">후기글 수정페이지 : ReviewBoardModifyForm.jsp</h2>
				<form action="updateBoardModify" method="post" enctype="multipart/form-data" >
				<div class="row">
					<input type="hidden" name="bdmid" value="${board.bdmid }">
					<input type="hidden" name="bdcode" value="${board.bdcode }">
					<input type="hidden" class="fw-bold" name="bdnickname" value="${board.bdnickname }">
					<hr>
				</div>
				
				<div class="row">
					<div class="col-6">
						 <span style="font-size:20px;">게시판</span><span class="text-danger">*</span>
						<select name="bdcategory" class="bdCategoryList" required="required">
							<option value="후기">후기</option>
						</select>
					</div>
					<div class="col-6">
						<span style="font-size:20px;">지역</span>
						<select name="bdrgcode" class="bdRegionSel">
							<option value="${board.bdrgcode }"  class="selectPlaceHolder">${board.bdrgname }</option>
							<option value="ALL">전국</option>
							<option value="SEL">서울</option>
							<option value="ICN">인천</option>
							<option value="GWD">강원</option>
							<option value="CCD">충청</option>
							<option value="GGD">경기</option>
							<option value="JLD">전라</option>
							<option value="GSD">경상</option>
							<option value="JJD">제주</option>
						</select>
					</div>
				</div>
				<hr>
				<div class="row">
					<input class="bdtitle" name="bdtitle" type="text" value="${board.bdtitle }">
				</div>
				<hr>
				<!-- 별점 -->
					<div class="row">
						<div class="col" class="mb-3" id="myform">
							<fieldset>
								<input type="radio" name="bdrate" value="5" id="rate1"><label
									for="rate1">★</label>
								<input type="radio" name="bdrate" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="bdrate" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="bdrate" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="bdrate" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
						</div>
					</div>	
				<div class="row">
					<textarea class="bdcontents" rows="17" cols="80" name="bdcontents">${board.bdcontents }</textarea>
				</div>
				
				<!-- 첨부파일! 나중에 경로 및 name 수정  -->
				<c:if test="${board.bdimg != null }">
					<div class="img-container" id="img-container" style="position: relative;">
						<img title="업로드 이미지" id="upload_Img" alt="" src="${pageContext.request.contextPath }/resources/img/board/${board.bdimg }">
						<span class="x" onclick="currentImgStateUpdate()">&nbsp;X&nbsp;</span>
					</div>
					<div style="background-color: #00bcd4; width: 200px; color:white;" class="text-center fw-bold">
						업로드 이미지
					</div>			
				</c:if >
					<input type="hidden" name="del_bdimg" id="del_bdimg" >
					<input type="hidden" name="bdimg" id="bdimg" value="${board.bdimg }">
				
				<div class="row" style="margin-top: 3%;">
					<div class="image-container" style="width: 300px; heigth:300px;">
	    				<img title="이미지 미리보기" style="width: 200px; heigth:200px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
						<!-- 파일선택 -->
						<input id=input-image type="file" name="bdimgfile" accept="image/*"  >
						<!-- <input type="file" style="display: block;" id="input-image" name="bdimgfile" accept="image/*" > -->
					</div>
				</div>
				
				<!-- 수정, 취소 버튼 -->
				<div class="row mt-4">
					<div class="col btn-wrapper">
						<input class="btn btn-lg buttons fw-bold text-white" style="background-color:#00bcd4;" type="submit" value="수정">
						<input onclick="bdWriteCancelCheckModal()" class="btn btn-lg buttons fw-bold text-white" style="background-color:#00bcd4;" type="button" value="취소">
					</div>
				</div>
			</form>
			</div>	
			
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	
	<!-- 게시글 작성 취소 확인 -->
	<div class="modal fade" id="bdWriteCancelCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 게시글 작성 취소 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	<span class="fw-bold">게시글 작성을 취소하시겠습니까?</span>
                	<br>
                	<span class="fw-bold">이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.</span>
                </div>	
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn btn-info text-white" onclick="modifyBoardCancel()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		
		/* 별점 출력 */
		var bdrate = ${board.bdrate};
		console.log("별점 : " + bdrate);
		
		var radio = $("input[type=radio][name=bdrate]");
		console.log(radio);
		for( var i=0; i< radio.length; i++){
			if( radio.eq(i).val() == bdrate ){
				radio.eq(i).attr("checked", "checked");
			}
		}
		
	});
</script>

<script type="text/javascript">
	//선택한 글번호 
	var bdcode = '${board.bdcode}';
	//현재 로그인중인 아이디
	var loginId = '${sessionScope.loginId}';
	
</script>

<script type="text/javascript">
	function bdWriteCancelCheckModal(){
	/* 게시글 작성 취소버튼 클릭시 모달 출력 */
	$("#bdWriteCancelCheckModal").modal('show');
}
</script>

<script type="text/javascript">
	// 게시글 삭제 경고 모달창 close 하는 스크립트
 	var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#bdWriteCancelCheckModal").modal("hide");
		});
	}
</script>

<script type="text/javascript">
	function modifyBoardCancel(){
		/* 수정취소 */
		history.back();
	}
	
	function currentImgStateUpdate(){
		/* 이미지 삭제*/
		var bdimg = '${board.bdimg}';
		$("#del_bdimg").val(bdimg);
		
		var delImgCheck = $("#del_bdimg").val();
		console.log(delImgCheck);
		
		$("#img-container").css("display", "none");
	}
</script>


</html>