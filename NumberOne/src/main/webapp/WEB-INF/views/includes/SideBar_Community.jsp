<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<%@ include file="/resources/css/BarCss.jsp" %>

<style type="text/css">
	
	#sidebar, #sideList, #sidebar-toggle {
		-webkit-transition: all 0.2s;
		-moz-transition: all 0.2s;
		-ms-transition:all 0.2s;
		-o-transition: all 0.2s;
		transition: all 0.2s;
		padding-left: 0; 
	}
	
	/* 사이드바 기본 설정 */
	#sidebar {
		-webkit-transform:translate3d(0,0,0);
		-moz-transform:translate3d(0,0,0);
		transform:translate3d(0,0,0);
		overflow:hidden;
		position:fixed;
		
		/* 기본 사이드바  */
		width: 5%; height:100%;
		top: 0;
		background: #4cadcc;
	}
	#sidebar.sideon {
		-webkit-transform: translate3d(130px,0,0);
		-moz-transform: translate3d(130px,0,0);
		transform: translate3d(130px,0,0);
 
		overflow-y: hidden;
		/* 열었을 때 사이드바 */ 
		width: 15%; height:100%;
		left: -130px; top:0;
		background:#F2F2FF; 

	}
	
	/* 사이드바 목록 */
	#sideList {
		-webkit-transform: translate3d(-70px,0,0);
		-moz-transform: translate3d(-70px,0,0);
		transform: translate3d(-70px,0,0);
		width: 0;
	}
	#sideList.sideon {
		-webkit-transform:translate3d(0,0,0);
		-moz-transform:translate3d(0,0,0);
		transform: translate3d(0,0,0);
		overflow:hidden;
		white-space: nowrap;
		width: 100%;
		padding-top: 12rem;	
		/* 크기에 따라 달라지게 주고싶은데 한계가있다 선생님께 여쭤보기 ㅜ */
	}
	
	#sidebar-toggle.sideon {
		padding-left: 20%;
	}
	
/* 	#sideList .listLeft { float:left; height:auto; }*/
	#sideList .listRight { float:left; height:auto; }
	
	/* 기본 햄버거 */
	#sidebar-toggle .sideOnImg {
		position:fixed; display:block;
		left:5%; margin-top:1%;
		width:50px; height:50px; line-height:50px;
		border-radius: 0 10px 10px 0; background:#444; color:#fff; text-align:center;
	}
	
	/* 열었을 때 햄버거 */
	#sidebar-toggle .sideOffImg { display:none; }
	
	#sidebar-toggle.sideon .sideOffImg {
		position:fixed; display:block;
		left:15%; margin-top:1%;
		width:50px; height:50px; line-height:50px;
		border-radius: 0 10px 10px 0; background:#4cadcc; color:#fff; text-align:center; 
	}
	#sidebar-toggle.sideon .sideOnImg { display:none; }


/* .side-bar {
    width:300px;
    position:fixed;
    top:0;
    left:-260px;
    width:300px;
    height:100%;
    background-color:#dfdfdf;
    border-right:2px solid #afafaf;
    transition:left 0.3s;
    cursor:pointer; */
}

body {
    height:100000px;
}


</style>


</head>
<body>

	<div id="sidebar-toggle">
		<a class="sideOnImg" alt="open"><i class="fa fa-bars"></i></a>
		<a class="sideOffImg" alt="close"><i class="fa fa-bars"></i></a>
	</div>
	<div id="sidebar">
		<div id="sideList">
			<div class="listLeft">
				<div class="row">
					<div class="col sidemenu">
						<div class="sidetitle">
							<h3 class="text-center font-weight-bold"><a href="selectBoardList">커뮤니티</a></h3>
						</div>

					</div>
					<div class="sideroom">
						<h4>
							<a href="#">자랑방</a>
						</h4>
					</div>
					<div class="sideroom">
						<h4>
							<a href="selectFreeBoardList">자유방</a>
						</h4>
					</div>
					<div class="sideroom">
						<h4>
							<a href="#">질문방</a>
						</h4>
					</div>
					<div class="sideroom">
						<h4>
							<a href="#">정보방</a>
						</h4>
					</div>
					<div class="sideroom">
						<h4>
							<a href="#">후기방</a>
						</h4>
					</div>
					<div class="sideroom">
						<h4>
							<a href="#">공지방</a>
						</h4>
					</div>
				</div>


				<div class="sideregion">
					<h4>
						<a href="#">지역</a>
					</h4>
					<div class="blog__sidebar__item__tags">
						<table id="region_cate">
							<tr>
								<td><a href="#">전체</a></td>
								<td><a href="#">서울</a></td>
								<td><a href="#">인천</a></td>
							</tr>
							<tr>
								<td><a href="#">경기</a></td>
								<td><a href="#">경상</a></td>
								<td><a href="#">전라</a></td>
							</tr>
							<tr>
								<td><a href="#">충청</a></td>
								<td><a href="#">강원</a></td>
								<td><a href="#">제주</a></td>
							</tr>
						</table>
					</div>

				</div>

				<p style="width: 70px; line-height: 100px; text-align: center;">
					안녕하세요 컬러감별사입</p>
			</div>
			<div class="listRight">
				<p
					style="font-size: 40px; color: #000; width: 200px; line-height: 100px; text-align: center;">B</p>
			</div>

		</div>
	</div>
		
</body>

<script type="text/javascript">

$('#sidebar-toggle').click(function() {
    if ( $("#sidebar, #sideList, #sidebar-toggle").hasClass('sideon') ) {
        $("#sidebar, #sideList, #sidebar-toggle").removeClass('sideon')
        console.log("off");
    }
    else {
        $("#sidebar, #sideList, #sidebar-toggle").addClass('sideon')
        console.log("on");
    }
});
</script>

</html>