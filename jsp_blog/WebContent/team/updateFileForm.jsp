<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 

String oldfile =request.getParameter("oldfile");
	
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

.img{
	width: 200px;
	height: 200px;
}
</style> 

<script type="text/javascript">


	function check(frm){
		
		if(frm.filename.value==""){
			
// 			alert("사진을 넣어주세요");
// 			frm.filename.focus();
// 			return false;
			frm.filename.value="member.jpg";

			
		}		
		
	}


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 수정</DIV>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype='multipart/form-data' onsubmit="return check(this)">
  
  <input type="hidden" name = "no" value="<%=request.getParameter("no")%>" >
  <input type="hidden" name = "col" value="<%=request.getParameter("col")%>" >
  <input type="hidden" name = "word" value="<%=request.getParameter("word")%>" >
  <input type="hidden" name = "oldfile" value="<%=request.getParameter("oldfile")%>" >
  <input type="hidden" name = "nowPage" value="<%=request.getParameter("nowPage")%>" >
  
  
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD><img class="img" src="./storage/<%=oldfile%>"><br>원본파일명:<%=oldfile%></TD>
    </TR>
    <TR>
      <TH>파일변경</TH>
      <TD><input type="file" name="filename" accept=".gif, .jpg, .png"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
