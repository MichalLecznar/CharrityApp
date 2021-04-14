<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<ul>
    <c:forEach items="${institutions}" var="institution" varStatus="status">
        <c:if test="${status.index % 2 != 0}">
            <li>
        </c:if>

        <div class="col">
            <div class="title">Fundacja "${institution.name}"</div>
            <div class="subtitle">Cel i misja: ${institution.description}.</div>
        </div>

        <c:if test="${status.index % 2 == 0}">
            </li>
        </c:if>

    </c:forEach>
</ul>