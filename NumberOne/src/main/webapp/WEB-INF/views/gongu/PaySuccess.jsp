<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자</title>
</head>
<body>
<h2> 결제 성공 !! </h2>
</body>
<script type="text/javascript">

var msg = confirm("결제가 완료되었습니다. 마이페이지로 이동하시겠습니까?");

	if(msg){
		//opener.location.href = "selectMyInfoGonguView"; // mid 보내줘야할듯!
		opener.location.href = "/";
		window.close();
	} else {
		opener.location.reload();
		window.close();
	}
	
</script>
</html>