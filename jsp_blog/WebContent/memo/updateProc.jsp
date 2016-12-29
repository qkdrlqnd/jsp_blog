<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	boolean flag = mdao.update(dto);

	String col = request.getParameter("col");
	String word = request.getParameter("word");

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
</style>

<script type="text/javascript">
	
	function mlist(){
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		location.href = url;
	}


</script>

</head>
<body>
	<div>
		<%
			if (flag) {
				out.println("수정되었습니다.");
			} else {
				out.println("수정이 실패되었습니다.");
			}
		%>
		<br> 
		<input type="button" value="목록" 	onclick="mlist()" >
	</div>
</body>
</html>
