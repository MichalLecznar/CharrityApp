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
        function showQuantityInput() {
            document.getElementById('displayQuantity').innerHTML =
                document.getElementById("quantity").value;
        }
    </script>
    <script language="JavaScript">
        function showStreetInput() {
            document.getElementById('displayStreet').innerHTML =
                document.getElementById("street").value;
        }
    </script>
    <script language="JavaScript">
        function showCityInput() {
            document.getElementById('displayCity').innerHTML =
                document.getElementById("city").value;
        }
    </script>
    <script language="JavaScript">
        function showZipCodeInput() {
            document.getElementById('displayZipCode').innerHTML =
                document.getElementById("zipCode").value;
        }
    </script>
    <script language="JavaScript">
        function showPickUpDateInput() {
            document.getElementById('displayPickUpDate').innerHTML =
                document.getElementById("pickUpDate").value;
        }
    </script>
    <script language="JavaScript">
        function showPickUpTimeInput() {
            document.getElementById('displayPickUpTime').innerHTML =
                document.getElementById("pickUpTime").value;
        }
    </script>
    <script language="JavaScript">
        function showPickUpCommentInput() {
            document.getElementById('displayPickUpComment').innerHTML =
                document.getElementById("pickUpComment").value;
        }
    </script>
    <script language="JavaScript">
        function showCategoryCheck() {
            const checkboxes = document.querySelectorAll(`input[name="categories"]:checked`);
            let arr = [];
            checkboxes.forEach((checkbox) => {
                arr.push(checkbox.nextElementSibling.nextElementSibling.innerHTML);
            });
            document.getElementById('displayCategory').innerHTML = arr.join(", ");
        }
    </script>

    <script language="JavaScript">
        function showInstitutionSelect() {
            const checked = document.querySelectorAll(`input[name="institution"]:checked`);
            let arr = [];
            checked.forEach((radio) => {
                arr.push(radio.nextElementSibling.nextElementSibling.innerHTML);
            });
            document.getElementById('displayInstitution').innerHTML = arr;
        }
    </script>
</header>