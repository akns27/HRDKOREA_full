<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>롯데자이언츠 선수 목록</h2>
<form>
<table border="1">
	<tr>
	<td>선수번호</td>
	<td>선수이름</td>
	<td>선수포지션</td>
	<td>선수등록일</td>
	<td>선수등급</td>
	<td>삭제</td>
	</tr>

<%
	request.setCharacterEncoding("UTF-8");
	try{
		String sql = "select * from giants_player";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String day = rs.getString(4);
			day = day.substring(0,4) + "년" + day.substring(4,6)  + "월" + day.substring(6,8) + "일";
		
		%>
		<tr>
			<td><a href="modify.jsp?pid=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=day %></td>
			<td><%=rs.getString(5) %></td>
			<td><a href="action.jsp?pid=<%=rs.getString(1) %>&mode=delete">삭제</a></td>

			
		</tr>
		<%
		}	
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>