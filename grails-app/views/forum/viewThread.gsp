<%--
  User: steve
  Date: 4/10/14
  Time: 9:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${thread.name}</title>
    <meta name="layout" content="main"/>
</head>

<body>


<g:each in="${thread.posts.sort{ it.dateCreated }}" var="post" status="i">
    <forum:post post="${post}" />
</g:each>

<div class="row">
    <div class="col-md-offset-2 col-md-10">
        <div class="divider divider-shadow"></div>
    </div>
</div>

<sec:ifAnyGranted roles="ROLE_MEMBER">
    <h4>Reply</h4>
    <g:form role="form" controller="forum" action="addPostToThread" params="${params}" class="form-wrapper">
        <div class="form-group clearfix">
            <label class="control-label" for="postMarkdown">Message *</label>
            <div class="col-xs-10">
                <g:textArea name="postMarkdown" class="form-control" required="required"></g:textArea>
            </div>
        </div>

        <div class="form-group clearfix">
            <label class="control-label"></label>
            <div class="col-xs-10">
                <button class="btn btn-primary">Post Reply</button>
            </div>
        </div>
    </g:form>
</sec:ifAnyGranted>


</body>
</html>
