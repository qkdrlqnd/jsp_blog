<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%

	//검색===============
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")){
		word = "";
	}
	
	// paging곤련====================
			
	int nowPage = 1;//현재보고있는 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 5; //한페이지에 보여줄 레코드 수
	
	
	//DB에서 가져올 순번
	int sno = ((nowPage -1) * recordPerPage) +1  ;
	int eno = nowPage * recordPerPage;


	
	
	
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	
	int total = dao.total(col,word);
	

	List<BbsDTO> list = bdao.list(map);
	Iterator<BbsDTO> iter = list.iterator();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

.search{
	width : 80%;
	text-align: center;
	margin: 1px auto;
}

</style>

<script type="text/javascript">
	function read(bbsno){
		var url = "./read.jsp";
		url += "?bbsno="+bbsno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href=url;
	}

</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">게시판목록</DIV>
	
	
	<div class="search">
	<form method="post" action ="./list.jsp">
		<select name="col">
		
			<option value="wname" <%if(col.equals("wname")) out.println("selected='selected'"); %>>성명</option>
			<option value="title" <%if(col.equals("title")) out.println("selected='selected'"); %>>제목</option>
			<option value="content" <%if(col.equals("content")) out.println("selected='selected'"); %>>내용</option>
			<option value="total">전체출력</option>
		
		</select>
		<input type="text" name="word" value="<%=word%>" >
		<input type='submit' value="검색">
		<input type='button' value='등록'	onclick="location.href='./createForm.jsp'">
	
	</form>
</div>

	<TABLE>
		<TR>
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>성명</TH>
			<TH>조회수</TH>
			<TH>등록일</TH>
			<TH>파일명</TH>
 
		</TR>
		<% if(list.size()==0){ %>
			<tr>
				<TD colspan="8">등록된 글이 없습니다</TD>
			</tr>		
		
		<% }else{ 
		 while(iter.hasNext()){ 
		 	BbsDTO dto = iter.next();
		 %>
		<tr>
			<td>
				<%if(Utility.compareDay(dto.getWdate().substring(0,10))){%>
				<img src="./images/new.gif">
				<%} %>
				<%=dto.getBbsno() %>
			
			</td>
			
			
			
			<td>
			
				<%
					for(int i=0;i< dto.getIndent(); i++){
						out.println("&nbsp;&nbsp;");			
						
					}
					if(dto.getIndent()>0){
						
						out.println("<img src='./images/re.jpg'>");
						
						
						
					}
				
				%>
				
				<a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle() %></a>
				
			</td>
			<td><%=dto.getWname() %></td>
			<td><%=dto.getViewcnt() %></td>
			<td><%=dto.getWdate().substring(0,10) %></td>
			<td><%if(dto.getFilename()==null){
					out.println("파일없음");
				}else{
// 					out.println("<button type=\"button\" class=\"btn btn-default btn-sm\"><span class=\"glyphicon glyphicon-download-alt\"></span> Download</button>");
					out.println("<button type=\"button\" class=\"btn btn-default btn-sm\" onclick=\"location.href='"+root+"'"+dto.getFilename()+"\"  ><span class=\"glyphicon glyphicon-download-alt\"></span> Download</button>");
				}
				%></td>
			<input type="text" value="<%=dto.getFilename()%>">
			<input type="button" value="down" onclick="location.href='<%=root%>/download?dir=/member/storage&filename=<%=dto.getFilename()%>'">
			
		</tr>
		<%
			}
		}
		%>
		
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='등록'	onclick="location.href='./createForm.jsp'">
		<%=Utility.paging3(total, nowPage, recordPerPage, col, word)%>
	</DIV>

<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
