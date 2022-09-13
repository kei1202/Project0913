<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String passwd=request.getParameter("pass");
	String name=request.getParameter("name");
	
	PreparedStatement pstmt=null;
	String sql="insert into memberTable(id,passwd,name) values(?,?,?)";
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.executeUpdate();
		System.out.println("저장 성공");
		%>
		<script>
		alert("저장 성공");
		location.href="select.jsp";
		</script>
		<%
	} catch(Exception e) {
		System.out.println("저장 실패");
		e.printStackTrace();
	}

%>

아이디 : <%=id %><br>
비밀번호 : <%=passwd %><br>
이름 : <%=name %>
</body>
</html>