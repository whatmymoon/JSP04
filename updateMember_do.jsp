<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%
// updateMember_do.jsp
// updateForm.jsp에서 전달된 값으로 레코드를 수정하고, MemberMGR.jsp 로 돌아가도록 코딩하세요

	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String updateid = request.getParameter("updateid");
	
	String sql = "update members set name=?, pwd=?, phone=? where id=?";
	
	try{
		Class.forName( driver );
		con = DriverManager.getConnection(url, "scott", "tiger");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, pwd);
		pstmt.setString(3, phone);
		pstmt.setString(4, updateid);
		pstmt.executeUpdate();
	}catch( Exception e ){ e.printStackTrace();
	}finally{
		try{
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		}catch( Exception e ){ e.printStackTrace(); }
	}
	
	response.sendRedirect("MemberMGR.jsp");

%>