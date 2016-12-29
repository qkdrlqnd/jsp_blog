<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();
	
	String id = (String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");

%>

<html>
<head>
<style type="text/css">
ul#menu li {
	display: inline;
}

ul#menu li a {
	background-color: black;
	color: white;
	pading: 10px 20px;
	text-decoration: none;
	border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
	background-color: orange;
}

.table{
	width="100%";
}

.table, .td{
	border-style: none; 
}


li#admin{
float:right;
padding-right: 30px
}


</style>
</head>
<body>
	<!-- 상단 메뉴 -->
	<div style="text-align: center">
		<table class="table">
			<tr>
				<td class="td"> <img src="<%=root%>/menu/images/main-03.jpg" width='100%'
					height='40%'></td>
			</tr>

			<tr>
				<td class="td">
					<ul id="menu">
						<%if(id == null){ %>
							<li><a href="<%=root%>/index2.jsp">홈</a></li>
							<li><a href="<%=root%>/member/agreement.jsp">회원가입</a></li>
							<li><a href="<%=root%>/member/loginForm.jsp">로그인</a></li>
						<%} else if(id != null && grade.equals("H")){ %>
						
						<li><a href="<%=root%>/member/read.jsp">나의정보</a></li>
						<li><a href="<%=root%>/member/updateFo.jsp">회원수정</a></li>
						<li><a href="<%=root%>/member/deleteForm.jsp">회원탈퇴</a></li>
						<li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
						<%} %>
						<li><a href="<%=root%>/bbs/list.jsp">게시판 목록</a></li>
						<li><a href="<%=root%>/bbs/createForm.jsp">게시판 생성</a></li>
						<li><a href="<%=root%>/team/list.jsp">팀목록</a></li>
						<li><a href="<%=root%>/team/createForm.jsp">팀생성</a></li>
						<li><a href="<%=root%>/memo/list.jsp">메모목록</a></li>
						<li><a href="<%=root%>/memo/memoform.jsp">메모생성</a></li>
						
						 <%if(id!=null && grade.equals("A")){ %>
    						 <li id="admin"><a href="<%=root %>/admin/list.jsp">회원목록</a></li>
    						 <li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
   						 <%} %>
					</ul>
				</td>
			</tr>

		</table>
	</div>
	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 10px;">