<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/4
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <!-- Meta tag Keywords -->
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>

    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link href="<%=ctxPath%>/src/res/css/style.css" media="all" rel="stylesheet" type="text/css">
<body>
<!--header-->
<div class="agileheader">
    <h1></h1>
</div>
<!--//header-->
<!--main-->
<div class="main-w3l">
    <div class="w3layouts-main">
        <h2>立即登录</h2>
        <%--        到达indexController--%>
        <form action="<%=ctxPath%>/login.do" method="post">

            <label>
                <input id="loginname" name="loginname" onfocus="this.value = '';" placeholder="请输入账号" required
                       type="text"
                       value=""/>
            </label>
            <label>
                <input id="password" name="password" onfocus="this.value = '';" required type="password"
                       value=""/>
            </label>
            <label>
                <input id="checkCode" name="checkCode" onfocus="this.value = '';" required type="text"
                       placeholder="验证码"/>
                <img id="change" name="change" onclick="checkCodes()" src="<%=ctxPath%>/KaptchaServlet">
            </label>
            <div class="clear" style="color: red">${msg}</div>
            <input name="login" type="submit" value="登 录">
        </form>
    </div>
</div>
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Version</b> 1.0.0
    </div>
    <strong>CRAETE TO 2019.12.4 Admin WUQILI.</strong> 保留所有权<br/><br/>
    <strong><a href="http://www.beian.miit.gov.cn/" style="color: #605ca8">黔ICP备20002057号</a> </strong>
</footer>
<script type="text/javascript">
    function checkCodes() {
        var idx = document.getElementById("change");
        idx.src = "<%=ctxPath%>/KaptchaServlet?time" + new Date().getTime();
    }
</script>
<!--//main-->
</body>
</html>
