<%@ tag description="Master Page template" pageEncoding="UTF-8" %>
<%@ attribute name="header" fragment="true" %>
<%@ attribute name="footer" fragment="true" %>
<%@ attribute name="pageTitle" required="true" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${pageTitle}</title>
    <link rel="shortcut icon" href="https://upload.wikimedia.org/wikipedia/commons/c/c8/Black_W_for_promotion.png">

    <%--CSS Library--%>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.2.3/css/bulma.css">

    <%--Animation Library--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <%-- Icon --%>
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <%--<link rel="stylesheet" type="text/css" href="WEB-INF/css/app.css">--%>
    <style>
        #editor {
            background-color: white;
            margin: 0 2% 2% 2%;
            width: 90%;
            clear: both;
        }

        .ql-toolbar {
            background-color: cadetblue;
        }

        .editContent {
            width: 90%;
        }

        #body, .footer {
            display: flex;
            justify-content: center;
            align-content: center;
            align-items: center;
            text-align: center;
            padding: 2% 0;
        }
        .footer{
            background-color: white;
        }

        .image {
            text-align: center;
            display: flex;
            justify-content: center;
        }

        .nav{
            margin-bottom: 1%;
        }
    </style>
</head>
<body>
<%--Common Header for all pages --%>
<div id="pageheader" id="header">
    <nav class="nav">
        <div class="nav-left">
            <a class="nav-item is-brand" href="/">
                <img src="https://europepmc.org/wicket/resource/uk.bl.ukpmc.web.pages.about.AboutUs/images/wikipedia-logo-ver-7D9D179F9177C44915A76BD431A39EF2.png"
                     alt="Wiki logo">
            </a>
        </div>

        <div class="nav-center">
            <a class="nav-item" href="#">
      <span class="icon">
        <i class="fa fa-github"></i>
      </span>
            </a>
            <a class="nav-item" href="#">
      <span class="icon">
        <i class="fa fa-twitter"></i>
      </span>
            </a>
        </div>

        <span class="nav-toggle">
    <span></span>
    <span></span>
    <span></span>
  </span>

        <div class="nav-right nav-menu">
            <a class="nav-item" href="/">
                Home
            </a>
            <a class="nav-item" href="/">
                Blog
            </a>

            <span class="nav-item">
      <a class="button">
        <span class="icon">
          <i class="fa fa-twitter"></i>
        </span>
        <span>Tweet</span>
      </a>
      <a class="button is-primary" href="#">
        <span class="icon">
          <i class="fa fa-facebook"></i>
        </span>
        <span>Share</span>
      </a>
    </span>
        </div>
        <jsp:invoke fragment="header"/>
    </nav>
</div>

<div id="body">
    <jsp:doBody/>
</div>

<%--Common Footer for all pages--%>
<div id="pagefooter" id="footer">
    <footer class="footer">
        <div class="container">
            <p class="whiteText"> &copy; 2015-2016. All rights reserved. Wiki Encyclopedia</p>
        </div>
        <jsp:invoke fragment="footer"/>
    </footer>
</div>
</body>
</html>