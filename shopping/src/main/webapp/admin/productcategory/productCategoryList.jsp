<%@ page import="java.sql.*" %>
<%@page pageEncoding="UTF-8" %>

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

        String sqlCount = "select count(*) as reccount from product_category";
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
                window.location = "<%=request.getContextPath()%>/admin/productcategory/productCategoryEdit.jsp?id=" + id;
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
                window.location = "<%=request.getContextPath()%>/admin/productcategory/productCategoryDel.jsp?id=" + id;
            });
        }
    </script>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<jsp:include page="../main/left.jsp"/>
<div id="wrapper" style="min-height: 684px;">
    <div class="small-header transition">
        <div class="content" style="padding-top:1px;padding-bottom:1px;">

            <div class="text-right m-t-xs" style="padding-top:1px;padding-bottom:1px;">
                <button id="add" class="btn btn-success" style="margin-right: 5px;margin-top: 5px" type="button"
                        onclick="window.location='<%=request.getContextPath()%>/admin/productcategory/productCategoryAdd.jsp'">
                    <strong>添加商品分类</strong>
                </button>
            </div>
        </div>

    </div>
    <div class="content">
        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-body">
                        <div id="productCategoryList_wrapper"
                             class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_length" id="productCategoryList_length"><label> 显示 <select
                                            name="productCategoryList_length" aria-controls="productCategoryList"
                                            class="form-control input-sm">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select> 项结果 </label></div>
                                </div>
                                <div class="col-sm-6"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="productCategoryList" style="width: 100%;"
                                           class="table table-striped table-bordered table-hover dataTable no-footer"
                                           role="grid" aria-describedby="productCategoryList_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 20px;">
                                                商品类别名
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 211px;">
                                                描述
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 57px;">
                                                更新日期
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 52px;">
                                                更新者
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 63px;">
                                                操作
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <%
                                            try {
                                                Class.forName("com.mysql.cj.jdbc.Driver");
                                                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");
                                                String sql = ("select product_category.*,user.user_name from product_category\n" +
                                                        "inner join user on product_category.update_user_id = user.id\n" +
                                                        "order by product_category.id limit " + (start - 1) + " , " + recCountInPage);
                                                PreparedStatement pst = c.prepareStatement(sql);
                                                ResultSet rs = pst.executeQuery();

                                                while (rs.next()) {%>
                                        <tr>
                                            <td><%=rs.getString("name")%>
                                            </td>
                                            <td><%=rs.getString("description")%>
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
                                                } catch (Exception ex) {
                                                    ex.printStackTrace();
                                                }
                                            %>
                                        </tr>

                                        </tbody>
                                    </table>

                                    <div id="productCategoryList_processing" class="dataTables_processing"
                                         style="display: none;"> 处理中...
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="productCategoryList_info" role="status"
                                         aria-live="polite"> 显示第<%=start%>至<%=end%>项结果，共<%=recordCount%>项
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="dataTables_paginate paging_simple_numbers"
                                         id="productCategoryList_paginate">
                                        <ul class="pagination">
                                            <%--上页--%>
                                            <%if (pageIndex == 1) {%>
                                            <li class="paginate_button active" aria-controls="productInfoList"
                                                tabindex="0"><a href="#">上页</a></li>
                                            <%} else {%>
                                            <li class="paginate_button " aria-controls="productInfoList"
                                                tabindex="0"><a
                                                    href="productCategoryList.jsp?pageIndex=<%=pageIndex-1%>">上页</a>
                                            </li>
                                            <%}%>

                                            <%--下页--%>
                                            <%if (pageIndex == pageCount) {%>
                                            <li class="paginate_button previous disabled"
                                                aria-controls="productInfoList" tabindex="0"
                                                id="productInfoList_previous"><a href="#"> 下页 </a></li>
                                            <%} else {%>
                                            <li class="paginate_button " aria-controls="productInfoList"
                                                tabindex="0"><a
                                                    href="productCategoryList.jsp?pageIndex=<%=pageIndex+1%>">下页</a>
                                            </li>
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
</body>
</html>
