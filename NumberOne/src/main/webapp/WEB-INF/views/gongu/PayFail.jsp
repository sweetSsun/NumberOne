<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자</title>
</head>
<body>
<h2> 결제 실패 :: 새로고침 </h2>
</body>
<script type="text/javascript">

	alert("결제실패했습니다. 다시 결제해주세요");	
	opener.location.reload();
	window.close();
	
</script>
</html>