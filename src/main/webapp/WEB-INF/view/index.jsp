
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
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${style_url}">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

        <title>Edenz Research Bank - Home</title>
    </head>

    <body>
        <!--Nav bar-->
        <nav class="navbar navbar-inverse" id="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navItems" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!--<a class="navbar-brand" href="#" id="logo">EDENZ</a>-->
                </div>
                <div class="collapse navbar-collapse" id="navItems">
                    <ul class="nav navbar-nav">
                        <li><a href=""><span class="glyphicon glyphicon-home"></span></a></li>
                        <li><a href="#">Current Projects</a></li>
                        <li><a href="#">Past Projects</a></li>
                        <li><a href="#">Staff Research</a></li>
                        <li><a href="#">Funding</a></li>
                        <li><a href="#">Ideas</a></li>
                    </ul>
                    <s:url var="login_url" value="/loginApp"/>
                    <ul class="nav navbar-nav pull-right">
                        <li><a href="${login_url}"><span class="glyphicon glyphicon-user"></span>&nbsp;Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--navigator-->
        <div id="location" class="container-fluid">
            <div class="container">
                <a href="index.html"><p><span class="glyphicon glyphicon-home">&nbsp;</span>Research Bank &gt;</p></a>
            </div>
        </div>
        <!--Header-->
        <header class="container-fluid well">
            <div class="container" id="contentHeader">
                <h3 class="text-center">Welcome to EDENZ Research Bank</h3>
                <p class="text-center col-md-6 col-md-offset-3">This Edenz Research Bank is a repository of research outputs of EDENZ students and staff.</p>
                <div class="col-md-8 col-md-offset-2 input-group" id="search">
                    <input type="text" class="form-control">
                    <span class="input-group-addon"><button type="submit"><span class="glyphicon glyphicon-search"></span></button></span>
                </div>
            </div>
        </header>
        <!-- Main content-->
        <main class="container-fluid">
            <div class="container">

                <!--TO DO 
                    need to pass document id as parameter
                -->
                <s:url var="document_detail" value="/docDetails" >
                    <s:param name="selectedDocument" value="${document.document_id}" />
                </s:url>
               
                <h3 class="text-left">Recently Added</h3>
                <div class="col-md-8" id="colLeft">
                    <c:forEach var="researchOutput" items="${document}">
                        <div class="recentlyAddedProjects">
                            <a href="#" class="documentTitleLink"><h4>${researchOutput.title}</h4></a>
                            <h6><span style="font-weight: bold;">Authors :</span><a href="http://www.edenz.ac.nz/k-Teacher/ganeshan-kathiravelu/" target="_blank">${researchOutput.authors}</a></h6>
                            <p>${researchOutput.description}</p>
                        </div>
                    </c:forEach>
                </div>
                <!--social icons URL-->
                <s:url var="fb_icon" value="/Resources/img/fb.png" />
                <s:url var="twitter_icon" value="/Resources/img/twitter.png" />
                <s:url var="linkd_icon" value="/Resources/img/linkd.png" />
                <s:url var="gplus_icon" value="/Resources/img/gplus.png" />

                <div class="col-md-4" id="colRight">
                    <div id="social">
                        <h4 class="text-center">Share</h4>
                        <hr>
                        <ul id="socialIcons" class="col-md-12 text-center">
                            <li><a href="#"><i class="fa fa-facebook icons" aria-hidden="true"></i></a> </li>
                            <li><a href="#"><i class="fa fa-twitter icons" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin icons" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus icons" aria-hidden="true"></i></a></li>
                        </ul>
                    </div><br>
                    <div id="tweet">
                        <h4 class="text-center">News</h4>
                        <hr>
                        <div class="well">
                            <h5>Some News</h5>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        </div>
                        <div class="well">
                            <h5>Same News</h5>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--footer-->
        <footer>
            <small>&copy; 2017 All rights reserved to Edenz College</small>
        </footer>
        <!--JQuery CDN-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- JS for Bootstrap-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
