<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int no = (int)request.getAttribute("no"); %>

<form action="/guestbook2/gbc" method="get">
<input type="hidden" name="action" value="delete">
<input type="hidden" name="no" value="<%= no %>">
비밀번호확인:<input type="password" name="password" value="">
			 <button type="submit">확인</button>
</form>

</body>
</html>