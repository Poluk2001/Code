<%@page pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/metisMenu/dist/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/sparkline/index.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/scripts/homer.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/datatables/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/datatables_plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/scripts/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/sweetalert/lib/sweet-alert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/summernote/dist/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-validation/jquery.validate.js"></script>
<!-- 配置文件 -->
<script src="${pageContext.request.contextPath}/resources/admin/js/ueditor/ueditor.config.js"
        type="text/javascript"></script>
<!--　编辑器源码文件 -->
<script src="${pageContext.request.contextPath}/resources/admin/js/ueditor/ueditor.all.js"
        type="text/javascript"></script>
<!--　实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container', {
        autoWidth: true
    });
    ue.ready(function () {
        ue.setContent($("#explain").val());
    });
</script>