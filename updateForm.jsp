<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>

<%!
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String driver = "oracle.jdbc.driver.OracleDriver";

String sql = "select * from members where id=?";
%>

</head>
<body>
<%
	String userid = request.getParameter("userid");
	String name = null;
	String phone = null;
	// 비밀번호는 수정사항이 아닙니다.
	try{
		Class.forName( driver );
		con = DriverManager.getConnection(url, "scott", "tiger");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		if( rs.next() ){
			name = rs.getString("name");
			phone = rs.getString("phone");
		}
	} catch( Exception e ){ e.printStackTrace(); 
	} finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch( Exception e ){ e.printStackTrace(); }
	}
%>
<h2>회원의 정보 수정 폼</h2>
<form method="post" action="updateMember_do.jsp">
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" size="20" value="<%=name %>"/></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=userid %></td>
		</tr>
		
		
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd" size="20"/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone" size="11" value="<%=phone %>"/></td>
		</tr>
		<input type="hidden" name="updateid" value="<%=userid %>"/>
		<tr><td colspan="2"><input type="submit" value="정보수정"/>
			<input type="reset" value="취소"></td></tr>
	</table>
</form>
</body>
</html>