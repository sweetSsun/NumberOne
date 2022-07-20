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
	
	.d_none{display : none;}
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
							<div id="bdimgScreen" style="width:200px; height:150px;" class="d_none"><img id='previewBdmig' style="width:100%; height:100%;"></img></div>
							<input type="file" id="mainImg" name="bdimgfile" accept="image/*"> 
						</td>
					</tr>
					<tr>
						<th class="tableHead title">상세사진</th>
						<td colspan="5">
							<!--  
							<input type="text" id="detailImgScreen"> <span class="mainfile"><label for="detailImg">상세사진 선택</label></span>
							-->
							<div id="bddetailimgScreen" style="width:100%;" class="row"></div>
							<input type="file" multiple="multiple" id="detailImg" name="bddetailimgfile" onclick="return mainimgCh()" accept="image/*">
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
//bdimg 미리보기
function readBdimg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = (e) => {
        	console.log(input.files[0].type)
        	if(! input.files[0].type.match("image.*")){
        		console.log("이미지 파일 아님");
            	alert("이미지 파일만 등록 가능합니다!");
            	$("#mainImg").val("");
            	$("#previewBdimg").attr("src", "");
            	$("#bdimgScreen").addClass("d_none");
            	return;
            	//$("#detailImg").replaceWith($("#detailImg").clone(true));
        	}
            var previewImage = document.getElementById('previewBdmig');
            previewImage.src = e.target.result;
            //previewImage.alt = input.files[0].name();
            $("#bdimgScreen").removeClass("d_none");
            
        }
        reader.readAsDataURL(input.files[0]);
    }
}

//bdmig input 파일 업로드 시 readBdimg 함수 호출하기
document.getElementById('mainImg').addEventListener('change', (e) => {
	readBdimg(e.target);
})

//bddetailimg input 파일 업로드 시 미리보기 보여주기
function readMultipleImage(input) {
	console.log("readMultipleImage() 호출");
    const multipleContainer = document.getElementById("bddetailimgScreen");
    $("#bddetailimgScreen").html("");
    
    // 인풋 태그에 파일들이 있는 경우
    if(input.files) {
        // 이미지 파일 검사 (생략)
        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
        const fileArr = Array.from(input.files);
        
        const $colDiv = document.createElement("div")
        $colDiv.style.display = "inline-block";
        
        fileArr.forEach((file, index) => {
        	console.log(file.type);
            if(! file.type.match("image.*")){
            	console.log("이미지 파일 아님");
            	alert("이미지 파일만 등록 가능합니다!");
            	$("#detailImg").val("");
            	//$("#detailImg").replaceWith($("#detailImg").clone(true));
            	return;
            }
        	
        	const reader = new FileReader()
            
            const $imgDiv = document.createElement("div")   
            $imgDiv.style.width = "200px";
            $imgDiv.style.height = "150px";
            $imgDiv.style.display = "inline-block";
            const $img = document.createElement("img");
            $imgDiv.appendChild($img)
            
            reader.onload = e => {
                $img.src = e.target.result;
                $img.alt = file.name;
                $img.title = file.name;
                $img.style.width = "100%";
                $img.style.height = "100%";
            }
            
            //console.log(file.name)
            $colDiv.appendChild($imgDiv);

            reader.readAsDataURL(file);
        })
        
        multipleContainer.appendChild($colDiv);

    }
}

const inputMultipleImage = document.getElementById("detailImg");
inputMultipleImage.addEventListener("change", e => {
    readMultipleImage(e.target);
})



</script>

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
	
	/*
	$("#detailImg").change(function(){
		
		var detailImg = $("#detailImg")[0].files;
		console.log(detailImg);
		var output = "";
		for(var i=0; i<detailImg.length; i++){
			output += "<div>"+detailImg[i].name+"</div>";
		}
		$("#detailImgList").html(output);
	})
	*/
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























