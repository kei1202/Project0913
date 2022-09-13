<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    
    <%
    Connection conn=null;
    String Driver="com.mysql.cj.jdbc.Driver";
    String Url="jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
    String user="root";
    String pass="1234";
    
    try {
    	Class.forName(Driver);
    	conn=DriverManager.getConnection(Url,"root","1234");   
    	System.out.println("데이터베이스 연결 성공");
    }catch(Exception e){
    	System.out.println("데이터베이스 연결 실패");
    	e.printStackTrace();
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>