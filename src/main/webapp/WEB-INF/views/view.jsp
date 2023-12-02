<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO,java.util.*" isELIgnored="false" %><%--
  Created by IntelliJ IDEA.
  User: vinci
  Date: 11/23/23
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
  <link href="my.css" rel="stylesheet">
<body>
<div class="container mt-5">
  <h2 class="text-center mb-4">Detail Page</h2>
  <div class="row h-100" >
    <div class="col-md-8 offset-md-2">
      <div class="card">
        <div class="card-header">
          Detail
        </div>
        <div class="card-body">
          <h5 class="card-title"><strong>Title: </strong>${u.title}</h5>
          <p class="card-text"><strong>Writer: </strong>${u.writer}</p>
          <p class="card-text"><strong>Content: </strong>${u.content}</p>
          <p class="card-text"><strong>Register Date: </strong>${u.regDate}</p>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>

