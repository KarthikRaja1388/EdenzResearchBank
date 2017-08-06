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
        <s:url var="edenz_logo" value="/Resources/img/Edenz-Logo.png"/>
        <!--navigator-->
        <div id="location" class="container-fluid">
            <div class="container">
                <p><span class="glyphicon glyphicon-home">&nbsp;</span><a href="${index_url}">Research Bank &gt;</a></p>
            </div>
        </div>
        <!--Header-->
        <header class="container-fluid well">
            <div class="container text-center" id="contentHeader">
                <img src="${edenz_logo}" />
                <h3 class="text-center">Welcome to EDENZ Research Bank</h3>
                <p class="text-center col-md-6 col-md-offset-3">This Edenz Research Bank is a repository of research outputs of EDENZ students and staff.</p>
                <div class="col-md-8 col-md-offset-2">

                    <s:url var="search_url" value="/search" />
                    <f:form action="${search_url}" method="get" modelAttribute="searchModel">
                        <div class="form-group">
                            <f:input type="text" path="searchString" class="form-control" placeholder="Search for..." />
                        </div>
                        <div class="form-group">
                            <input class="btn btn-primary col-md-2 col-md-offset-5" type="submit" value="Search">
                        </div>
                    </f:form>
                </div><!-- /input-group -->
            </div>
        </header>
        <!-- Main content-->
        <main class="container-fluid">
            <div class="container">
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
                            <h6>
                                <span style="font-weight: bold;">Authors :</span>
                                <a href="#" target="_blank">${researchOutput.author_one}</a>
                                <a href="#" target="_blank">${researchOutput.author_two}</a>
                                <a href="#" target="_blank">${researchOutput.author_three}</a>
                                <a href="#" target="_blank">${researchOutput.author_four}</a>
                            </h6>
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

                <div class="col-md-4" id="colRight">
                    <!-- Twitter News Feeds -->
                    <div>
                        <a class="twitter-timeline"  href="https://twitter.com/search?q=%40EdenzColleges" data-widget-id="891591837546196992" 
                           data-chrome="nofooter transparent">Tweets about @EdenzColleges</a></div>
                    <script>!function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                            if (!d.getElementById(id)) {
                                js = d.createElement(s);
                                js.id = id;
                                js.src = p + "://platform.twitter.com/widgets.js";
                                fjs.parentNode.insertBefore(js, fjs);
                            }
                        }(document, "script", "twitter-wjs");</script>
                    <!--Start of share container-->
                    <div class="col-md-12 well" id="social">
                        <h4 class="text-center"><b>Share</b></h4>
                        <hr>
                        <div id="shareIcon" class="col-md-12 text-center">
                            <div class="addthis_inline_share_toolbox_noue"></div>
                        </div>
                    </div><!--End of share container-->
                    <div style="margin-top:20px; margin-bottom:20px;">
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fedenz.colleges%2F&tabs=timeline&width=350&height=350&small_header=true&adapt_container_width=true&hide_cover=true&show_facepile=false&appId" width="350" height="350" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
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
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5983b80d7d865950"></script>

    </body>
</html>
