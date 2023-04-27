<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberMGR.jsp</title>
<%! /* 선언부 */
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String pass = "tiger";
	
	String sql = "select * from members";
%>
</head>
<body>
	<table width="800" border="1">
		<tr>
			<th>이름</th><th>아이디</th><th>암호</th><th>전화번호</th>
			<th>수정</th><th>삭제</th>
		</tr>
		<!-- 여기서부터 데이터베이스 레코드가 화면에 표시됩니다. -->
		<%
			try{
				Class.forName( driver );
				con = DriverManager.getConnection( url, uid, pass );
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while( rs.next() ){
					//<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
					out.print("<tr>");
						out.print("<td>" + rs.getString("name") + "</td>");
						out.print("<td>" + rs.getString("id") + "</td>");
						out.print("<td>" + rs.getString("pwd") + "</td>");
						out.print("<td>" + rs.getString("phone") + "</td>");
						out.println("<td align='center'><a href='updateForm.jsp?userid=" + rs.getString("id") + "'>수정</a></td>");
						out.println("<td align='center'><a href='delete.jsp?userid=" + rs.getString("id") + "'>삭제</a></td>");
					out.print("</tr>");
				}
			}catch( Exception e ){ e.printStackTrace();
			}finally{
				try{
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				}catch( Exception e ){ e.printStackTrace();	}
			}
			
		%>
	</table>
	<a href="insertForm.jsp">멤버 추가</a>
</body>
</html>