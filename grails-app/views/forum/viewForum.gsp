<%--
  User: steve
  Date: 4/10/14
  Time: 9:03 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${forum.name}</title>
    <meta name="layout" content="main"/>
</head>

<body>

<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">${forum.name}</h4>
    </div>
    <div class="panel-body">
        <sec:ifAnyGranted roles="ROLE_MEMBER">
            <div class="btn-group">
                <g:link class="btn btn-primary" controller="forum" action="createThread" params="${params}"
                        data-toggle="tooltip" data-placement="bottom" title="New Thread" data-container="body">
                    <i class="icon-plus"></i>
                </g:link>

                <g:link class="btn btn-default" controller="forum" action="markThreadAsRead" params="${params}"
                        data-toggle="tooltip" data-placement="bottom" title="Mark all as read" data-container="body">
                    <i class="icon-check"></i>
                </g:link>
            </div>
        </sec:ifAnyGranted>
        <table class="table table-striped">
            <g:each in="${forum.threads}" var="thread">
                <tr>
                    <td>
                        <g:link controller="forum" action="viewThread" params="${[threadSlug: thread.slug, forumSlug: params.forumSlug]}">
                            ${thread.name}
                        </g:link>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</div>

</body>
</html>
