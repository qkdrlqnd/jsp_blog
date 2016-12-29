<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>





<% 

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")){
		word="";		
	}
	
	
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!= null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	
	int sno = ((nowPage -1) * recordPerPage) +1 ;
	int eno =  nowPage * recordPerPage;
	
	
	
	

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	

	List<AddressDTO> list = adao.list(map);
	Iterator<AddressDTO> iter = list.iterator();
	
	
	
	int totalRecord = adao.total(col, word);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
.search{
	width: 80%;
	text-align: center;
}
</style>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
	function aread(no) {
		var url = "./read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word %>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<form method="post" action="./list.jsp">
	<div class="title">주소록 목록</div>
	
	<div class="search">
			<select name="col">
				<option value ="name" <%if(col.equals("name")) out.println("selected:selected"); %>>이름</option>	
				<option value ="phone" <%if(col.equals("phone")) out.println("selected:selected"); %>>전화번호</option>	
				<option value ="wdate" <%if(col.equals("wdate")) out.println("selected:selected"); %>>작성일</option>	
				<option value ="total" <%if(col.equals("total")) out.println("selected:selected"); %>>전체목록</option>	
			</select>
			<input type="text" name="word" value="<%=word %>">	
			<input type="submit" value="검색">	
	</div>	
	
	
	<div class="content">
		
			<table>
				<tr id="tcolor">
					<th>no</th>
					<th>name</th>
					<th>phone</th>
					<th colspan="2">wdate</th>
				</tr>
				<%
					if(list.size() != 0){
						while(iter.hasNext()){
							AddressDTO dto = iter.next();
						out.println("<tr><td>"+ dto.getNo()+" <img src='../images/re.jpg' ></td>");
						out.println("<td> <a href=\"javascript:aread('"+ dto.getNo() +"')\"> " + dto.getName() + " </a></td>");
						out.println("<td>" + dto.getPhone() + "</td>");
						out.println("<td>" + dto.getWdate() + "</td></tr>");
						}
					}
					else{
						out.println("<tr><td colspan=\""+4+"\">생성된 주소록이 없습니다.</td></tr>");
					}
				%>
			</table>
			<br>
			<br>
			<br> 
			<input type="button" value="생성" onclick="location.href='./createForm.jsp'">
			<%= Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
	</div>
	</form>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>

