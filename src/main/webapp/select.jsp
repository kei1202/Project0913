<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<h2>회원 조회</h2>
<%@ include file="dbconn.jsp" %>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
	</tr>
	<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from membertable";
	try {
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString("id");
			String passwd=rs.getString("passwd");
			String name=rs.getString("name");
	%>
	<tr>
		<td><%=id %></td>
		<td><%=passwd %></td>
		<td><%=name %></td>
	</tr>
	<%
			}
	}catch(Exception e) {
		System.out.println("데이터베이스 읽기 에러");
		e.printStackTrace();
	}
	%>
</table>
</section>
<%@include file="footer.jsp" %>
</body>
</html>