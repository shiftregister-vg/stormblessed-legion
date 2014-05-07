<%--
  User: steve
  Date: 5/6/14
  Time: 9:32 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register New Account</title>
    <meta name="layout" content="main"/>
</head>

<body>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Register</h3>
    </div>
    <div class="panel-body">
        <g:form controller="user" action="saveRegistration" useToken="true" role="form" class="form-horizontal">
            <form:textField name="username" label="Username" />
            <form:textField name="email" label="Email" />
            <form:passwordField name="password" label="Password" />
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <g:submitButton name="Submit Registration" class="btn btn-primary" />
                </div>
            </div>
        </g:form>
    </div>
</div>

</body>
</html>
