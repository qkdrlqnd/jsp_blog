<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file ="/ssi/ssi.jsp" %>

<jsp:useBean id="dto" class="memo.MemoDTO"/>



<jsp:setProperty property="title" param="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<%	
	boolean flag = mdao.create(dto);
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

div {
	text-align: center;
	margin-top: 100px;
}
</style>
</head>
<body>
	<div>
		<%
		
		out.println("");
		
		
		
			if (flag) {
				out.print("메모를 등록했습니다.");
			} else {
				out.print("메모등록이 실패했습니다.");
			}
		%>
		<br> <input type="button" value="계속 등록"
			onclick="location.href='./memoform.jsp'"> <input
			type="button" value="목록" onclick="location.href='./list.jsp'">
	</div>
</body>
</html>
