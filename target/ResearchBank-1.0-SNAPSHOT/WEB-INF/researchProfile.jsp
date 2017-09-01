
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="style_url" value="/Resources/css/style.css" />
        <s:url var="animation_url" value="/Resources/css/animation.css" />
        <s:url var="staffresearch_url" value="/Resources/css/staffresearch.css" />        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${style_url}">
        <link rel="stylesheet" type="text/css" href="${staffresearch_url}">
        <link rel="stylesheet" type="text/css" href="${animation_url}">

        <title>${fullName} -Research Profile - Edenz Research Bank</title>
    </head>
    <body>
        <jsp:include page="include/reserachBankNav.jsp" />
        <s:url var="index_url" value="/" />
        <!--navigator-->
        <div id="location" class="container-fluid">
            <div class="container">
                <p><span class="glyphicon glyphicon-home">&nbsp;</span><a href="${index_url}">Research Bank </a>&gt; Research Profile &gt; ${fullName}</p>
            </div>
        </div>
        <main>
        <div class="container-fluid">
                <h3 class="text-center well" >Research Profile</h3>
        </div>
            <div class="container">
                <div class="col-md-4" id="colLeft" style="height: 100vh;">
                    <s:url var="userImg_url" value="/Resources/img/user1.png" />
                    <div class="well text-center" id="profile"> 
                        <div class="image-filler">
                            <img src="${userImg_url}" width="100" height="100">
                        </div>
                        <h4>${fullName}</h4>
                        <p>${staff.designation}</p>
                    </div>
                </div>
                 
                    <div class="col-md-8" id="colRight" style="height: 100%;">
                    <c:forEach var="researchOutputs" items="${documents}" varStatus="status">
                        <s:url var="docDetails_url" value="/docHandle">
                            <s:param name="documentId" value="${researchOutputs.document_id}" />
                        </s:url>
                        <c:if test="${researchOutputs.title eq 'null'}">
                            <div class="alert alert-warning text-center">No Research Papers found</div>
                        </c:if>
                    <div class="well row">
                        <a href="${docDetails_url}"><h4>${researchOutputs.title}</h4></a>
                        <p>${researchOutputs.citation}</p>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </main>
            <!-- footer-->
        <jsp:include page="include/footer.jsp" />
                <s:url var="researchbank_script" value="/Resources/js/researchBank.js" />
        <!--JQuery CDN-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- JS for Bootstrap-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
