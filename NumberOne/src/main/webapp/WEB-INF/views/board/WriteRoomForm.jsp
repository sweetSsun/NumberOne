<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자 - 자취방 자랑 글 작성</title>

<%@ include file="/resources/css/BarCss.jsp" %>
<!-- 부트스트랩 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">-->


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
				<form action="insertRoomWrite" method="post" enctype="multipart/form-data">
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
							<input name="bdtitle" type="text" placeholder="제목을 입력하세요" size="50%">
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">내용</th>
						<td colspan="3">
							<textarea rows="15" cols="53" name="bdcontents" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">대표사진</th>
						<td colspan="3">
							<!--  
							<input type="text" id="mainImgScreen"> <span class="mainfile"><label for="mainImg">대표사진 선택</label></span>
							-->
							<input type="file" id="mainImg" name="bdimgfile" class=""> 
						</td>
					</tr>
					<tr class="tableRow">
						<th class="tableHead">상세사진</th>
						<td colspan="3">
							<!--  
							<input type="text" id="detailImgScreen"> <span class="mainfile"><label for="detailImg">상세사진 선택</label></span>
							-->
							<input type="file" multiple="multiple" id="detailImg" name="bddetailimgfile" onclick="return mainimgCh()">
							<div id="detailImgList"></div>
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
</body>
<script type="text/javascript">
	
	$("#selCategory").change(function(){
		console.log("카테고리 선택")
		var selCategory = $("#selCategory option:selected").val()
		$("#categoryInput").val(selCategory);
	})

	$("#selRegion").change(function(){
		console.log("지역 선택")
		var selRegion = $("#selRegion option:selected").val()
		$("#regionInput").val(selRegion);
	})	
	
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
			alert("메인이미지를 먼저 등록하세요");
			return false;
		}
	} 
</script>

</html>























