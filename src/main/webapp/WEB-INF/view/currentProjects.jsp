
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--CSS URL-->
        <s:url var="style_url" value="/Resources/css/style.css" />
        <s:url var="animation_url" value="/Resources/css/animation.css" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${style_url}">
        <link rel="stylesheet" type="text/css" href="${animation_url}">

        <title>Current Projects - Edenz Research Bank</title>

    </head>

    <body>
        <jsp:include page="include/reserachBankNav.jsp" />
        <s:url var="index_url" value="/" />
        <!--navigator-->
        <div id="location" class="container-fluid">
            <div class="container">
                <p><span class="glyphicon glyphicon-home">&nbsp;</span><a href="${index_url}">Research Bank </a>&gt; Current Projects</p>
            </div>
        </div>
        <main style="height: 100vh;">
            <c:forEach var="currentProjects" items="${projects}">
                <s:url var="docDetails_url" value="/docHandle">
                    <s:param name="documentId" value="${currentProjects.project_id}" />
                </s:url>
                <div class="well">
                    <a href="${docDetails_url}">${currentProjects.title}</a>
                    <h6>
                        <span style="font-weight: bold;">Authors :</span>
                        <a href="#" target="_blank">${currentProjects.author_one}</a>
                        <a href="#" target="_blank">${currentProjects.author_two}</a>
                        <a href="#" target="_blank">${currentProjects.author_three}</a>
                        <a href="#" target="_blank">${currentProjects.author_four}</a>
                    </h6>  
                    <div style="overflow: hidden;height:60px;">
                        <p class="textLimit">${currentProjects.description}</p>
                    </div>
                </div>
            </c:forEach>
        </main>
        <!--footer-->
        <footer>
            <small>&copy; 2017 All rights reserved to Edenz College</small>
        </footer>
        <s:url var="researchbank_script" value="/Resources/js/researchBank.js" />
        <!--JQuery CDN-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- JS for Bootstrap-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
