<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%

	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile"); 


	
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);

	boolean pflag = bdao.passCheck(map);
	boolean flag = false;
	if(pflag){
		flag = bdao.delete(bbsno);	
	}
	if(flag){
		String upDir = application.getRealPath("/bbs/storage");
		UploadSave.deleteFile(upDir,oldfile); //기존파일을 삭제
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>


<script type="text/javascript">


function blist(){
	var url = "./list.jsp"
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}


</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->




<DIV class="title">처리결과</DIV>
	<DIV class="content">
		<%
		
			if (pflag == false) {
				out.println("패스워드가 일치하지 않습니다.");
			} else if(flag) {
				out.println("수정 되었습니다.");
			} else{
				out.println("수정이 실패헸습니다.");
			}
		%>

		<%
			if(pflag == false){ %>
		<Br>
		<br>
				<input type='button' value='다시 시도' onclick="history.back()">
  			    <input type='button' value='목록' onclick="blist()">
		<%} else{ %>

		<Br>
		<br>
		<br> <input type='button' value='확인' onclick="blist()">
			<%} %>
	</DIV>







	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
