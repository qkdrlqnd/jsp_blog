<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%
	String tempDir = application.getRealPath("/member/temp");
	String upDir = application.getRealPath("/member/storage");
	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	
	String id = upload.getParameter("id"); 
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	String fname = null;
	
	FileItem fileItem = upload.getFileItem("fname"); 
	int size = (int)fileItem.getSize();
	if(size > 0 ){
		UploadSave.deleteFile(upDir, oldfile);
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	
	
	
	boolean flag = dao.updateFile(id, fname);
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

	function read(){
		
		var url = "./read.jsp";
		url += "?col=<%=upload.getParameter("col")%>";
		url += "&word=<%=UploadSave.encode(upload.getParameter("word"))%>";
		url += "&nowPage=<%=upload.getParameter("nowPage")%>"
		
		url += "&id=<%=upload.getParameter("id")%>"
		
		location.href= url;
	}

</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진 변경</DIV>
 
 	<div class="content">
		<%if(flag){
			out.println("사진 변경 성공");		
		}else{
			out.println("사진 변경 실패");
		}
		%>
	</div>
  <DIV class='bottom'>
	<%if(flag){ %>
    <input type='button' value='나의 정보' onclick="read()">
    <%}else{ %>
    <input type='button' value='다시시도' onclick="history.back()">
    <%} %>
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
