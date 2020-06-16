<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${updateCnt == 0 }">
		<script type="text/javascript">
			alert("글 수정 실패. 다시 확인해주세요.");
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0 }">
		<script type="text/javascript">
			alert("글 수정이 완료되었습니다.");
			window.location='BoardList?pageNum=${pageNum}';
		</script>
	
	</c:if>

</body>
</html>