<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>购物平台</title>

    <jsp:include page="include/common.jsp"/>

</head>

<body class="smoothscroll enable-animation">
<!-- wrapper -->

<jsp:include page="include/head.jsp"/>

<div id="wrapper">
    <section class="page-header page-header-xs">
        <div class="container">
            <h1>用户注册</h1>
            <ol class="breadcrumb">
                <li><a href="/pc/pc/index">首页</a></li>
                <li>用户注册
                </li>
            </ol>
        </div>
    </section>
    <!-- /PAGE HEADER -->
    <!-- -->
    <section>
        <div class="container">
            <div class="row">
                <!-- LEFT TEXT -->
                <div class="col-md-5 col-md-offset-1">
                    <img class="img-responsive"
                         src="${pageContext.request.contextPath}/resources/pc/assets/images/shop/login-png.png">
                </div>
                <!-- /LEFT TEXT -->
                <!-- LOGIN -->
                <div class="col-md-4">
                    <h2 class="size-16">用户注册</h2>

                    <!-- login form -->
                    <form id="registerForm" action="<%=request.getContextPath()%>/index/registerpost.jsp"
                          method="post" autocomplete="off" novalidate="novalidate">
                        <div class="clearfix">
                            <!-- ALERT -->
                            <div id="error" class="alert alert-mini alert-danger margin-bottom-30"
                                 style="display: none">
                                <strong>手机验证码错误!</strong>
                            </div>
                            <!-- /ALERT -->
                            <div id="message" style="display: none"></div>

                            <!-- mobile -->
                            <div class="form-group">
                                <input id="userName" name="userName" placeholder="手机号码" class="form-control"
                                       type="text" value="" maxlength="11">

                            </div>
                            <!-- 验证码 -->
                            <div class="form-group">
                                <input id="smsCode" name="smsCode" placeholder="请输入手机验证码" class="form-control"
                                       type="text" value="" maxlength="6">

                            </div>
                            <!-- Password -->
                            <div class="form-group">
                                <input id="pwd" name="pwd" placeholder="密码" class="form-control" type="password"
                                       value="" maxlength="20">

                            </div>
                            <!-- Password -->
                            <div class="form-group">
                                <input id="confirmPassword" name="confirmPassword" placeholder="确认密码"
                                       class="form-control" type="password" value="" maxlength="20">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-6">
                                <!-- Inform Tip -->
                                <div class="form-tip pt-20">
                                    <button id="smsBtn" class="btn btn-info noradius" type="button">发送手机验证码
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                                <button id="registerBtn" class="btn btn-primary noradius" type="button">注册</button>
                            </div>
                        </div>
                        <div>
                            <a href="/pc/pc/login">立即登录</a>
                        </div>
                        <input type="hidden" name="fromAPI" class="form-control" value="0">
                    </form>
                    <!-- /login form -->

                </div>
                <!-- /LOGIN -->
            </div>
        </div>
    </section>
    <!-- / -->

    <jsp:include page="include/footer.jsp"/>

</div>
<!-- /wrapper -->
<!-- JAVASCRIPT FILES -->
<input type="hidden" id="btnFlag">

<script type="text/javascript">
    var validate
    $(document)
        .ready(
            function () {
                var p1 = {name: "taizhi", age: 18};
                // class Person{School name;int age}; Person p1=new Person("taizhi",18);
                var abc = {
                    onsubmit: false,
                    focusInvalid: false,
                    errorClass: "error",
                    onfocusout: false,
                    onkeyup: false,
                    onclick: false,
                    ignoreTitle: true,
                    rules: {
                        userName: {
                            required: true,
                            maxlength: 11,
                            isMobile: true
                        },
                        smsCode: {
                            required: function (element) {
                                return ($('#btnFlag').val() === "1");
                            },
                            maxlength: 6
                        },
                        pwd: {
                            required: function (element) {
                                return ($('#btnFlag').val() === "1");
                            },
                            maxlength: 20
                        },
                        confirmPassword: {
                            required: function (element) {
                                return ($('#btnFlag').val() === "1");
                            },
                            maxlength: 20,
                            equalTo: "#pwd"
                        },
                    },
                    messages: {
                        userName: {
                            required: "请输入手机号码！",
                            maxlength: "手机号码不能超过11位！",
                            isMobile: "请正确填写您的手机号码"
                        },
                        smsCode: {
                            required: "请输入手机验证码！",
                            maxlength: "手机验证码必须是6位！"
                        },
                        pwd: {
                            required: "请输入密码！",
                            maxlength: "密码不能超过20位！"
                        },
                        confirmPassword: {
                            required: "请输入确认密码！",
                            maxlength: "确认密码不能超过20位！",
                            equalTo: "密码与确认密码不一致！"
                        }
                    }
                };
                validate = $("#registerForm").validate(abc);

                alert(abc.rules.userName.required);
                jQuery.validator
                    .addMethod(
                        "isMobile",
                        function (value, element) {
                            var length = value.length;
                            var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                            return this.optional(element) || (length === 11 && mobile
                                .test(value));
                        }, "请正确填写您的手机号码");
            });
    /**
     * 发送手机验证码
     */
    $("#smsBtn")
        .bind(
            'click',
            function () {
                $('span[class="error"]').remove();

                $('#btnFlag').val("0");
                if ($("#registerForm").valid() === false) {
                    return;
                }
                ;
                var params = {};
                params.userName = $("[name=userName]").val();
                $
                    .ajax({
                        type: "POST",
                        url: "/pc/pc/sendSmsMsg?=",
                        data: params,
                        dataType: "json", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
                        async: false,
                        success: function (json) {
                            var smsMessage = "";
                            if (json.errorCode === '0') {
                                smsMessage = "您的手机验证码：" + json.data;
                            } else if (json.errorCode === '-2') {
                                smsMessage = "您已注册，请登录!"
                            }
                            $("#message").show();
                            $("#message").html(
                                "<strong>" + smsMessage + "</strong>");
                        },
                        error: function (json) {
                            alert(json);
                        }
                    });
            });
    /**
     * 发送手机验证码
     */
    $("#registerBtn").bind('click',
        function () {

            if ($("#registerForm").valid() == false) {
                return;
            }
            ;
            $('#registerForm').attr("action", "<%=request.getContextPath()%>/index/register?=")
            $('#registerForm').submit();
        });
</script>


</body>
</html>
