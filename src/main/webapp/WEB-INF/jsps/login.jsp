<%--
  Created by IntelliJ IDEA.
  User: prabh
  Date: 2016-11-25
  Time: 9:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master pageTitle="Edit Article">
    <jsp:attribute name="header">
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <section class="columns box">
            <aside class="column is-half">
                <h1 class="title">Login</h1>
                <form action="/login" method="post">
                    <p class="control has-icon">
                        <input class="input" type="text" name="username" placeholder="Username" autofocus minlength="4" maxlength="10" required>
                        <i class="fa fa-envelope"></i>
                    </p>
                    <p class="control has-icon">
                        <input class="input" type="password" name="password" placeholder="Password" minlength="4" maxlength="10" required>
                        <i class="fa fa-lock"></i>
                    </p>
                    <c:if test="${param.error != null}">
                        <span class="help is-danger">Invalid Credentials. Please check your username and password!</span>
                    </c:if>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <p class="control">
                        <button class="button is-success">
                            Login
                        </button>
                    </p>
                </form>
            </aside>
            <aside class="column is-half">
                <h1 class="title">Register</h1>
                <form action="/register" method="post">
                    <p class="control has-icon">
                        <input class="input" type="text" id="username" name="username" placeholder="Username" minlength="4" maxlength="10" required>
                        <i class="fa fa-envelope"></i>
                    </p>
                    <p class="control has-icon">
                        <input class="input" type="password" id="pass" name="password" placeholder="Password" minlength="4" maxlength="10" required>
                        <i class="fa fa-lock"></i>
                    </p>
                    <p class="control has-icon">
                        <input class="input" type="password" id="passCheck" placeholder=" Retype Password" minlength="4" maxlength="10" required>
                        <i class="fa fa-lock"></i>
                    </p>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <p class="control">
                        <button class="button is-info">
                            Register
                        </button>
                    </p>
                </form>
            </aside>
        </section>
        <script>
            const pass = document.getElementById(`pass`).value;
            const passCheck = document.getElementById(`passCheck`).value;
            const verifyPasswords = () => {
                if (pass) {
                    if ((pass !== passCheck)) {
                        return true;
                    }
                    return false;
                }
            }
        </script>
    </jsp:body>
</t:master>