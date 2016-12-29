<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.readReply(bbsno);


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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">답변</DIV>

	<FORM name='frm' method='POST' action='./replyProc.jsp' enctype="multipart/form-data">
		<input type ="hidden" name="grpno" value="<%=dto.getGrpno() %>">
		<input type ="hidden" name="indent" value="<%=dto.getIndent() %>">
		<input type ="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
		
		
		
		<input type ="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>" >
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>" >
		<input type="hidden" name="bbsno" value="<%=bbsno%>" >
	
		<TABLE>
			<TR>
				<TH>성명</TH>
				<TD><input type="text" name="wname"></TD>
			</TR>
			<tr>
				<TH>제목</TH>
				<TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>

			</tr>
			<tr>
				<TH>내용</TH>
				<TD><textarea rows="10" cols="45" name="content"></textarea></TD>

			</tr>
			<tr>
				<TH>파일명</TH>
				<TD><input type="file" name="filename"></TD>

			</tr>
			<tr>
				<TH>비밀버호</TH>
				<TD><input type="password" name="passwd"></TD>

			</tr>

		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='등록'> <input type='button'
				value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
