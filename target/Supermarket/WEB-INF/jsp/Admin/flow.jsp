<%--
  Created by IntelliJ IDEA.
  User: 28309
  Date: 2020/3/20
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <title>流量统计表</title>

    <link rel="stylesheet" type="text/css" href="<%=ctxPath%>/src/res/css/sweetalert.css">
    <script type="text/javascript" src="<%=ctxPath%>/src/res/js/sweetalert-dev.js"></script>

    <!-- 告诉浏览器响应屏幕宽度 -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link href="<%=ctxPath%>/src/res/css/bootsrap.min.css" rel="stylesheet">
    <!-- 象形异体字 -->
    <link href="<%=ctxPath%>/src/res/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- 主题风格 -->
    <link href="<%=ctxPath%>/src/res/css/Admin.min.css" rel="stylesheet">
    <!-- 皮肤 -->
    <link href="<%=ctxPath%>/src/res/css/_all-skins.min.css" rel="stylesheet">
    <!--谷歌字体 -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"
          rel="stylesheet">
    <!--导入vue.js有网的时候推荐-->
    <script charset="UTF-8" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script type="text/javascript" src="<%=ctxPath%>/src/res/js/echarts.min.js"></script>
    <!--没网的时候-->
    <!--script src="<%=ctxPath%>/src/res/js/vue.js" type="text/javascript" charset="UTF-8"></script-->
    <style type="text/css">
        #mian-components {
            text-align: center;

        }

        .btn-default {
            margin-top: 10px;

            margin-right: 35px;
        }

        .table {
            text-align: center;
        }

        .table-mess {
            width: 300px;
            text-align: center;
        }

        .system-mess {
            width: 600px;
            text-align: center;
        }

        body {
            text-align: center;
        }

        h1 {
            font-size: 25px;
            text-align: center;
        }

        .zhuce {
            font-size: 14px;
            text-align: center;
            width: 840px;
            margin: 0 auto;
            background: #f7f7f7;
        }

        .zhuce td {
            border: 1px solid rgb(0, 0, 0);
            padding: 2px 3px;
        }

        .zhuce .ibg {
            text-align: left;
        }

        .zhuce .bbg {
            padding: 10px 0;
            font-size: 13px;
        }

        #bt {
            width: 100px;
            height: 35px;
            background: #99ffcc;
        }

        my-tr {
            height: 300px;
        }
    </style>

</head>

<body class="hold-transition skin-blue sidebar-mini">

<%
    String flag = (String) request.getAttribute("flag");
    if (flag == "1") {%>
<script>
    swal("添加成功！", "信息已全部添加到数据库！", "success");
</script>
<%}%>
<%
    if (flag == "0") {%>
<script>
    swal("添加失败！", "未知错误！", "error");
</script>
<%}%>

<% if (flag == "4") {%>
<script>
    swal("修改成功！", "数据已更新！", "success");
</script>
<%}%>
<%
    if (flag == "5") {%>
<script>
    swal("修改失败！", "未知错误！", "error");
</script>
<%}%>


<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a class="logo" href="#">
            <!-- 迷你标志为侧栏迷你50x50像素 -->
            <span class="logo-mini"><b>L</b>B</span>
            <!-- 常规状态和移动设备的徽标 -->
            <span class="logo-lg">启立智能超市系统</span>
        </a>
        <!-- 标题导航栏:样式可以在Header .less中找到 -->
        <nav class="navbar navbar-static-top">
            <!-- 侧边栏切换按钮-->
            <a class="sidebar-toggle" data-toggle="push-menu" href="#" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- 用户帐号:风格可以在dropdown.less中找到 -->
                    <li class="dropdown user user-menu">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="hidden-xs">噬魂</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <br>
                                <br>
                                <p>
                                    启立 - web开发人员
                                    <small>2019.12.4</small>
                                </p>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown user user-menu">
                        <a class="dropdown-toggle"  href="<%=ctxPath%>/destory_Servlet.do">
                            <span class="hidden-xs">退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 左列。包含徽标和边栏 -->
    <aside class="main-sidebar">

        <!-- 侧栏:style可以在sidebar.less中找到 -->
        <section class="sidebar">
            <!-- 侧边栏用户面板 -->
            <div class="user-panel">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" id="bar-1"><a href="<%=ctxPath%>/queryStaff.do">所有员工</a></li>
                    <li role="presentation" id="bar-2"><a href="<%=ctxPath%>/queryTrade.do">所有商品</a></li>
                    <li role="presentation" id="bar-3"><a href="<%=ctxPath%>/queryRecord.do?flag=0">消费记录</a></li>
                    <li role="presentation" id="bar-4"><a href="<%=ctxPath%>/Admin/addchecker.do">添加员工</a></li>
                    <li role="presentation" id="bar-5"><a href="<%=ctxPath%>/Admin/addtrade.do">添加商品</a></li>
                </ul>
            </div>
            <!-- 侧栏菜单::style可以在sidebar.less中找到-->
        </section>
        <!-- /.侧边栏描述 -->
    </aside>
    <!-- 内容包装器。包含页面内容 -->
    <div class="content-wrapper">
        <div id="main" style="width: 600px;height:400px;"></div>
    </div>
    <!-- /.主要内容 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>CRAETE TO 2019.12.4 Admin WUQILI.</strong> 保留所有权<br/><br/>
        <strong><a href="http://www.beian.miit.gov.cn/" style="color: #605ca8">黔ICP备20002057号</a> </strong>
    </footer>

    <!-- ./包装器 -->
    <!-- jQuery 3 -->
    <script src="<%=ctxPath%>/src/res/js/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<%=ctxPath%>/src/res/js/bootstrap.min.js"></script>
    <!-- 侧栏打开/关闭代码 -->
    <script src="<%=ctxPath%>/src/res/js/adminllkxl.min.js"></script>
</div>
<script type="text/javascript">
    function showChart(){
        $.ajax({
            "url" : "<%=ctxPath%>/flow",
            "type" : "get",
            "dataType" : "json",
            "success" : function (json) {

                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '请求流量分析统计'
                    },
                    tooltip: {},
                    legend: {
                        data:['访问量']
                    },
                    xAxis: {
                        data: json.timeList
                    },
                    yAxis: {},
                    series: [{
                        name: '访问量',
                        type: 'bar',
                        data: json.valueList
                    }]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        });
    }
    window.setInterval("showChart()",1000);
</script>
</body>
</html>
