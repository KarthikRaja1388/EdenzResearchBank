
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
        <jsp:include page="include/reserachBankNav.jsp" />
        <s:url var="index_url" value="/" />
        <!--navigator-->
        <div id="location" class="container-fluid">
            <div class="container">
                <p><span class="glyphicon glyphicon-home">&nbsp;</span><a href="${index_url}">Research Bank &gt;</a></p>
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


                <h3 class="text-left">Recently Added</h3>
                <hr>
                <c:if test="${param eq 'f'}">
                    <div class="alert alert-danger text-center">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <Strong >Failed to open document</strong>
                    </div> 
                </c:if>
            
                <div class="col-md-8" id="colLeft">
                    <c:forEach var="researchOutput" items="${document}">
                        <s:url var="docDetails_url" value="/docHandle">
                            <s:param name="documentId" value="${researchOutput.document_id}" />
                        </s:url>
                        <div class="recentlyAddedProjects well">
                            <a href="${docDetails_url}" class="documentTitleLink"><h4>${researchOutput.title}</h4></a>
                            <h6><span style="font-weight: bold;">Authors :</span><a href="#" target="_blank">${researchOutput.author_one}</a>;<a href="#" target="_blank">${researchOutput.author_two}</a>;<a href="#" target="_blank">${researchOutput.author_three}</a>;
                                <a href="#" target="_blank">${researchOutput.author_four}</a></h6>
                            <div style="overflow: hidden;height:60px;">
                                <p class="textLimit">${researchOutput.description}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!--social icons URL-->
                <s:url var="fb_icon" value="/Resources/img/fb.png" />
                <s:url var="twitter_icon" value="/Resources/img/twitter.png" />
                <s:url var="linkd_icon" value="/Resources/img/linkd.png" />
                <s:url var="gplus_icon" value="/Resources/img/gplus.png" />

                <div class="col-md-4 well" id="colRight">
                    <div id="social">
                        <h4 class="text-center">Share</h4>
                        <hr>
                        <ul class="col-md-12 text-center socialIcons">
                            <li><a href="#" ><i class="fa fa-facebook icons" aria-hidden="true" id="fb_share" onclick="fb_share()"></i></a> </li>
                            <li><a href="#"><i class="fa fa-twitter icons" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin icons" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus icons" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </main>
        <!--footer-->
        <jsp:include page="include/footer.jsp" />
        <s:url var="researchbank_script" value="/Resources/js/researchBank.js" />
        <!--JQuery CDN-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- JS for Bootstrap-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
