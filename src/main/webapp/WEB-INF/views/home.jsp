<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<a href="${path}/admin/admin"> BOSS </a>
	<a href="${path}/admin/preMailAAA">MAIL</a>
</body>
</html>


