<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 5/18/2014
  Time: 1:34 AM
--%>

<%@ page import="com.stormblessedlegion.voip.Ts3Service" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>TeamSpeak</title>
    <meta name="layout" content="blank"/>
</head>

<body>

<div class="row">
    <div class="col-md-12">
        <div class="alert alert-${Ts3Service.CONNECTED ? 'success' : 'danger'}">
            Status: <strong id="ts3Status">${Ts3Service.CONNECTED ? 'Connected' : 'Disconnected'}</strong>
        </div>
    </div>
</div>

<div id="ts3-btn-row" class="row">
    <div class="col-md-12">
        <button class="ts3-btn btn btn-primary ${Ts3Service.CONNECTED ? 'disabled' : ''}" id="startTS3">
            <span class="fa fa-play"></span>
            Start TS Bot
        </button>

        <button class="ts3-btn btn btn-danger ${Ts3Service.CONNECTED ? '' : 'disabled'}" id="stopTS3">
            <span class="fa fa-stop"></span>
            Stop TS Bot
        </button>
    </div>
</div>

<script type="text/javascript">
    var stormblessed = stormblessed || {};
    (function($){
        stormblessed.ts3 = {
            stopIconSpin: function() {
                $('.ts3-btn').children('span.fa').removeClass('fa-spin');
            }
        };

        $('#startTS3').on('click', function(){
            $.getJSON('${g.createLink(controller: 'admin', action: 'ajaxStartTS3ChatBot')}',{}).success(function(result){
                $('#stopTS3').removeClass('disabled');
                var $ts3Status = $('#ts3Status');
                $ts3Status.html('Connected');
                $ts3Status.parents('.alert').removeClass('alert-danger').addClass('alert-success');
                stormblessed.ts3.stopIconSpin();
            });
        });

        $('#stopTS3').on('click', function(){
            $.getJSON('${g.createLink(controller: 'admin', action: 'ajaxStopTS3ChatBot')}',{}).success(function(result){
                $('#startTS3').removeClass('disabled');
                var $ts3Status = $('#ts3Status');
                $ts3Status.html('Disconnected');
                $ts3Status.parents('.alert').removeClass('alert-success').addClass('alert-danger');
                stormblessed.ts3.stopIconSpin();
            });
        });

        $('.ts3-btn').on('click', function(){
            $(this).addClass('disabled');
            $(this).children('span.fa').addClass('fa-spin');
        });
    })(jQuery);
</script>

</body>
</html>