<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8");

%>
<%
response.setContentType("text/xml;charset=UTF-8");
%>
<% response.setContentType("text/html; charset=utf-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



    <%String contextPath= request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script  type="text/javascript"src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	   $("[name='place']").click(function(){
	        if($(this).prop('checked')){
	        	$('input[type="checkbox"][name="place"]').prop('checked',false);
	        	$(this).prop('checked', true);

	        	
	        	//체크박스에 표시한 값들을 넘김.
	        	var checkboxValue;
	        	$('input[name="place"]:checked').each(function(i){
	        		checkboxValue=$(this).val();
	        	});
	        	var allData = {"checkboxValue": checkboxValue };
	        	$.ajax({
	        		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        	    url:"<%=contextPath%>/ajaxTheaterSelect",
	        	    type:'GET',
	        	    dataType:"json",
	        	    data: allData,
	        	    success:function(retVal){
	        	    	var resultTeaters =[];
	        	    	resultTheaters=retVal.theaterList;
	        	    	var resultHTML=makeTheaterListHTML(resultTheaters);
	        	        $("#result").html(resultHTML);

	        	        
	        	 	   $("input[type='checkbox'][name='theater_id']").click(function(){
	        		        if($(this).prop('checked')){
	        		        	$('input[type="checkbox"][name="theater_id"]').prop('checked',false);
	        		        	$(this).prop('checked', true);
	        		        }});


	        	    },
	        	    error:function(request, status, error){
	        	        alert("에러 발생~~ \n" + status + " : " + error);

	        	    }
	        	});	
	        }else{
	            alert("체크박스 체크 해제!");
	        }
	    });
	   
	
});
function makeTheaterListHTML(list){
	var theaterHTML="";
	
    $.each(list, function( index, value ) {
    	theaterHTML+="<input type='checkbox' name='theater_id' value='";
    	console.log(value.theater_id);
    	theaterHTML+=value.theater_id;
    	theaterHTML+="'>"+value.theater_name+"&nbsp;";
     });
	return theaterHTML;
}
</script>
<style>
	#contents{
		text-align:center;
	}
</style>
</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>
영화관 선택하기
<hr width="80%">

<div id="contents">
<input type="checkbox" name="place" value="seoul">서울
<input type="checkbox" name="place" value="gyeong-gi">경기
<input type="checkbox" name="place" value="busan">부산
<input type="checkbox" name="place" value="incheon">인천
<input type="checkbox" name="place" value="gangwon">강원

<br>
result
<hr>

<form action="<%=contextPath%>/selectDateTime" method="get">

<div id="result"></div>
<br>
<input type="hidden" name="member_id" value="${member.getMember_id()}">
<input type="hidden" name="movie_id" value="20183813">
<input type="submit" value="날짜, 시간 선택">

</form>


</div>
</body>
</html>