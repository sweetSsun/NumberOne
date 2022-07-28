<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자</title>
</head>
<body>
<h2> 결제 취소 :: 새로고침 </h2>
</body>
<script type="text/javascript">

	alert("결제 취소하셨습니다. 페이지를 새로고침합니다.");	
	opener.location.reload();
	window.close();
	
</script>
</html>