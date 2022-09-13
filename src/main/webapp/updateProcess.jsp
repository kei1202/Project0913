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
	String passwd=request.getParameter("passwd");
	String name=request.getParameter("name");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		String sql="select id, passwd from membertable where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String rID=rs.getString("id");
			String rPass=rs.getString("passwd");
			if(rPass.equals(passwd)){
				sql="update membertable set name=? where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				%>
				<script>
					alert ("수정 성공");
					history.back(-1);
				</script>
				<% 
			}else{
				%>
				<script>
					alert ("비밀번호가 일치하지 않습니다");
					history.back(-1);
				</script>
				<% 
			}
			
		}else{
			%>
			<script>
				alert ("일치하지 않는 id입니다");
				history.back(-1);
			</script>
			<%
		}
	}catch(Exception e){
		System.out.println("데이터베이스 에러");
	}
%>
</body>
</html>