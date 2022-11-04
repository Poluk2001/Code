<%@page pageEncoding="UTF-8" %>
<%@ page import="edu.jmi.shop.dao.ProductDAO" %>
<%@ page import="edu.jmi.shop.bean.Product" %>
<%@ page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<%--<jsp:include page="../priv.jsp"/>--%>

<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> list = productDAO.select();
    //JSTL不识别java遍变量，只能识别通过setAttribute方法存放的数据。
    //前面是标签，后面是数据
    request.setAttribute("list", list);

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

<div id="wrapper">
    <br>
    <div class="small-header transition">
        <div class="content">
            <div class="hpanel">

                <div id="error_div" class="text-left"></div>

                <div class="form-group col-lg-12">
                    <div class="text-right m-t-xs">
                        <!--事件处理 onClick-->
                        <button id="add" class="btn btn-success" type="button"
                                onClick="window.location='${pageContext.request.contextPath}/admin/product/productaddJSTL.jsp'">
                            <strong>添加</strong>
                        </button>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="content" style="margin-bottom:20px;">

        <div class="row">
            <div class="col-lg-12">
                <div class="hpanel">
                    <div class="panel-body">
                        <div id="productInfoList_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_length" id="productInfoList_length"><label> 显示 <select
                                            name="productInfoList_length" aria-controls="productInfoList"
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
                                    <table id="productInfoList" style="width: 100%;"
                                           class="table table-striped table-bordered table-hover dataTable no-footer"
                                           role="grid" aria-describedby="productInfoList_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 130.889px;">商品名
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 51.8889px;">商品类型
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 56.8889px;">店内价格
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 56.8889px;">市场价格
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 36.8889px;">数量
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 56.8889px;">热门商品
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 47.8889px;">状态
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 133.889px;">更新时间
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1"
                                                style="width: 43.8889px;">更新者
                                            </th>
                                            <th class="sorting_disabled" rowspan="1" colspan="1" style="width: 61px;">
                                                操作
                                            </th>
                                        </tr>

                                        </thead>
                                        <tbody>
                                        <c:forEach items="${list}" var="p">
                                            <tr>
                                                <td>${p.name}</td>
                                                <td>${p.categoryName}</td>
                                                <td>${p.shopPrice/100}</td>
                                                <td>${p.price/100}</td>
                                                <td>${p.quantity}</td>
                                                <td>
                                                    <c:if test="${p.hot==0}">
                                                        否
                                                    </c:if>
                                                    <c:if test="${p.hot==1}">
                                                        是
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:if test="${p.productStatus==0}">
                                                        已上架
                                                    </c:if>
                                                    <c:if test="${p.productStatus==1}">
                                                        未上架
                                                    </c:if>
                                                </td>
                                                <td>${p.updateTime}</td>
                                                <td>${p.updateUsername}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/product/productedit.jsp?id=">修改</a>
                                                    &nbsp;
                                                    <a href="${pageContext.request.contextPath}/admin/product/productdel.jsp?id=">删除</a>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
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
