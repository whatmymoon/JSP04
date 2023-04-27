<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<%
//insertMember_do.jsp
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
Connection con = null;
PreparedStatement pstmt = null;

String name = request.getParameter("name");
String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");
String phone = request.getParameter("phone");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String uid = "scott";
String pass = "tiger";
String sql = "insert into members(id, name, pwd, phone) values(?,?,?,?)";

// 레코드들을 추가합니다.
// try catch 구문을 JDBC 에서 사용한 것처럼 레코드를 추가 코딩을 완성해주세요.

try{
	Class.forName(driver);
	con = DriverManager.getConnection( url, uid, pass );
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,userid);
	pstmt.setString(2,name);
	pstmt.setString(3,pwd);
	pstmt.setString(4,phone);
	
	pstmt.executeUpdate();
}catch( Exception e ){ e.printStackTrace();
}finally{
	try{
		if(con != null) con.close();
		if(pstmt != null) pstmt.close();
	}catch(Exception e){ e.printStackTrace(); }
}

response.sendRedirect("MemberMGR.jsp");
%>