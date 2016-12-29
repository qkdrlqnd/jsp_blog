<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();	
	
	String id = (String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");
	
	String str = null;
	if(id == null){
		str = "메인페이지입니다.";
	}
	else{
		str = "안녕하세요. " + id + " 님";
	}
	
	String title="나의 여행 블로그";
	if(id!=null && grade.equals("A")){
	   title="관리자 페이지";
	}
	
	
	
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
 
<DIV class="title"><h1><em><marquee><%=str %> <%=title %></marquee></em></h1></DIV>


<div class="content">

	
	<img src = "./images/t_12.jpg" width="50%">
	<br>
	<% if(id==null){ %> 
	
		<input type="button" value="로그인" onclick="location.href='./member/loginForm.jsp'">
	
	<%	} else{ %>
		
		<input type="button" value="로그아웃" onclick="location.href='./member/logout.jsp'">
		
	<%}	%>
	
	<br>
	
	<br>
	
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
