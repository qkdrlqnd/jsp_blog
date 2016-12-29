<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
 <%
 		//검색관련
 		String col = Utility.checkNull(request.getParameter("col"));
 		String word = Utility.checkNull(request.getParameter("word"));
 
 		if(col.equals("total")){
 			word="";
 		}
 
 		//페이징관련
 		int nowPage = 1;
 		int recordPerPage = 5;
		
 		if(request.getParameter("nowPage") != null){
 			nowPage = Integer.parseInt(request.getParameter("nowPage"));
 		}

 		//DB에서 가져올 순번
 		int sno = ((nowPage -1) * recordPerPage) + 1;
 		int eno = nowPage * recordPerPage;
 		
 		Map map = new HashMap();
 		map.put("eno",eno);
 		map.put("sno",sno);
 		map.put("word", word);
 		map.put("col", col);
 		
 		
 		int total = dao.total(col, word);
 		List<MemberDTO> list = dao.list(map);
 		Iterator<MemberDTO> iter = list.iterator();
 %>
 
 
<!DOCTYPE html> 
<html>  
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 15px; 
} 

img.img{
	
	
	width: 170px;
	height: 200px;
	
	
}

td#td1{
	 margin: 50px auto;
	 background-color: black;
}


</style> 

<script type="text/javascript">


	function mlist(){
		
		var url = "./list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";

		location.href= url;		
	}
	
	function read(id){	
		var url = "<%=root%>/member/read.jsp";
		url += "?id="+id;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";

		location.href= url;		
		
	}

	
	function img(fname){	
		
		
		var url ="http://localhost:8000/jsp_member/member/storage/"+fname;
		
		
		location.href= url;
		wr = window.open(url,"사진보기","width=500,height=400");
	}

	
	

</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>
 
	<TABLE>
    		
	<% 
		while(iter.hasNext()){
			MemberDTO dto = iter.next();
	%>
	
			<TR>
      			<TD id="td1" rowspan="7" ><a onclick="javascript:img('<%=dto.getFname()%>')" target="_blank" ><img class="img" src="<%=root%>/member/storage/<%=dto.getFname()%>"></a></TD>
      		</tr>
    		
    		<tr>
    			<TH>아이디</TH>
      			<TD><a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a></TD>
      		</tr>
      		
      		<tr>
      			<TH>이름</TH>
      			<TD><%=dto.getMname() %></TD>
      		</tr>
    		
    		<tr>
      			<TH>전화번호</TH>
      			<TD><%=dto.getTel() %></TD>
      		</tr>
    		
    		<tr>
      			<TH>이메일</TH>
      			<TD><%=dto.getEmail() %></TD>
			</tr>
    		
    		<tr>
      			<TH>회원등급</TH>
      			<TD><%=dto.getGrade() %></TD>
      		</tr>
    		
    		<tr>	
      			<TH>등록일</TH>
      			<TD><%=dto.getMdate().substring(0,10) %></TD>
    		</TR>
  	
  
	
	
	<% } %>
	</TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='....'>
    <input type='button' value='회원탈퇴' onclick="location.href=''">
  </DIV>

	
	<div class="content">
	<form name="frm" action="./list.jsp" method="post">
		<select name="col">
			<option value="id" 		<%if(col.equals("id")) out.println("selected='selected'"); %>>아이디</option>
			<option value="mname" 	<%if(col.equals("mname")) out.println("selected='selected'"); %>>이름</option>
			<option value="email"	<%if(col.equals("email")) out.println("selected='selected'"); %>>email</option>
			<option value="total"	<%if(col.equals("total")) out.println("selected='selected'"); %>>전체</option>
		</select>
		<input type="text" name="word" value="<%=word%>" >
		<input type="submit" value="검색" >
	</form>
 	</div>
 	
	<div><%= Utility.paging3(total, nowPage, recordPerPage, col, word) %></div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
