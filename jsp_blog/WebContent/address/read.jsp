<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<%
	
	int no = Integer.parseInt(request.getParameter("no"));
	AddressDTO dto = adao.read(no);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
	*{
		text-align: center;
		font-size: 24px;
		font-family: gulim; 
	}
</style>

<script type="text/javascript">
	function update(no){
		var url = "updateForm.jsp"
		url +="?no="+no;
		url +="&col=<%=request.getParameter("col")%>";
		url +="&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;
		
	}
	function delet(no){
		var url = "delete.jsp"
		url +="?no="+no;
		url +="&col=<%=request.getParameter("col")%>";
		url +="&word=<%=request.getParameter("word")%>";.
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;
	}
	function alist(){
		var url = "./list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;
	}
	

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="title">조회</div>

		<DIV CLASS="content">
		<table>
				<tr>
					<th>이름</th>
					<td><%=dto.getName() %></td>
				</tr>			
				<tr>
					<th>전화번호</th>
					<td><%=dto.getPhone() %></td>
				</tr>			
				<tr>
					<th>우편주소</th>
					<td><%=dto.getZipcode() %></td>
				</tr>			
				<tr>
					<th>주소</th>
					<td><%=dto.getAddress1() %></td>
				</tr>			
				<tr>
					<th>상세주소</th>
					<td><%=dto.getAddress2() %></td>
				</tr>			
							
				<tr>
					<td colspan ="2">
						<input type="button" value="목록" onclick="alist()">	
						<input type="button" value="수정" onclick="javascript:update('<%=dto.getNo() %>')">	
						<input type="button" value="삭제" onclick="javascript:delet('<%=dto.getNo() %>')">	
					</td>
				
				</tr>			
			
			
			</table>
		</DIV>

</body>
</html>





















