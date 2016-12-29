<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


<jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty property="*" name="dto"/>

<% request.setCharacterEncoding("UTF-8");%>
   
<%

	boolean flag =  adao.update(dto);

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
		margin-top: 100px; 
		margin-botton: 100px; 
	}
	
</style>

<script type="text/javascript">

	function alist(){
		
		var url ="./list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;		
		
	}
 


</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<%
	if(flag){
		out.println("수정되었습니다.");
	}
	else{
		out.println("수정이 실패되었습니다.");
	}

%>

	<br><br><br>
	<input type = "button" value ="확인" onclick="alist()">

</div>
</body>
</html>









