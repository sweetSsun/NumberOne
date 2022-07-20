<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공지수정</title>

<!-- Css Styles -->
<%@ include file="/resources/css/BarCss.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
	section{
		max-width: 70%;
		margin: auto;
		margin-top: 0%;
	}
	.textarea-NbView{
		resize: none;
		width: -webkit-fill-available;
		min-height: 20rem;
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
	textarea:focus {
 	   outline: none;
	}
	input:focus{
	   outline: none;	
	}
	.d_none{
		display: none;
	}
</style>

</head>

<!-- jquery -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

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
					<h4 class="text-center">공지 수정페이지 : Admin_NoticeModifyForm.jsp</h4>
				</div>
				<div>
 				<form action="admin_updateNoticeModify${paging.makeQueryPage(noticeBoard.nbcode, paging.page)}" method="post" enctype="multipart/form-data" onsubmit="return inputCheck()">
 				<!-- 수정 불가능한 값 숨기고 submit에는 데이터 넘겨주는 변수 -->
 				<input type="hidden" name="nbcode" value="${noticeBoard.nbcode }">
 				<input type="hidden" name="originImg" value="${noticeBoard.nbimg }">
 				
 				<div class="row">
					<input type="text" id="title" class="bdtitle" name="nbtitle" maxlength="50" value="${noticeBoard.nbtitle }">
				</div>
				<hr>
				<div class="row">
					<textarea id="contents" class="bdcontents textarea-NbView" rows="17" cols="40" name="nbcontents"  
						maxlength="2000" placeholder="내용을 입력하세요">${noticeBoard.nbcontents }</textarea>
				</div>
				<div class="row mt-4">
					<c:if test="${noticeBoard.nbimg != null }">
						<img src="${pageContext.request.contextPath }/resources/img/noticeUpLoad/${noticeBoard.nbimg}" style="max-width:100px;">
					</c:if>
					<input type="file" id="nbImg" name="nbimgfile" class="" accept="image/*" onchange="checkFileType(this)"> 
				</div>
				<div class="row mt-4 mb-2">
					<div class="col btn-wrapper">
						<input class="btn-numberone btn-md fw-bold text-white" type="submit" value="수정">
						<input onclick="$('#nbWriteCancelCheckModal').modal('show')" class="btn-numberone btn-md fw-bold text-white" type="button" value="취소">
					</div>
				</div>	
 				
 				<%-- <table>
					<tr class="tableRow">
						<th class="tableHead">작성자</th>
						<!-- imhido 부분은 나중에 로그인 아이디로 출력 -->
						<td colspan="3">${nbnickname}</td>						
					</tr>
					<tr class="tableRow">
						<!-- th, td에 패딩, 마진을 주고 싶은데 먹히지 않아서 tableHead 클래스로 여백 줬슴당 -->
						<th class="tableHead">제목</th>
						<td colspan="3">
							<input type="text" id="title" name="nbtitle" placeholder="제목을 입력하세요" size="35%" value="${noticeBoard.nbtitle }">
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">내용</th>
						<td colspan="3">
							<textarea rows="15" cols="40" id="contents" name="nbcontents" placeholder="내용을 입력하세요">${noticeBoard.nbcontents }</textarea>
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">대표사진</th>
						<td colspan="3">
							<c:if test="${noticeBoard.nbimg != null }">
								<img src="${pageContext.request.contextPath }/resources/img/noticeUpLoad/${noticeBoard.nbimg}" style="max-width:100px;">
							</c:if>
							<input type="file" id="nbImg" name="nbimgfile" class="" accept="image/*" onchange="checkFileType(this)"> 
						</td>
					</tr>
					<tr class="tableRow">
						<th colspan="4">
							<center>
							<button type="submit">수정</button> 
							<!-- 취소하면 돌아갈 페이지가 없어서 취소는 function 연결만 되어 있음-->
							<button type="button" onclick="withdraw()">취소</button>
							</center>
						</th>
					</tr>
				</table> --%>
				</form>
            </div>

			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
	
	<!-- 게시글 작성 취소 확인 -->
	<div class="modal fade" id="nbWriteCancelCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> 공지글 작성 취소 </h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" >
                	<span class="fw-bold">공지글 작성을 취소하시겠습니까?</span>
                	<br>
                	<span class="">이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.</span>
                </div>	
                <div class="modal-footer">
                	<input type="hidden" >
                    <button class="close btn-numberone text-white" onclick="writeBoardCancel()" >네</button>
                    <button class="close btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
	// 공지글 수정 취소 경고 모달창 close 하는 스크립트
		var modal = $(".modal");
	var close = $(".close");
	for (var i = 0; i < close.length; i++){
		close[i].addEventListener("click", function(){
			$("#nbWriteCancelCheckModal").modal("hide");
		});
	}
</script>

<script type="text/javascript">
	// 공지글 수정 취소
	function writeBoardCancel(){
		console.log("취소 버튼 클릭");
		location.href="admin_selectNoticeBoardView${paging.makeQueryPage(noticeBoard.nbcode, paging.page)}";
	}
	
	// 제목, 내용 입력됐는지 확인
	function inputCheck(){
		var titleObj = $("#title");
		var contentsObj = $("#contents");
		console.log(titleObj.val());
		console.log(contentsObj.val());
		if (titleObj.val().length == 0){
			alert("제목을 입력해주세요.");
			titleObj.focus();
			return false;
		}
		if (contentsObj.val().length == 0){
			alert("내용을 입력해주세요.");
			contentsObj.focus();
			return false;
		}
	}
	
	// 이미지 파일을 업로드 했는지 확인
	function checkFileType(obj) {
		var file_kind = obj.value.lastIndexOf('.');
		var file_name = obj.value.substring(file_kind+1, obj.length);
		var file_type = file_name.toLowerCase();

		var checkType = new Array();
		checkType = ['jpg','gif','png','jpeg','bmp'];
		
		if(checkType.indexOf(file_type) == -1){
			alert('이미지 파일만 선택할 수 있습니다.');
			$("#nbImg").val("");
			$("#nbImg").replaceWith($("#nbImg").clone(true));
			return false;
		}
	}
	
</script>

</body>
</html>