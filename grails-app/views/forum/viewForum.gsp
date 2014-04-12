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
        <table class="table table-striped">
            <g:each in="${forum.threads}" var="thread">
                <tr>
                    <td>
                        <g:link controller="forum" action="viewThread" params="${[threadSlug: thread.slug]}">
                            ${trhead.name}
                        </g:link>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</div>

</body>
</html>
