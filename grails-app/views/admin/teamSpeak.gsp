<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 5/18/2014
  Time: 1:34 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>TeamSpeak</title>
    <meta name="layout" content="blank"/>
</head>

<body>

<button class="btn btn-primary" id="restartTS3">Restart TS Bot</button>

<script type="text/javascript">
    (function($){
        $('#restartTS3').on('click', function(){
            $.getJSON('${g.createLink(controller: 'admin', action: 'ajaxRestartTS3ChatBot')}',{}).success(function(result){
                alert('TeamSpeak Chat Bot restarted!');
            });
        });
    })(jQuery);
</script>

</body>
</html>