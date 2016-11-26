<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master pageTitle="Home">
    <jsp:attribute name="header">
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="animated fadeIn" style="width: 90%;">
            <div class="level">
                <div class="level-item has-text-centered">
                    <img src="https://www.wired.com/images_blogs/business/2009/05/wikipedia-logo-en-big.png"
                         alt="Wiki Logo" width="200px"></div>
            </div>
            <br/>
            <a class="button is-success" href="/edit">Add new Article</a>
            <hr/>
            <section class="columns is-multiline is-fullwidth">
                <c:forEach items="${articleList}" var="a">
                    <section class="column is-one-quarter">
                        <div class="card">
                            <header class="card-header">
                                <p class="card-header-title">
                                        ${a.title}
                                </p>
                            </header>
                            <div class="card-content">
                                <div class="content">
                                        ${fn:substring(a.source, 0, 50)}
                                    <br>
                                    <code>${a.lastModifiedDate}</code>
                                </div>
                            </div>
                            <footer class="card-footer">
                                <a class="card-footer-item" href="/view/${a.id}">View</a>
                                <a class="card-footer-item" href="/edit/${a.id}">Edit</a>
                                <a class="card-footer-item" href="/delete/${a.id}">Delete</a>
                            </footer>
                        </div>
                    </section>
                </c:forEach>
            </section>
        </div>
    </jsp:body>
</t:master>
