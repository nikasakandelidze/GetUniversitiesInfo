<%--
  Created by IntelliJ IDEA.
  User: AzRy
  Date: 8/1/2020
  Time: 12:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Faculties</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style><%@include file="styles/universityListing.css"%></style>
</head>
<body>
<%@include file="helpers/navbar.jsp"%>
<p>
<h1 style="text-align: center; color:cadetblue;">
    Faculties Page
</h1>
</p>
<div class="uni-list">
    <c:forEach items="${allSubjects}" var="subject">
        <div class="list-group" style="height: 170px">
<%--            href="/faculty/${faculty.facultyId}"--%>
            <a  class="list-group-item list-group-item-action" style="border-radius: 10px">
                <div class="sub-name">
                    Subject name : <h4>${subject.subjectName}</h4>
                </div>
            </a>
        </div>
    </c:forEach>
</div>
</body>
</html>
