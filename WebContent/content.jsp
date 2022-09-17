<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content</title>
</head>
<%
	String idx = request.getParameter("idx");


	try{
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"board","board");
		out.println("connection success!!");
		
		ResultSet rs = null;
		Statement stmt = con.createStatement();
		String sql = "select *  from board where idx ="+idx;
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
	
%>
<body>
	<h1>게시글</h1>
	<table border="1">
		
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx")%></td>
			<th>작성자</th>
			<td><%=rs.getString("writer")%></td>
			<th>날짜</th>
			<td><%=rs.getString("regdate") %></td>
			<th>조회수</th>
			<td><%=rs.getString("count") %></td>
		</tr>
		
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><%=rs.getString("content") %></td>					
	</table>
	<a href = "delete.jsp?idx=<%=rs.getString("idx")%>">게시글삭제</a>
	<a href= "list.jsp">목록으로</a>

</body>
<%
		}
	con.close();
	}
	catch(Exception e){
		out.println("failed connection");
		out.println("e.getMassage()");
		e.printStackTrace();
	}

%>

</html>