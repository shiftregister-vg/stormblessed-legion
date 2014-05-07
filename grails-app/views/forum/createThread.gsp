<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 4/13/2014
  Time: 1:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create New Thread</title>
    <meta name="layout" content="main"/>
</head>

<body>

<g:form controller="forum" action="saveThread" params="${[forumSlug: params.forumSlug]}" class="form-wrapper" useToken="true">
    <div class="form-group clearfix">
        <label class="control-label" for="threadName">Subject *</label>

        <div class="col-xs-10">
            <g:textField name="threadName" class="form-control" required="required" value="${thread?.name}"/>
        </div>
    </div>

    <div class="form-group clearfix">
        <label class="control-label" for="postMarkdown">Body *</label>

        <div class="col-xs-10">
            <g:textArea name="postMarkdown" class="form-control" required="required">${post?.markdown}</g:textArea>
        </div>
    </div>

    <div class="form-group clearfix">
        <label class="control-label"></label>

        <div class="col-xs-10">
            <button class="btn btn-primary" type="submit">Post Thread</button>
        </div>
    </div>
</g:form>

</body>
</html>
