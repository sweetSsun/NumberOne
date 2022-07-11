<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 공지작성</title>

<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
	table{
		width:70%;
		border:1px solid black;
		margin-left: auto; margin-right: auto;
	};
	
	th, td{
		padding-left: 40px;
	}
	.roomtxtarea{
		width=:65%;
	}
	
	.mainfile{
		border-style: inherit;
    	border-color: internal-light-dark;
		padding: 6px;
		background-color: #BDB4A3;	
		color: white;
		border-radius: 6px;
	}
	
	span:hover {
		/* border: 1px solid #897B63; */
		padding: 6px;
		background-color: #AFA58F;	
		color: white;
		border-radius: 6px;
	}
	
	.d_none{ display:none; }
	
	.tableHead{ padding-left: 40px; }
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
				<h1 class="text-center">공지 작성페이지 : Admin_NoticeWriteForm.jsp</h1>
				<div>
 				<form action="admin_insertNoticeWrite" method="post" enctype="multipart/form-data" onsubmit="return inputCheck()">
				<table>
					<tr class="tableRow">
						<th class="tableHead">작성자</th>
						<!-- imhido 부분은 나중에 로그인 아이디로 출력 -->
						<td colspan="3">${mnickname}</td>						
					</tr>
					<tr class="tableRow">
						<!-- th, td에 패딩, 마진을 주고 싶은데 먹히지 않아서 tableHead 클래스로 여백 줬슴당 -->
						<th class="tableHead">제목</th>
						<td colspan="3">
							<input type="text" id="title" name="nbtitle" placeholder="제목을 입력하세요" size="35%">
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">내용</th>
						<td colspan="3">
							<textarea rows="15" cols="40" id="contents" name="nbcontents" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">대표사진</th>
						<td colspan="3">
							<!--  
							<input type="text" id="mainImgScreen"> <span class="mainfile"><label for="mainImg">대표사진 선택</label></span>
							-->
							<input type="file" id="nbImg" name="nbimgfile" class="" accept="image/*" onchange="checkFileType(this)"> 
						</td>
					</tr>
					<tr class="tableRow">
						<th colspan="4">
							<center>
							<button type="submit">등록</button> 
							<!-- 취소하면 돌아갈 페이지가 없어서 취소는 function 연결만 되어 있음-->
							<button type="button" onclick="withdraw()">취소</button>
							</center>
						</th>
					</tr>
				</table>
				</form>
            </div>

			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$("#nbImg").change(function(){
		var nbImg = $("#nbImg").val().split("path")[1];
		nbImg = nbImg.substring(1);
		console.log("선택된메인이미지: "+nbImg);
		$("#mainImgScreen").val(nbImg);
	})
	
	function withdraw(){
		console.log("취소 버튼 클릭");
		location.href="admin_selectNoticeList${paging.makeQueryPage(paging.page)}";
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
			/*
			var parent_Obj = obj.parentNode
			var node = parent_Obj.replaceChild(obj.cloneNode(true),obj);
			*/
			return false;
		}
	}
</script>

</body>
</html>