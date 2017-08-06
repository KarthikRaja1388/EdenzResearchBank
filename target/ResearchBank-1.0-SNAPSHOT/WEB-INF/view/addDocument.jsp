<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <s:url var="master_style" value="/Resources/css/masterManager.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>
        <title>Add Document - Edenz Research Manager</title>
    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2">
                <s:url var="saveDoc_url" value = "/admin/saveDocument" />
                <s:url var="upload_url" value="/admin/upload" />
                <h3 class="text-center well">Add Document</h3>
                <f:form class="col-md-8 col-md-offset-2" action="${saveDoc_url}"  method="post" modelAttribute="command">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <f:input path="title" class="form-control" id="title" />
                    </div>
                    <div class="form-group">
                        <label for="citation">Citation</label>
                        <f:textarea path="citation" class="form-control" id="citation" />
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
                        <label for="publishedOn">Published On</label>
                        <f:input path="published_on" type="date" class="form-control" id="publishedOn" />
                    </div>
                    <div class="form-group">
                        <label for="author_one">Author 1</label>
                        <f:input path="author_one" type="text" class="form-control" id="author_one" placeholder="Firstname, Lastname;"/>
                    </div>
                    <div class="form-group">
                        <label for="author_two">Author 2</label>
                        <f:input path="author_two" type="text" class="form-control" id="author_two" placeholder="Firstname, Lastname;"/>
                    </div>
                    <div class="form-group">
                        <label for="author_three">Author 3</label>
                        <f:input path="author_three" type="text" class="form-control" id="author_three" placeholder="Firstname, Lastname;"/>
                    </div>
                    <div class="form-group">
                        <label for="author_four">Author 4</label>
                        <f:input path="author_four" type="text" class="form-control" id="author_four" placeholder="Firstname, Lastname"/>
                    </div>
                    <div class="form-group">
                        <label for="keywords">Keywords</label>
                        <f:input path="keywords" type="text" class="form-control" id="keywords" />
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
