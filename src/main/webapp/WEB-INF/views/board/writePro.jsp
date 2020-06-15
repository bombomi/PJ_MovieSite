<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<body>
	<h2><center>글쓰기 - 처리페이지</center></h2>
	
	<!-- 글쓰기 실패 -->
	<c:if test="${insertCnt == 0 }">
		<script type="text/javascript">
			alert("글 쓰기 실패하였습니다.");
		</script>
	</c:if>
	
	<!-- 글쓰기 성공 -->
	<c:if test="${insertCnt != 0 }">
		<c:redirect url='BoardList?pageNum=${pageNum}'/>
	</c:if>
</body>
</html>