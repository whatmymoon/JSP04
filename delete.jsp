<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<%
// delete.jsp
// 전달된 userid로 레코드를 삭제한 후 MemberMGR.jsp 로 되돌아 가세요
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String sql = "delete from members where id = ?";

String userid = request.getParameter("userid");

Connection con = null;
PreparedStatement pstmt = null;

try{
	Class.forName( driver );
	con = DriverManager.getConnection(url, "scott", "tiger");
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.executeUpdate();
}catch( Exception e ){ e.printStackTrace();
}finally{
	try{
		if(con != null) con.close();
		if(pstmt != null) pstmt.close();
	}catch( Exception e ){
		e.printStackTrace();
	}
}

response.sendRedirect("MemberMGR.jsp");

%>