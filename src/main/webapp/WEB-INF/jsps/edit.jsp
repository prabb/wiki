<%--
  Created by IntelliJ IDEA.
  User: prabh
  Date: 2016-11-24
  Time: 12:41 AM
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
        <form:form commandName="article" method="post" action="/save" cssClass="editContent">
            <form:hidden path="id"/>
            <label class="label is-pulled-left">Title</label>
            <p class="control">
                <form:input path="title" cssClass="input is-info" placeholder="Title" value="${article.title}"/>
            </p>
            <hr/>
            <div id="editor" name="source" onkeydown="transfer()"></div>
            <form:hidden path="source"/>
            <form:hidden path="lastModifiedDate" value="${LocalDate.now()}"/>
            <form:hidden path="user" value=""/>
            <input type="submit" class="button is-success" value="Save Article!"/>
        </form:form>

        <div>
            <!-- Include stylesheet -->
            <link href="https://cdn.quilljs.com/1.1.5/quill.snow.css" rel="stylesheet">

            <!-- Include the Quill library -->
            <script src="https://cdn.quilljs.com/1.1.5/quill.js"></script>

            <!-- Initialize Quill editor -->
            <script>
                const quill = new Quill(`#editor`, {
                    theme: 'snow'
                });
                quill.setText(`${article.source}`);

                const transfer = () => {
                    let content = quill.getContents().ops;
                    let appended = ``;
                    for (let i of content) {
                        appended += i.insert;
                    }
                    document.getElementById(`source`).value = appended;
                    return appended
                }
            </script>
        </div>
    </jsp:body>
</t:master>
