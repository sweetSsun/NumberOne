<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 자취방 자랑 글수정</title>

<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 부트스트랩 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">-->


<style type="text/css">
	#roomWriteTable{
		width:80%;
		border:1px solid black;
		margin-left: auto; 
		margin-right: auto;
		padding : 10%;
	};

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
	
	.d_none{ display:none; }
	
	.tableHead{ 
		padding-top: 10px; 
		padding-bottom: 10px; 
		padding-left: 30px;
		
	}

	section{
      max-width: 70%;
      margin: auto;
      margin-top: 0%;
    }
	
	.title{ width : 13%; }
</style>

</head>
<!-- jquery -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<body>
	<!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
	<!-- End of TobBar -->
	
	<main>
		<!-- 사이드바 -->
		<%@ include file="/WEB-INF/views/includes/SideBar_Mypage.jsp" %>
		
		<section>
		<!-- 본문 -->
			<div class="container-fluid" >
			<br>
				<h1 class="text-center">자취방 자랑 글작성 페이지</h1>
				<div>
				<form action="insertRoomWrite" method="post" enctype="multipart/form-data" onsubmit="return roomRegisterCh()">
				<table id="roomWriteTable">
					<tr>
						<th class="tableHead">작성자</th>
						<!-- session의 로그인 닉네임로 출력 -->
						<td colspan="5">${sessionScope.loginNickname}</td>						
					</tr>
					
					<tr>
						<!-- th, td에 패딩, 마진을 주고 싶은데 먹히지 않아서 tableHead 클래스로 여백 줬슴당 -->
						<th class="tableHead title">제목</th>
						<td colspan="5">
							<input name="bdtitle" id="bdtitle" type="text" placeholder="제목을 입력하세요" style="width:90%">
						</td>
					</tr>
					<tr>
						<th class="tableHead title">내용</th>
						<td colspan="5">
							<textarea id="bdcontents" style="width:90%; height:300px;" name="bdcontents" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
					<tr>
						<th class="tableHead title">대표사진</th>
						<td colspan="5">
							<!--  
							<input type="text" id="mainImgScreen"> <span class="mainfile"><label for="mainImg">대표사진 선택</label></span>
							-->
							<input type="file" id="mainImg" name="bdimgfile" accept="image/*"> 
						</td>
					</tr>
					<tr>
						<th class="tableHead title">상세사진</th>
						<td colspan="5">
							<!--  
							<input type="text" id="detailImgScreen"> <span class="mainfile"><label for="detailImg">상세사진 선택</label></span>
							-->
							<input type="file" multiple="multiple" id="detailImg" name="bddetailimgfile" onclick="return mainimgCh()" accept="image/*">
							<div id="detailImgList"></div>
						</td>
					</tr>
					<tr>
						<th colspan="6" class="tableHead">
						<center>
							<input type="submit" value="등록">
							<input type="button" onclick="location.href='${pageContext.request.contextPath}/selectRoomList'" value="취소">
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
</body>
<script type="text/javascript">

	if('${sessionScope.loginId}'==null){
		console.log("로그인 후 이용가능합니다.");
		location.href = "loadTologin?afterUrl=loadTowriteRoom";
	}
	
	$("#mainImg").change(function(){
		var mainImg = $("#mainImg").val().split("path")[1];
		mainImg = mainImg.substring(1);
		console.log("선택된메인이미지: "+mainImg);
		$("#mainImgScreen").val(mainImg);
	})
		
	$("#detailImg").change(function(){
		
		var detailImg = $("#detailImg")[0].files;
		console.log(detailImg);
		var output = "";
		for(var i=0; i<detailImg.length; i++){
			output += "<div>"+detailImg[i].name+"</div>";
		}
		$("#detailImgList").html(output);
	})
	
	function withdraw(){
		console.log("취소 버튼 클릭");
	}
	
	function mainimgCh(){
		console.log("메인이미지 확인 함수");
		var mainImg = $("#mainImg").val();
		console.log(mainImg);
		if(mainImg==""){
			alert("대표 사진을 먼저 선택하세요!");
			return false;
		}
	} 
	
	function  roomRegisterCh(){
		console.log("자취방 자랑글 등록 확인");
		if($("#bdtitle").val()==""){
			alert("제목을 입력하세요");
			return false;
		} else if ($("#bdcontents").val()==""){
			alert("내용을 입력하세요");
			return false;
		} else if ($("#mainImg").val()==""){
			alert("대표 사진은 필수 사항입니다!");
		}
		return true;
	}
</script>

</html>























