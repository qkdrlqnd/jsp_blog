<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %> 
<%@ page import="member.*" %> 
<%@ page import="utility.*" %> 
<%@ page import="memo.*" %> 
<%@ page import="team.*" %> 
<%@ page import="address.*" %> 
<%@ page import="bbs.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 



<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="bdao" class="bbs.BbsDAO"/>
<jsp:useBean id="tdao" class="team.TeamDAO"/>
<jsp:useBean id="mdao" class="memo.MemoDAO"/>
<jsp:useBean id="adao" class="address.AddressDAO"/>


<% 
	request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();	
	

%> 
 