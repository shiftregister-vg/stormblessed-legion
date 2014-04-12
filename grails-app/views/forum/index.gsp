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
    <g:render template="forumGroupPanel" model="${[group: group]}" />
</g:each>


</body>
</html>
