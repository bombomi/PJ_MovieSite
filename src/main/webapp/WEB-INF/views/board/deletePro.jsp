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
<div class="head">
	<jsp:include page="../head.jsp"></jsp:include>
</div>

	<!-- 글 삭제에 실패 -->
	<c:if test="${deleteCnt == 0 }">
		<script type="text/javascript">
			alert("게시글 삭제 실패.");
		</script>
	</c:if>
	
	<!-- 글 삭제 성공 -->
	<c:if test="${deleteCnt != 0 }">
		<script type="text/javascript">
			alert("게시글이 삭제 되었습니다.");
			window.location="BoardList?pageNum=${pageNum}";
		</script>
	<%-- 	<c:redirect url='boardList.bo?pageNum=${pageNum}'/> --%>
	</c:if>
</body>
</html>