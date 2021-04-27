<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/header.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form method="post" modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>

                <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                                <%--                            <form:checkbox path="categories" value="${category.id}"/>--%>
                            <input type="checkbox" name="categories" value="${category.id}"/>
                                    <form:errors path="categories"/>
                            <span class="checkbox"></span>
                            <span id="category" class="description">${category.name}</span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <form:button type="button" style="display: none;" id="prevButtonStep1" class="btn prev-step">Wstecz</form:button>
                    <form:button type="button" class="btn next-step">Dalej</form:button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label for="quantity">Liczba 60l worków:</label>
                    <form:input type="number" id="quantity" min="1" max="10" path="quantity"/>
                    <form:errors path="quantity"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <form:button type="button" id="prevButtonStep2" class="btn prev-step">Wstecz</form:button>
                    <form:button type="button" class="btn next-step">Dalej</form:button>
                </div>
            </div>


            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                    <c:forEach items="${institutions}" var="institution">
                        <div class="form-group form-group--checkbox">
                            <label>
                                <form:radiobutton path="institution" id="institution" value="${institution.id}"/>
                                <form:errors path="institution" />
                                <span class="checkbox radio"></span>
                                <span id="institution" class="description">${institution.name}</span>
                            </label>
                        </div>
                    </c:forEach>

                <div class="form-group form-group--buttons">
                    <form:button type="button" id="prevButtonStep3" class="btn prev-step">Wstecz</form:button>
                    <form:button type="button" class="btn next-step">Dalej</form:button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label for="street">Ulica</label>
                            <form:input type="text" id="street" path="street"/>
                            <form:errors path="street" />
                        </div>

                        <div class="form-group form-group--inline">
                            <label for="city">Miasto</label>
                            <form:input type="text" id="city" path="city"/>
                            <form:errors path="city" />
                        </div>

                        <div class="form-group form-group--inline">
                            <label for="zipCode">Kod Pocztowy</label>
                            <form:input type="text" id="zipCode" path="zipCode"/>
                            <form:errors path="zipCode" />
                        </div>

                            <%--                <div class="form-group form-group--inline">--%>
                            <%--                  <label>--%>
                            <%--                    Numer telefonu <input type="phone" name="phone" />--%>
                            <%--                  </label>--%>
                            <%--                </div>--%>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label for="pickUpDate">Date</label>
                            <form:input type="date" id="pickUpDate" path="pickUpDate"/>
                            <form:errors path="pickUpDate" />
                        </div>

                        <div class="form-group form-group--inline">
                            <label for="pickUpTime">Time</label>
                            <form:input type="time" id="pickUpTime" path="pickUpTime"/>
                            <form:errors path="pickUpTime" />
                        </div>

                        <div class="form-group form-group--inline">
                                <label for="pickUpComment">Uwagi dla kuriera</label>
                                <form:textarea type="text" id="pickUpComment" placeholder="Komentarz nie jest wymagany, ale ułatwia pracę kurierowi" path="pickUpComment"/>
                                <form:errors path="pickUpComment" />
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <form:button type="button" id="prevButtonStep4" class="btn prev-step">Wstecz</form:button>
                    <form:button type="button" class="btn next-step">Dalej</form:button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                    <%--TODO uzupełić o JS--%>
                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text">
                                    <b><span id='displayQuantity'></span></b> worki <b><span id='displayCategory'></span></b></span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                ><b><span id='displayInstitution'></span></b></span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id='displayStreet'></li>
                                <li id='displayCity'></li>
                                <li id='displayZipCode'></li>
                                    <%--                                <li>123 456 789</li>--%>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="displayPickUpDate"></li>
                                <li id="displayPickUpTime"></li>
                                <li id="displayPickUpComment"></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form:form>
    </div>
</section>

<%@ include file="/footer.jsp" %>
