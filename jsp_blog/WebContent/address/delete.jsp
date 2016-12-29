<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<jsp:useBean id="dto" class="address.AddressDTO"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	boolean flag = adao.delete(no);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
* {
	font-size: 24px;
	font-family: gulim;
}
div{
	margin: 0 auto;
	margin-top: 100px;
	margin-botton: 100px;
	text-align: center;
}
</style>



<script type="text/javascript">


function alist(){
	
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;	
	
	
}


</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%
			if (flag) {
				out.println("삭제 되었습니다.");
			} else {
				out.println("삭제를 실패했습니다.");
			}
		%>
		<br>
		<br> <input type="button" value="확인"	onclick="alist()">
	</div>
</body>
</html>
