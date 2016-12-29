<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String nowPage = request.getParameter("nowPage");
boolean flag = bdao.checkRefno(bbsno);
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

<script type="text/javascript">

function del(bbsno){
	var url = "./deleteProc.jsp";
	url += "?bbsno=" + bbsno;
	url += "&nowPage=<%=nowPage%>";
	location.href=url;
}

function incheck(f){
	if(f.passwd.value==""){
		
		alert("패스워드를 입력");
		f.passwd.focus();
		return false;
	}
	
}


</script>



<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">삭제</DIV>
 

	<%if(flag){%>
		<div class="content">	
	<%
		out.println("답변있는 글입니다.<br> 삭제 할 수 없습니다.<br>");
		out.println("<input type =\"button\" value=\"확인\" onclick=\"history.back()\" >");
	 %>
	 </div>
	<%
	}else{
	%>
	<div class="content">정말로 삭제하시겠습니까? </div>
  <form action="./deleteProc.jsp" method="post" >
  <input type="hidden" name="bbsno" value="<%=bbsno%>">
  <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
  <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
  <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
  <input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
  <table> 
  		<tr>
  			<th>비밀번호</th>
  			<td><input type = "password" name="passwd"></td>
  		</tr>
  </table>
  
  <DIV class='bottom'>
    <input type='submit' value='확인' >
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
  <%} %>
</form>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
