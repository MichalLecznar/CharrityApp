<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>

<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="#" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="#" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="#" class="btn btn--without-border">O nas</a></li>
            <li><a href="#" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="#" class="btn btn--without-border">Kontakt</a></li>
            <li><a href="/donation/add" class="btn btn--without-border">Przekaż</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>
        </div>
    </div>
    <script language="JavaScript">
        function showCategoryCheck() {
            const checkboxes = document.querySelectorAll(`input[name="categories"]:checked`);
            let arr = [];
            checkboxes.forEach((checkbox) => {
                arr.push(checkbox.nextElementSibling.nextElementSibling.innerHTML);
            });
            document.getElementById('displayCategory').innerHTML = arr.join(", ");

            return arr;
        }
    </script>

    <script>
        function institutionSelect(){
            const institution = document.querySelector(`input[name="institution"]:checked`);
            document.getElementById('displayInstitution').innerHTML =
                institution.nextElementSibling.nextElementSibling.innerHTML;
                return institution;
        }
    </script>

</header>