<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Registration</title>
</head>

<body>

<h1>${registration?.user?.username?.toUpperCase()}, thanks for registering at the <g:link controller="site" action="index" absolute="true">${grailsApplication.config.grails.siteName}</g:link> site!</h1>
<p>Please use the following link to verify your email address.</p>
<p>
    <g:link controller="user" action="verifyRegistration" params="${[token: registration?.token]}" absolute="true">
        ${createLink(controller: 'user', action: 'verifyRegistration', params: [token: registration?.token], absolute: true)}
    </g:link>
</p>

</body>
</html>
