<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master pageTitle="View Article">
    <jsp:attribute name="header">
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="card is-fullwidth">
            <header class="card-header">
                <p class="card-header-title">
                        ${article.title}
                </p>
            </header>
            <div class="card-content">
                <div class="content">
                        ${article.source}<br>
                    <code class="is-pulled-right">Last Modified by ${article.user}</code>
                    <br/>
                    <code class="is-pulled-right">on ${article.lastModifiedDate}</code>
                </div>
            </div>
            <footer class="card-footer">
                <a class="card-footer-item" href="/edit/${article.id}">Edit</a>
                <a class="card-footer-item" href="/delete/${article.id}">Delete</a>
            </footer>
        </div>
    </jsp:body>
</t:master>
