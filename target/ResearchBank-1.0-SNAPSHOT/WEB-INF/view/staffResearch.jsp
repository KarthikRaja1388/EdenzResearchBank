
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

        <title>Staff Research - Edenz Research Bank</title>
    </head>

    <body>
        <jsp:include page="include/reserachBankNav.jsp" />
        <!--navigator-->
        <s:url var="index_url" value="/" />
        <div id="location" class="container-fluid">
            <div class="container">
                <p><span class="glyphicon glyphicon-home">&nbsp;</span><a href="${index_url}">Research Bank </a>&gt; Staff Research</p>
            </div>
        </div>
       
        <main style="height: 100%">
            <div class="container-fluid" id="profileWrapper" style="height: 100%">
                <h3 class=" text-center well">Our Staff</h3>
                <c:forEach var="staffs" items="${staffs}" varStatus="status">
                     <s:url var="researchProfile_url" value="/staffResearch/ResearchProfile" >
                        <s:param name="name" value="${staffs.first_name}, ${staffs.last_name}" />
                    </s:url>
                    <s:url var="userImg_url" value="/Resources/img/user1.png" />
                    <c:if test="${staffs.staff_status eq 'Active'}">
                    <div class="col-md-4 profile_container text-center">
                        <div class="well">
                            <div class="image-filler">
                                <img src="${userImg_url}" width="100" height="100">
                            </div>
                            <h4 class="text-center">${staffs.first_name} ${staffs.last_name}</h4>
                            <p class="text-center">${staffs.designation}</p>
                            <a href="${staffs.profile_url}" target="_blank">View Profile</a><br>
                            <a href="${researchProfile_url}">View Research Profile</a><br>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>
                
            </div>
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
