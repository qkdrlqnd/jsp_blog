<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<% 
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
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
	function inCheck(f){
		if(f.fname.value==""){
			alert("파일을 선택해주세요");
			f.fname.focus();
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
 
<DIV class="title">사진 수정</DIV>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype="multipart/form-data" onsubmit="return inCheck(this)">
  <input type="hidden" name="oldfile"  value="<%=oldfile%>">
  <input type="hidden" name="id" value="<%=id%>">
  <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
  <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
  <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
  
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD><img style="width:300px; height: 400px" src="./storage/<%=oldfile%>"></TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD><input type="file" name="fname" accept=".gif, .jpg, .png"></TD>
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
