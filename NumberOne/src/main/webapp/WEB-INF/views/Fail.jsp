<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1인자</title>
</head>
<body>
</body>
<script type="text/javascript">
	var checkMsg = "${msg}";
	console.log("${msg}");
	console.log("${msg}".length);
	if(checkMsg.length > 0){
		alert(checkMsg);
		if('${afterUrl}'.length != 0){
			if('${afterUrl}'!= 'noUrl'){
				location.href = "${pageContext.request.contextPath }/"+'${afterUrl}';
			}
		} 
	} else {				
		history.back();
	}
</script>
</html>