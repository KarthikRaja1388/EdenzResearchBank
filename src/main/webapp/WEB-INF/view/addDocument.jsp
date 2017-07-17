<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="master_style" value="/Resources/css/master.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <title>Add Document - Edenz Research Manager</title>
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
            <div class="col-md-8 col-md-offset-2">
                <s:url var="saveDoc_url" value = "/admin/saveDocument" />
                <h3 class="text-center well">Add Document</h3>
                <f:form class="col-md-8 col-md-offset-2" action="${saveDoc_url}" method="post" modelAttribute="command">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <f:input path="title" class="form-control" id="title" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <f:textarea path="description" class="form-control" rows="6" />
                    </div>
                    <div class="form-group">
                        <label>Department</label>
                        <f:select path="department" name="department" class="form-control">
                            <f:option value="select department" />
                            <f:option value="Business" />
                            <f:option value="English" />
                            <f:option value="Technology" />
                        </f:select>
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputFile">File Upload</label>
                        <f:input path="document" type="file" id="fileUpload" />
                        <p class="help-block">Select files to upload</p>
                    </div>
                    <div class="form-group">
                        <label for="publishedOn">Published On</label>
                        <f:input path="published_on" type="date" class="form-control" id="publishedOn" />
                    </div>
                    <div class="form-group">
                        <label for="authors">Authors</label>
                        <f:input path="authors" type="text" class="form-control" id="authors" />
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary form-control">Submit</button>
                    </div>
                </f:form>
            </div>
        </div>


        <s:url var="mainJs" value="/Resources/js/script.js" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
