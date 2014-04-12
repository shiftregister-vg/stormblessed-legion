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


<g:each in="${forumGroups}" var="group">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                ${group.name}
            </h4>
        </div>
        <div class="panel-body">
            <g:each in="${group.forums.sort {it.sortPosition}}" var="forum">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="content-box style5 small red animated fadeIn animatedVisi"
                             data-animtype="fadeInUp" data-animrepeat="0" data-animspeed="1.5s" data-animdelay="0.2s">
                            <h4 class="h4-body-title">
                                <i class="icon-comment"></i>
                                <g:link class="forum-link" controller="forum" action="viewForum" params="${[forumSlug: forum.slug]}">
                                    <strong>${forum.name}</strong>
                                </g:link>
                            </h4>
                        </div>
                    </div>
                </div>
            </g:each>
        </div>
    </div>
</g:each>


</body>
</html>
