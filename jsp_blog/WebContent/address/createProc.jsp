<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<jsp:useBean id="dto" class="address.AddressDTO" />
<jsp:setProperty property="*" name="dto"/>

<% request.setCharacterEncoding("UTF-8");%>
<%

	boolean flag = adao.create(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	*{
		font-size: 24px;
		font-family: gulim; 
	}
	div{
		text-align: center;
 		margin-top: 200px; 	
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<%
	if(flag){
		out.println("성공");
	}
	else{
		out.println("실패");
	}

%>
	<br><br>
	<input type="button" value="계속 등록 " onclick="location.href='createForm.jsp'">
	<input type="button" value="목록" onclick="location.href='./list.jsp'">
</div>
</body>
</html>
