<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 6/28/2014
  Time: 8:38 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<h1>You may now close this window.</h1>
<script>
    var event = new Event('success');
    event.code = '${code}';
    window.dispatchEvent(event);
</script>
</body>
</html>