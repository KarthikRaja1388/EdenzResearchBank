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
        <title>Edit Document - Edenz Research Bank Manager</title>

        <s:url var="master_style" value="/Resources/css/master.css" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="container-fluid" id="titleContainer">
            <div class="row" id="titleInfo">
                <h3 class="text-left col-md-6">Research Bank Manager</h3>
                <div class="col-md-6" id="userInfo"><p class="pull-right">Super User</p></div>
            </div>
        </div>
        <jsp:include page="include/menu.jsp" />
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2 ">
            <h3 class="text-center well">Edit Document</h3>
            <s:url var="updateDocument_url" value="/admin/updateDocument" >
                <s:param name="document" value="${document_id}" />
            </s:url>
            <p>${update_error}</p>

            <f:form class="col-md-8 col-md-offset-2" action="${updateDocument_url}" method="post" modelAttribute="document" >
                <div class="form-group">
                    <label for="title">Title</label>
                    <f:input path="title"  class="form-control" id="title" />
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <f:input path="description"  class="form-control" id="description" />
                </div>
                <div class="form-group">
                    <label for="department">Department</label>
                    <f:select path="department" class="form-control" >
                        <f:option value="select Department" />
                        <f:option value="English" />
                        <f:option value="Business" />
                        <f:option value="Film" />
                        <f:option value="Digital Media" />
                        <f:option value="Health" />
                        <f:option value="Technology" />
                    </f:select>
                </div>
                <div class="form-group">
                    <label for="date">Published on</label>
                    <f:input type="date" path="published_on" class="form-control" id="date" />
                </div>
                <div class="form-group">
                    <label for="authors">Authors</label>
                    <f:input path="authors" class="form-control" id="authors" />
                </div>
                <div class="form-group">
                    <label for="document">Document</label>
                    <f:input path="document" class="form-control" id="document" />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary form-control">Submit</button>
                </div>
            </f:form>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
