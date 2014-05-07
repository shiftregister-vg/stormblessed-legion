<%--
  User: steve
  Date: 5/6/14
  Time: 9:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Thanks for registering!</title>
    <meta name="layout" content="main"/>
</head>

<body>

<p><strong>${registration.user.username.toUpperCase()}</strong>, you should receive an email at ${registration.user.email} shortly to complete your registration.</p>

</body>
</html>
