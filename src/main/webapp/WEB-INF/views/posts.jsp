<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO,java.util.*" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("Are you sure to delete?");
		if(a) location.href='deleteok/' + id;
	}
	function goToViewPage(id) {
		window.location.href = 'view/' + id;
	}
</script>
</head>
<body>
<h1>자유게시판</h1>
<table id="list" width="90%">
	<tr>
		<th>Id</th>
		<th>Title</th>
		<th>Writer</th>
		<th>Content</th>
		<th>Regdate</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	<c:forEach items="${list}" var="u">
		<tr onclick="goToViewPage('${u.getId()}')">
			<td>${u.getId()}</td>
			<td>${u.getTitle()}</td>
			<td>${u.getWriter()}</td>
			<td>${u.getContent()}</td>
			<td>${u.getRegDate()}</td>
			<td><a href="editform/${u.getId()}">Edit</a></td>
			<td><a href="javascript:delete_ok('${u.getId()}')">Delete</a></td>
		</tr>
	</c:forEach>
</table>
<br/><a href="add">Add New Post</a>
</body>
</html>