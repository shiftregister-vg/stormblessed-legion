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


<g:each in="${thread.posts}" var="post" status="i">
    <forum:post post="${post}" />
</g:each>

</body>
</html>
