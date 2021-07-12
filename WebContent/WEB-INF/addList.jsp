<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.javaex.dao.GuestBookDao"%>
<%@page import="com.javaex.vo.GuestBookVo"%>
<%@page import="java.util.List"%>    

<%
List<GuestBookVo> guestList = (List<GuestBookVo>) request.getAttribute("gList");
System.out.println(guestList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!------------------- 등록폼 ------------------->
	<form action="/guestbook2/gbc" method="get">
	<input type="text" name="action" value="add">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""></td>
				<td>비빌번호</td>
				<td><input type="text" name="password" value=""></td>
			</tr>

			<tr>
				<td colspan="4"><input type="text" name="content" value=""
					style="width: 440px; height: 100px;"></td>
					
			</tr>

			<tr>
				<td><button type="submit">확인</button></td>
			</tr>

		</table>
	</form>
	
	<!------------------ 리스트 ------------------>
	<%
	for (int i = 0; i < guestList.size(); i++) {
	%>
	<br>
	<table border="1">

		<tr>
			<td><%=guestList.get(i).getNo()%></td>
			<td><%=guestList.get(i).getName()%></td>
			<td><%=guestList.get(i).getReg_date()%></td>
			<td><a href="/guestbook2/gbc?action=deleteForm&no=<%= guestList.get(i).getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4" height="60"><%=guestList.get(i).getContent()%></td>
		</tr>
	</table>

	<%
	}
	%>
</body>
</html>