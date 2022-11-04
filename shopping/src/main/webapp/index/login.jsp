<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>购物平台</title>

    <jsp:include page="include/common.jsp"/>

</head>

<body class="smoothscroll enable-animation">

<div id="wrapper">

    <jsp:include page="include/head.jsp"/>

    <section class="page-header page-header-xs">
        <div class="container">
            <h1>用户登录</h1>

            <ol class="breadcrumb">
                <li><a href="/pc/pc/index">首页</a></li>
                <li>登录</li>
            </ol>
        </div>
    </section>

    <section>
        <div class="container">

            <div class="row">

                <!-- 左边的图片 -->
                <div class="col-md-5 col-md-offset-1">
                    <img class="img-responsive"
                         src="${pageContext.request.contextPath}/resources/pc/assets/images/shop/login-png.png"
                         alt="">
                </div>
                <!-- /左边的图片 -->

                <!-- 左边的登录form -->
                <form id="infoForm" method="post" novalidate="novalidate"
                      action="<%=request.getContextPath()%>/index/loginpost.jsp">
                    <div class="col-md-4">

                        <h2 class="size-16">登录</h2>

                        <div style="color:red"></div>
                        <!-- login form -->

                        <div class="clearfix">

                            <!-- ALERT -->
                            <div class="alert alert-mini alert-danger margin-bottom-30" style="display: none">
                                <strong>手机验证码错误!</strong>
                            </div>
                            <!-- /ALERT -->
                            <div id="message" style="display: none">
                            </div>

                            <!-- 手机号 -->
                            <div class="form-group">
                                <input type="text" name="userName" class="form-control" placeholder="手机号码"
                                       required="" aria-required="true">

                            </div>

                            <!-- 密码 -->
                            <div class="form-group">
                                <input type="password" name="pwd" class="form-control" placeholder="密码" required=""
                                       aria-required="true">

                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6 col-sm-6 col-xs-6">

                            </div>

                            <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                                <button type="submit" id="perform" class="btn btn-primary noradius">登录</button>
                            </div>

                        </div>

                        <div>
                            <a href="<%=request.getContextPath()%>/index/forget_password.jsp">忘记密码</a> <a href="<%=request.getContextPath()%>/index/register.jsp">注册新用户</a>
                        </div>
                    </div>
                </form>
                <!-- /左边的登录form -->

            </div>

        </div>

    </section>

    <input type="hidden" id="btnFlag">

    <jsp:include page="include/footer.jsp"/>

</div>


<!-- javascript部分 -->
<script src="<%=request.getContextPath()%>/resources/pc/assets/js/jquery.validate.js"></script>


<script type="text/javascript">
    let validate;
    $(document).ready(function () {
        validate = $("#infoForm").validate({
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
                }
            },
            messages: {
                userName: {
                    required: "请输入手机号码！",
                    maxlength: "手机号码不能超过11位！",
                    isMobile: "请正确填写您的手机号码"
                },
                pwd: {
                    required: "请输入密码！",
                    maxlength: "密码不能超过20位！"
                }
            }
        });
        jQuery.validator.addMethod("isMobile", function (value, element) {
            const length = value.length;
            const mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
            return this.optional(element) || (length === 11 && mobile.test(value));
        }, "请正确填写您的手机号码");
    });

    $("#perform").bind('click', function () {
        $('#btnFlag').val("1");
        if ($("#infoForm").valid() === false) {
            return;
        }
        $('#infoForm').attr("action", "<%=request.getContextPath()%>/index/login")
        $('#infoForm').submit();
    });
</script>

</body>
</html>
