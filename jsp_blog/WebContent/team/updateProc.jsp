<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<jsp:useBean id="dto" class="team.TeamDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag = tdao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
div{
	text-align : center;
	margin-top : 20px;
	margin-botton : 20px;
}


</style>

<script type="text/javascript">

	function tlist(){
		var url ="./list.jsp";
		url += "?col=<%=request.getParameter("col")%>"
		url += "&word=<%=request.getParameter("word")%>"
		location.href=url;
	}


</script>


</head>
<body>


<div>
	<%
		if(flag){
			out.println("수정되었습니다");
		}
		else{
			out.println("수정이 실패했습니다.");
		}
	
	%>
	<br><br>
	<input type="button" value="확인"  onclick="tlist()">
	
	
</div>






</body>
</html>
