<%@ page import="edu.jmi.shop.dao.ProductDAO" %>
<%@ page import="edu.jmi.shop.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.jmi.shop.dao.ProductCategoryDAO" %>
<%@ page import="edu.jmi.shop.bean.ProductCategory" %>
<%@page isELIgnored="false" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>购物平台</title>

    <jsp:include page="include/common.jsp"></jsp:include>

<body class="smoothscroll enable-animation">
<!-- wrapper -->
<div id="wrapper">
    <jsp:include page="include/head.jsp"></jsp:include>
    <section>
        <div class="container">
            <div id='page'></div>
            <div class='row'>
                <div
                        class='col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3'>
                    <div class="divider divider-border divider-center">
                        <!-- divider -->
                        <i class="fa fa-users"></i>
                    </div>
                    <ul class="shop-item-list row list-inline nomargin">
                        <%
                            ProductDAO productDAO = new ProductDAO();
                            List<Product> list = productDAO.select();
                            for (Product product : list) {
                        %>
                        <!-- 产品-->
                        <li class="col-lg-3 col-sm-3">
                            <div class="shop-item">
                                <div class="thumbnail">
                                    <!-- product image(s) -->
                                    <a class="shop-item-image"
                                       href="<%=request.getContextPath()%>/index/product.jsp?id=<%=product.getId()%>">
                                        <img class="img-responsive"
                                             src="<%=product.getDefaultImg()%>" />
                                    </a>
                                    <!-- /product image(s) -->

                                    <!-- product more info -->
                                    <div class="shop-item-info"></div>
                                    <!-- /product more info -->
                                </div>
                                <div class="shop-item-summary text-center">
                                    <h2><%=product.getName()%></h2>
                                    <!-- price -->
                                    <div class="shop-item-price">
                                        <span class="line-through">￥<%=product.getPrice()/100%></span>￥<%=product.getShopPrice()/100%>
                                    </div>
                                    <!-- /price -->
                                </div>
                                <!-- /buttons -->
                            </div>
                        </li>
                        <%
                            }
                        %>
                        <!-- /产品 -->

                    </ul>

                    <hr />
                    <!-- Pagination Default -->
                    <div name="bootpagFooter" class="text-center"></div>
                    <!-- /Pagination Default -->
                </div>

                <div
                        class="col-lg-3 col-md-3 col-sm-3 col-lg-pull-9 col-md-pull-9 col-sm-pull-9">

                    <!-- CATEGORIES -->
                    <div class="side-nav margin-bottom-60">
                        <div class="side-nav-head">
                            <button class="fa fa-bars"></button>
                            <h4>分类</h4>
                        </div>
                        <ul class="list-group list-group-bordered list-group-noicon uppercase">
                            <%
                                ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
                                List<ProductCategory> list2 = productCategoryDAO.selectAll();
                                for (ProductCategory productCategory : list2) {
                            %>
                            <li class="list-group-item">
                                <a href="/pc/pc/category/58/page/1">
                                    <span class="size-11 text-muted pull-right"></span>
                                </a>
                                <%=productCategory.getName()%>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </div>

                    <!-- /CATEGORIES -->

                </div>

            </div>

        </div>

    </section>

    <jsp:include page="include/footer.jsp"></jsp:include>


    <div style="position:fixed;top:200px;z-index:1000;right:5px;width:180px;">
        <div class="margin-bottom-60">
            <h2 class="owl-featured">浏览记录</h2>
            <div class="">
                <div>
                    <!-- SLIDE -->
                    <ul class="list-unstyled nomargin nopadding text-left">
                        <%


                        %>

                        <li class="clearfix">

                        </li>

                        <!-- /item -->
                    </ul>
                </div>
                <!-- /SLIDE -->
            </div>
        </div>
        <!-- /FEATURED -->
    </div>
</body>
</html>