<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Add Institution</title>
<%--    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">--%>
</head>
<body>

<h2>Add Institution</h2>
<form:form method="post" modelAttribute="institution">
    <div>
        <label for="name">Nazwa</label>
        <form:input type="text" id="name" path="name"/>
<%--        <form:errors path="firstName"/>--%>
    </div>
    <div>
        <label for="description">Opis</label>
        <form:textarea type="text" rows="5" cols="50" id="description" path="description"/>
<%--        <form:errors path="lastName"/>--%>
    </div>
    <div>
        <input type="submit"/>
    </div>
</form:form>

</body>
</html>