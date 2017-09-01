<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${document.title}</title>
        <s:url var="docDetail_css" value="/Resources/css/docDetails.css" />
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link rel="stylesheet" type="text/css" href="${docDetail_css}">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <!--Nav bar-->
        <jsp:include page="include/reserachBankNav.jsp" />
        <s:url var="index_url" value="/" />
        <s:url var="logo_url" value="/Resources/img/Edenz-Logo.png" />
        <s:url var="bg_paper" value="/Resources/img/paper.png" />
        <!--Navigator -->
        <div id="location" class="container-fluid">
            <div class="container"> 

                <p><span class="glyphicon glyphicon-home">&nbsp;</span><a href="${index_url}">Research Bank</a> &gt; ${document.department} &gt; View Item</p>
            </div>
        </div>
        <!--Header-->
        <header class="container-fluid well">
            <div class="container" id="contentHeader">
                <h3 class="text-left col-md-8">${document.title}</h3>
                <h4 class="col-md-8">${document.author_one} ${document.author_two}
                    ${document.author_three} ${document.author_four}</h4>
            </div>

        </header>
        <!-- Main content-->
        <main class="container-fluid">
            <div class="col-md-12">
                <!--Start of center column-->
                <div  class="col-md-8" id="colLeft">
                    <div class="well">
                        <p><span style="font-weight:bold">Citation : </span>${document.citation}</p>
                    </div>
                    <div class="well">
                        <p>${document.description}</p>
                    </div>
                    <div class="well">
                        <p>Department : ${document.department}</p>
                    </div>
                    <div class="well">
                        <p><span style="font-weight:bold">Keywords : </span>${document.keywords}</p>
                    </div>
                </div><!--End of center column-->
                <!--Start of right column-->
                <div class="col-md-4 well" id="colRight">
                    <!--Start of search container-->
                    <div class="searchContainer well">
                        <div class="col-md-12 input-group" id="search">
                            <input type="text" class="form-control">
                            <span class="input-group-addon">
                                <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                            </span> 
                        </div>
                            <input type="radio" name="search" value="search" checked>Search all<br>
                            <input type="radio" name="searchcol" value="searchcol">Search this collection
                    </div><!--End of search container-->
                    <!--Start of share container-->
                    <div class="col-md-12 well" id="social">
                        <h4 class="text-center"><b>Share</b></h4>
                        <hr>
                        <div id="shareIcon" class="col-md-12 text-center">
                            <div class="addthis_inline_share_toolbox_noue"></div>
                        </div>
                    </div><!--End of share container-->
                    <!--Start of About container-->
                    <div class="col-md-12 list-group well" id="about">
                        <h4 class="text-center">About</h4>
                        <hr>
                        <a class="list-group-item" href="about.html" id="aboutUs">About Research Bank</a>
                        <a class="list-group-item" href="about.html">Research at Edenz</a>

                    </div><!--End of About container-->

                    </div>
               </div>
        </main>
        <footer> <small>&copy; 2017 All rights reserved to Edenz College</small> </footer>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5983b80d7d865950"></script>
    </body>
</html>