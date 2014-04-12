<%--
  User: steve
  Date: 4/10/14
  Time: 7:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Forums</title>
    <meta name="layout" content="main"/>
</head>
<body>

<div class="page-header">
    <div class="container">
        <h1>Forums</h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <g:each in="${forumGroups}" var="group">
                <h4>
                    ${group.name}
                </h4>
                <table class="table table-striped">
                    <g:each in="${group.forums}" var="forum">
                        <tr>
                            <td>
                                <g:link controller="forum" action="viewForum" params="${[forumSlug: forum.slug]}">${forum.name}</g:link>
                            </td>
                        </tr>
                    </g:each>
                </table>
            </g:each>
        </div>
    </div>
</div>

</body>
</html>
