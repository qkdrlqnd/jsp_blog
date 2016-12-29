<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	
	String word  = request.getParameter("word");
	String col = request.getParameter("col");
	
	boolean flag = mdao.delete(memono);
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
	margin-bottom: 20px;
}
</style>
<script>
	function mlist(){
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		location.href=url;
	}
</script>
</head>
<body>
	<div>
		
			<%
				if (flag) {
					out.println("삭제되었습니다.");
				} else {
					out.println("삭제가 실패하였습니다.");
				}
			%>
			<br>
			<br> <input type="button" value="목록" onclick="mlist()">
		
	</div>

</body>
</html>
