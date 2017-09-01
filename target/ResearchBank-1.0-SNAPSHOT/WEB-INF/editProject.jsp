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

        <s:url var="master_style" value="/Resources/css/masterManager.css" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link href="${master_style}" rel="stylesheet" type="text/css"/>

    </head>
    <body>
<!--TO DO Update -->
        <jsp:include page="include/menu.jsp" />
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2 " style="height:100%">
                <h3 class="text-center well">Edit Document</h3>
                <s:url var="updateProject_url" value="/admin/updateProjects" >
                    <s:param name="projectId" value="${project.project_id}" />
                </s:url>
                <c:if test="${param.act eq 'f'}">
                    <div class="well alert-warning">Failed to update</div>
                </c:if>

                    <f:form class="col-md-8 col-md-offset-2" action="${updateProject_url}" method="post" modelAttribute="project">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <f:input path="title"  class="form-control" id="title" />
                    </div>
                    <div class="form-group">
                        <label for="citation">Citation</label>
                        <f:textarea path="citation" class="form-control" id="citation" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <f:textarea path="description"  class="form-control" id="description" />
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
                        <label for="author_one">Author 1</label>
                        <f:input path="author_one" type="text" class="form-control" id="author_one" />
                    </div>
                    <div class="form-group">
                        <label for="author_two">Author 2</label>
                        <f:input path="author_two" type="text" class="form-control" id="author_two" />
                    </div>
                    <div class="form-group">
                        <label for="author_three">Author 3</label>
                        <f:input path="author_three" type="text" class="form-control" id="author_three" />
                    </div>
                    <div class="form-group">
                        <label for="author_four">Author 4</label>
                        <f:input path="author_four" type="text" class="form-control" id="author_four" />
                    </div>
                    <div class="form-group">
                        <label for="project_status">Department</label>
                        <f:select path="project_status" class="form-control" >
                            <f:option value="Current" />
                            <f:option value="Past" />
                        </f:select>
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
