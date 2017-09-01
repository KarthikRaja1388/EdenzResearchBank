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
        <s:url var="docDetail_css" value="/Resources/css/docDetails.css" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${style_url}">
        <link rel="stylesheet" type="text/css" href="${docDetail_css}">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

        <title>Edenz Research Bank - Home</title>
    </head>
    <body>
        <jsp:include page="include/reserachBankNav.jsp" />
        <!--Navigator -->
        <div id="location" class="container-fluid">
            <div class="container"> 

                <p><span class="glyphicon glyphicon-home">&nbsp;</span><a href="${index_url}">Research Bank</a> &gt; Search Results</p>
            </div>
        </div>
        <div class="container-fluid">
            <div class="container">
                <div class="col-md-8 " id="col-right">
                    <c:if test="${param.act eq 'no_doc'}">
                        <div class="alert alert-danger well text-center">${noDocument}</div>
                    </c:if>
                    <h3 class="text-left well">Search Result for '${searchKey}'</h3>
                    <c:forEach var="document" items="${documents}" varStatus="status" >
                        <s:url var="docDetails_url" value="/docHandle">
                            <s:param name="documentId" value="${document.document_id}" />
                        </s:url>
                        <div class=" well">
                            <a href="${docDetails_url}" class="documentTitleLink"><h4>${document.title}</h4></a>
                            <h6>
                                <span style="font-weight: bold;">Authors :</span>
                                <a href="#" target="_blank">${document.author_one}</a>
                                <a href="#" target="_blank">${document.author_two}</a>
                                <a href="#" target="_blank">${document.author_three}</a>
                                <a href="#" target="_blank">${document.author_four}</a>
                            </h6>
                            <div style="overflow: hidden;height:60px;">
                                <p class="textLimit">${document.description}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-4" id="col-right">
                    <!--Start of share container-->
                    <div class="col-md-12 well">
                        <h4 class="text-center"><b>Share</b></h4>
                        <hr>
                        <div id="shareIcon" class="col-md-12 text-center">
                        <div class="addthis_inline_share_toolbox_noue"></div>
                    </div>
                    </div><!--End of share container-->
            </div>
        </div>
    </div>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5983b80d7d865950"></script>
</body>
</html>
