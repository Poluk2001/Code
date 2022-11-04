<%@ page import="java.sql.*" %>
<%@page pageEncoding="UTF-8" %>
<%@include file="../priv.jsp" %>

<%--分页效果代码--%>
<%--1.获取当前页码--%>
<%
    int pageIndex = 1;
    String s = request.getParameter("pageIndex");
    if (s != null) {
        pageIndex = Integer.parseInt(s);
    }
%>

<%--2.获取记录数量--%>
<%
    int recordCount = 0;
    Connection c = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");

        String sqlCount = "select count(*) as reccount from product";
        PreparedStatement pstCount = c.prepareStatement(sqlCount);
        ResultSet rsCount = pstCount.executeQuery();
        rsCount.next();
        recordCount = rsCount.getInt("reccount");
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>

<%--3.计算分页信息--%>
<%
    final int recCountInPage = 10;
    int pageCount = 0;
    int start = 0;
    int end = 0;

    pageCount = recordCount / recCountInPage;
    pageCount += (recordCount % recCountInPage == 0 ? 0 : 1);
    start = (pageIndex - 1) * recCountInPage + 1;
    end = pageIndex * recCountInPage;
    end = Math.min(end, recordCount);

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

    <%--编辑按钮--%>
    <script>
        function editproduct(id) {
            swal({
                title: "确定修改吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#62cb31",
                confirmButtonText: "修改",
                cancelButtonText: "取消",
            }, function () {
                window.location = "<%=request.getContextPath()%>/admin/product/productedit.jsp?id=" + id;
            });
        }
    </script>
    <%--删除按钮--%>
    <script>
        function delproduct(id) {
            swal({
                title: "确定删除吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#62cb31",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
            }, function () {
                window.location = "<%=request.getContextPath()%>/admin/product/productdel.jsp?id=" + id;
            });
        }
    </script>
</head>
<body class="blank">
<jsp:include page="../main/top.jsp"/>
<jsp:include page="../main/left.jsp"/>

<div id="wrapper">
    <div class="panel-body">
        <!-- 每个页面的功能模块填写在这里 -->
        <div class="small-header transition">
            <div class="content">
                <div class="hpanel">

                    <div id="error_div" class="text-left"></div>

                    <div class="form-group col-lg-12">
                        <h3>欢迎使用购物平台后台管理功能</h3>
                        <div class="text-right m-t-xs">
                            <button id="add" class="btn btn-success" type="button"
                                    onclick="window.location='<%=request.getContextPath()%>/admin/product/productadd.jsp'">
                                <strong>添加</strong>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hpanel">
                        <div class="panel-body">
                            <div id="productInfoList_wrapper"
                                 class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_length" id="productInfoList_length"><label> 显示
                                            <select name="productInfoList_length" aria-controls="productInfoList"
                                                    class="form-control input-sm">
                                                <option value="10">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select> 项结果 </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6"></div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <table id="productInfoList" style="width: 100%;"
                                               class="table table-striped table-bordered table-hover dataTable no-footer"
                                               role="grid" aria-describedby="productInfoList_info">

                                            <thead>
                                            <tr role="row">
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 35px;">
                                                    商品名
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 10px;">
                                                    商品分类
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 10px;">
                                                    店内价格
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 10px;">
                                                    市场价格
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 10px;">
                                                    数量
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 15px;">
                                                    热门商品
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 16px;">
                                                    状态
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 25px;">
                                                    更新时间
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width: 10px;">
                                                    更新者
                                                </th>
                                                <th class="sorting_disabled" rowspan="1" colspan="1"
                                                    style="width:30px;">
                                                    操作
                                                </th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <%--4.分页查询--%>
                                            <%
                                                try {
                                                    String sql = ("select product.*,product_category.name as category_name,user.user_name from product\n" +
                                                            "left join product_category on product.category_id=product_category.id\n" +
                                                            "left join user on product.update_user_id=user.id\n" +
                                                            "order by product.id desc limit " + (start - 1) + " , " + recCountInPage);

                                                    PreparedStatement pst = c.prepareStatement(sql);
                                                    ResultSet rs = pst.executeQuery();%>

                                            <%--5.显示记录--%>
                                            <% while (rs.next()) {%>
                                            <tr>
                                                <td><%=rs.getString("name")%>
                                                </td>
                                                <td><%=rs.getString("category_name")%>
                                                </td>
                                                <td><%=rs.getDouble("shop_price") / 100 %>
                                                </td>
                                                <td><%=rs.getDouble("price") / 100 %>
                                                </td>
                                                <td><%=rs.getInt("quantity")%>
                                                </td>
                                                <td>
                                                    <%
                                                        if (rs.getInt("hot") == 0) {
                                                    %>否<%
                                                } else {
                                                %>是<%
                                                    }
                                                %>
                                                </td>
                                                <td>
                                                    <%
                                                        if (rs.getInt("product_status") == 0) {
                                                    %>已上架<%
                                                } else {
                                                %>已下架<%
                                                    }
                                                %>
                                                </td>
                                                <td><%=rs.getString("update_time")%>
                                                </td>
                                                <td><%=rs.getString("user_name")%>
                                                </td>

                                                <td>
                                                    <button id="delete" class=" btn btn-default btn-sm"
                                                            onclick="editproduct(<%=rs.getInt("id")%>)">
                                                        <i class="fa fa-pencil"></i>修改
                                                    </button>

                                                    <%--  <a class="fa fa-pencil" href="productedit.jsp?id=<%=rs.getString("id")%>">修改</a>&nbsp;--%>

                                                    <button id="delete" class=" btn btn-default btn-sm"
                                                            onclick="delproduct(<%=rs.getInt("id")%>)">
                                                        <i class="fa fa-pencil"></i>删除
                                                    </button>
                                                </td>
                                            <tr>
                                                <%
                                                        }
                                                    } catch (Exception ignored) {

                                                    }
                                                %>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <div id="productInfoList_processing" class="dataTables_processing"
                                             style="display: none;"> 处理中...
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_info" id="productInfoList_info" role="status"
                                             aria-live="polite"> 显示第<%=start%>至<%=end%>项结果，共<%=recordCount%>项
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="dataTables_paginate paging_simple_numbers"
                                             id="productInfoList_paginate">
                                            <ul class="pagination">

                                                <%--首页和上页--%>
                                                <%if (pageIndex == 1) {%>
                                                <li class="paginate_button previous disabled"
                                                    aria-controls="productInfoList" tabindex="0"
                                                    id="productInfoList_previous"><a href="#"> 首页 </a></li>
                                                <li class="paginate_button active" aria-controls="productInfoList"
                                                    tabindex="0"><a href="#">上页</a></li>
                                                <%} else {%>
                                                <li class="paginate_button " aria-controls="productInfoList"
                                                    tabindex="0"><a href="productlist.jsp?pageIndex=1">首页</a></li>
                                                <li class="paginate_button " aria-controls="productInfoList"
                                                    tabindex="0"><a
                                                        href="productlist.jsp?pageIndex=<%=pageIndex-1%>">上页</a></li>
                                                <%}%>

                                                <%--下页和末页--%>
                                                <%if (pageIndex == pageCount) {%>
                                                <li class="paginate_button previous disabled"
                                                    aria-controls="productInfoList" tabindex="0"
                                                    id="productInfoList_previous"><a href="#"> 下页 </a></li>
                                                <li class="paginate_button active" aria-controls="productInfoList"
                                                    tabindex="0"><a href="#">末页</a></li>
                                                <%} else {%>
                                                <li class="paginate_button " aria-controls="productInfoList"
                                                    tabindex="0"><a
                                                        href="productlist.jsp?pageIndex=<%=pageIndex+1%>">下页</a></li>
                                                <li class="paginate_button " aria-controls="productInfoList"
                                                    tabindex="0"><a
                                                        href="productlist.jsp?pageIndex=<%=pageCount%>">末页</a></li>
                                                <%}%>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
