<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	boolean flag = dao.updatePw(id, passwd);

%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
<div class="content">



	<%
		out.print("아이디 : " + id);
		out.print("비밀변호 : " + passwd);
	
		if(flag){ 
			out.print("패스워드 변경이 되었습니다.");
	  }else{
		  out.print("패스워드 변경이 실패 했습니다.");
	  }
	%>
	
</div> 
	
		
	
<DIV class='bottom'>
	<%if(flag){%>
    	<input type='button' value='로그인' onclick="location.href='./loginForm.jsp'">
    <%} else{%>
    	<input type='button' value='다시시도' onclick="history.back()">
    <%} %>
    	<input type='button' value='홈' onclick="index.jsp">
</DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
