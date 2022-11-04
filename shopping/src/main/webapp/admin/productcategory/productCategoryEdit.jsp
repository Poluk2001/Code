<%@ page import="java.sql.*" %>
<%@page pageEncoding="UTF-8" %>
<%--<%@include file="../priv.jsp" %>--%>

<%
    String sId = request.getParameter("id");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/shopping?serverTimezone=UTC", "root", "123456");
    String sql = "select * from product_category where id=?";
    PreparedStatement pst = c.prepareStatement(sql);
    pst.setString(1, sId);
    ResultSet rsProduct = pst.executeQuery();
    if (rsProduct.next() == false) {
        response.sendRedirect("productCategoryAdd.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商城后台</title>
    <jsp:include page="../../commonCss.jsp"/>
    <jsp:include page="../../commonJs.jsp"/>
</head>
<body class="blank">
<jsp:include page="../main/top.jsp"/>
<jsp:include page="../main/left.jsp"/>

<div id="wrapper" style="min-height: 684px;">
    <div class="small-header transition">
        <div class="content">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="row">
                        <div class="hpanel">
                            <div id="error_div" class="text-left">

                            </div>
                            <form id="form_productCategory" name="form_productCategory"
                                  action="<%=request.getContextPath()%>/admin/productcategory/productCategoryEditPost.jsp"
                                  method="POST"
                                  novalidate="novalidate">
                                <input type="hidden" id="id" name="id" value="">
                                <div class="form-group col-lg-12">
                                    <label>商品类别名</label>
                                    <input type="hidden" id="nameOld" value="<%=sId%>">
                                    <input type="text" id="name" name="name" class="form-control" maxlength="50"
                                           placeholder="商品类别名"
                                           value="<%=rsProduct.getString("name")%>">

                                </div>
                                <div class="form-group col-lg-12">
                                    <label>排序</label>
                                    <input type="text" id="sortOrder" name="sortOrder" class="form-control"
                                           maxlength="50" placeholder="排序"
                                           value="<%=rsProduct.getString("sort_order")%>">
                                </div>

                                <div class="form-group col-lg-12">
                                    <label>描述</label>
                                    <textarea rows="3" cols="20" id="description"
                                              name="description" class="form-control"
                                              maxlength="2000"><%=rsProduct.getString("description")%></textarea>
                                    <input type="hidden" id="descriptionName"
                                           value="">
                                </div>

                                <div class="form-group col-lg-12">
                                    <label>更新日期</label>
                                    <input type="text" id="updateTime" readonly="readonly" name="updateTime"
                                           class="form-control" maxlength="50"
                                           value="<%=rsProduct.getString("update_time")%>">
                                </div>

                                <div class="form-group col-lg-12">
                                    <label>更新者</label>
                                    <input type="text" id="updateUserName" readonly="readonly" name="updateUserName"
                                           class="form-control" maxlength="50"
                                           value="<%=rsProduct.getString("update_user_id")%>">
                                </div>

                                <div class="text-left m-t-xs">
                                    <button id="saveProductInfo" class="btn btn-success"
                                            style="margin-right: 5px;margin-top: 5px" type="submit">
                                        <strong>保存</strong>
                                    </button>


                                    <button id="back" class="btn btn-success"
                                            style="margin-right: 5px;margin-top: 5px" type="button"
                                            onclick="window.history.go(-1);">
                                        <strong>返回</strong>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
