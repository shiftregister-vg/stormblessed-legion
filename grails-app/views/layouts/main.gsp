<!DOCTYPE html>
<html lang="en">
<head>
    <title><g:layoutTitle default="Home"/> - Invicta</title>
    <r:require modules="custom-bootstrap"/>
    <r:layoutResources/>
</head>
<body>

<div class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Invicta</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="${params.controller == 'forum' ? 'active' : ''}">
                    <g:link controller="forum" action="index">Forums</g:link>
                </li>
            </ul>
        </div>
    </div>
</div>

<g:layoutBody/>
<r:layoutResources/>
</body>
</html>
