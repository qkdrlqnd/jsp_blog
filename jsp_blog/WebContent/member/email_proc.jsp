<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<% 
	String email = request.getParameter("email"); 
	boolean flag = dao.duplicateEmail(email);


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

<script>

	function use(){
		
		
		opener.frm.email.value = "<%=email%>";
		window.close();
		
	}

</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">email중복확인</DIV>

<div class="content">
	<table>
		<tr>
			<th>email</th>
			<td><%=email %></td>
		</tr>
	</table>
	<%
		if(flag){
			out.println("중복된 email입니다.<br> 사용 할 수 없습니다.<br><br>");		
		}
		else{
			out.println("중복된 아이디가 아닙니다. 사용 할 수 있습니다.<br><br>");
			out.println("<input type=\"button\" value=\"사용\" onclick=\"use()\" > ");
		}
	%>
</div>

<DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='email_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
</DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 
