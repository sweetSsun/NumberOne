<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberRegisterForm.jsp</title>

<%@ include file="/resources/css/BarCss.jsp"%>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style type="text/css">
.dis_inline_block {
	display: inline-block;
}

.label_w {
	width: 50px;
}

.input_size{
	width: 80%;
}

.content_solid {
	border: solid 1px black;
}

.content_solid_div {
	border: solid 1px red;
}

.padding_all{
padding: 20px 20px 20px 20px;
}

.overflow_text{
overflow: auto;
resize: none;
}

.div_mb{
margin-bottom: 10px; 
}

.mb_20{
margin-bottom: 20px;
}
.mt_10{
margin-top: 10px;
}

.container_m{
margin: 15% 10% 20% 10%;
}

.font_s_small{
font-size: small;
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
			<div class="container container_m">
				
				<div class="text-center content_solid padding_all">
				<h1 class="mb_20 mt_10">회원가입</h1>
					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">아이디</label>
						</div>

						<div class="dis_inline_block">
							<input type="text" class="input_size">
						</div>
					</div>


					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">비밀번호</label>
						</div>
						<div class="dis_inline_block">
							<input type="password" class="input_size">
						</div>
					</div>



					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">이름</label>
						</div>
						<div class="dis_inline_block">
							<input type="text" class="input_size">
						</div>
					</div>

					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">닉네임</label>
						</div>
						<div class="dis_inline_block">
							<input type="text" class="input_size">
						</div>
					</div>

					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">전화번호</label>
						</div>
						<div class="dis_inline_block">
							<input type="text" class="input_size">
						</div>
					</div>

					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">이메일</label>
						</div>
						<div class="dis_inline_block">
							<input type="text"> @ <input type="text"> <select>
								<option>직접입력</option>
								<option>네이버</option>
								<option>구글</option>
								<option>다음</option>
							</select>
						</div>
					</div>

					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">주소</label>
						</div>
						<div class="dis_inline_block">
							<input type="text"  class="input_size">
						</div>
					</div>

					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">프로필</label>
						</div>
						<div class="dis_inline_block">
							<input type="file"  class="input_size">
						</div>
					</div>

					<div class="div_mb">
						<div class="dis_inline_block">
							<label for="" class="font_s_small">상태메세지</label>
						</div>
						<div class="dis_inline_block">
							<textarea rows="3" cols="50" class="overflow_text"></textarea>
						</div>
					</div>


				</div>
			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/includes/BottomBar.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>