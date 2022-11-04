<%@ page import="edu.jmi.shop.dao.ProductDAO" %>
<%@ page import="edu.jmi.shop.bean.Product" %>
<%@page pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>购物平台</title>

    <jsp:include page="include/common.jsp"/>

</head>

<body class="smoothscroll enable-animation">

<%
    String sId = request.getParameter("id");
    int id = Integer.parseInt(sId);

    Cookie[] cookies = request.getCookies();
    boolean bFind = false;
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("browsehistory")) {
            String value = cookie.getValue();
            if (!value.contains(sId)) {
                Cookie co = new Cookie("browsehistory", sId + "-" + value);
                response.addCookie(co);
                break;
            }
            bFind = true;
        }
    }
    if (!bFind) {
        Cookie co = new Cookie("browsehistory", sId);
        response.addCookie(co);
    }

    ProductDAO productDao = new ProductDAO();
    Product product = productDao.select(sId);
%>

<!-- wrapper -->
<div id="wrapper">

    <jsp:include page="include/head.jsp"/>

    <section class="page-header page-header-xs">
        <div class="container">
            <h1><%=product.getName()%>
            </h1>
        </div>
    </section>
    <!-- /PAGE HEADER -->
    <!-- -->
    <section>
        <div class="container">
            <div class="row">
                <!-- RIGHT -->
                <div class="col-lg-9 col-md-9 col-sm-9">
                    <div class="row">
                        <!-- IMAGE -->
                        <div class="col-lg-6 col-sm-6">
                            <div class="thumbnail relative margin-bottom-3">
                                <figure id="zoom-primary" class="zoom" data-mode="mouseover">
                                    <div class="swiper-container swiper-container-horizontal" data-space-between="10">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide swiper-slide-active" style="width: 300px;">
                                                <img
                                                        src="<%=product.getDefaultImg()%>"
                                                        alt="">
                                            </div>
                                        </div>
                                        <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets">
                                            <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span
                                                class="swiper-pagination-bullet"></span><span
                                                class="swiper-pagination-bullet"></span></div>
                                    </div>
                                </figure>
                            </div>
                            <!-- Thumbnails (required height:100px) -->
                            <div data-for="zoom-primary" class="zoom-more owl-carousel owl-padding-3 featured"
                                 data-plugin-options="{&quot;singleItem&quot;: false, &quot;autoPlay&quot;: false, &quot;navigation&quot;: true, &quot;pagination&quot;: false}"></div>
                            <!-- /Thumbnails -->
                        </div>
                        <!-- /IMAGE -->
                        <!-- ITEM DESC -->
                        <div class="col-lg-6 col-sm-6">
                            <!-- buttons -->

                            <div class="pull-right">

                                <!-- replace data-item-id width the real item ID - used by js/view/demo.shop.js -->
                                <a class="btn btn-default add-wishlist sysBuilding" href="javascript:void(0);"
                                   onclick="addWishlist(this)" data-item-id="1" data-toggle="tooltip"
                                   title="添加收藏"><i class="fa fa-heart nopadding"></i><input name="productId"
                                                                                                type="hidden"
                                                                                                value="992"> </a>
                            </div>
                            <!-- /buttons -->
                            <!-- price -->
                            <div class="shop-item-price">
                                <span class="line-through nopadding-left"> 市场价:￥<span
                                        id="price"><%=product.getPrice() / 100.00%></span>
                                </span>￥<span id="shopPrice"><%=product.getShopPrice() / 100.00%></span>
                                <div id="id" style="float:right;margin-top:-60px;">
                                    <canvas width="96" height="96"></canvas>
                                </div>
                                <input id="submitPrice" type="hidden" value="<%=product.getShopPrice() / 100.00%>">
                                <input id="submitOptionValueKeyGroup" type="hidden">
                            </div>
                            <!-- /price -->
                            <hr>
                            <div class="clearfix margin-bottom-30">
                                <%if (product.getQuantity() > 0) {%>
                                <span id="inStock" style="" class="pull-right text-success"><i class="fa fa-check"></i>有货</span>
                                <%} else {%>
                                <span id="outOfStock" style="display: none;" class="pull-right text-danger"><i
                                        class="glyphicon glyphicon-remove"></i>无货</span>
                                <%}%>
                                <strong>商品简介:<%=product.getGeneralExplanin()%>
                                </strong>
                            </div>
                            <!-- short description -->
                            <p><%=product.getGeneralExplanin()%>
                            </p>
                            <!-- /short description -->
                            <!-- countdown -->

                            <!-- display option -->

                            <!-- /display option -->
                            <!-- /countdown -->
                            <!-- FORM -->
                            <div class="clearfix form-inline nomargin"></div>
                            <!-- /FORM -->
                            <hr>
                            <div class="row">
                                <div class="col-lg-4 col-sm-4" style="padding-top: 10px; text-align: right">购买数量:
                                </div>
                                <div class="col-lg-8 col-sm-8 quantityBox">
                                    <div class="input-group bootstrap-touchspin">
                                        <span class="input-group-btn">
                                            <button
                                                    class="btn btn-default bootstrap-touchspin-down"
                                                    type="button">-
                                            </button>
                                        </span>

                                        <span
                                                class="input-group-addon bootstrap-touchspin-prefix"
                                                style="display: none;">
                                        </span>

                                        <form action="buy.jsp" name="buyform" method="post">
                                            <input type="text"   name="number"  value="1" style="width: 50px; display: block;" class="form-control">
                                            <input type="hidden" name="productId" value="<%=product.getId()%>">
                                            <input type="hidden" name="shopPrice" value="<%=product.getShopPrice()%>">
                                            <input type="hidden" name="userId" value="123484">
                                        </form>
                                        <span
                                                class="input-group-addon bootstrap-touchspin-postfix"
                                                style="display: none;">
                                        </span>

                                        <span class="input-group-btn">
                                        <button
                                                class="btn btn-default bootstrap-touchspin-up"
                                                type="button">+
                                        </button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div style="text-align: center; margin-top: 20px">

                                <p class="padding-top-8">
                                    <button onclick="submit(1)"
                                            class="btn btn-warning product-add-cart sysBuilding noradius">
                                        加入购物车
                                    </button>
                                    <button onclick="submit(2)"
                                            class="btn btn-primary product-add-cart sysBuilding noradius">
                                        立即购买
                                    </button>
                                </p>
                            </div>
                        </div>
                        <!-- /ITEM DESC -->
                    </div>
                    <ul id="myTab" class="nav nav-tabs nav-top-border margin-top-80" role="tablist">
                        <li role="presentation" class="active"><a href="#description" role="tab"
                                                                  data-toggle="tab">商品描述</a></li>
                        <li role="presentation">
                            <a href="#reviews" role="tab" data-toggle="tab">商品评论 (0) </a></li>
                    </ul>
                    <div class="tab-content padding-top-20">
                        <!-- DESCRIPTION -->
                        <div role="tabpanel" class="tab-pane fade in active" id="description"><p>实用鱼竿，海上必备</p>
                        </div>
                        <!-- REVIEWS -->
                        <div role="tabpanel" class="tab-pane fade" id="reviews">
                            <!-- REVIEW ITEM -->

                            <!-- /REVIEW ITEM -->
                            <!-- REVIEW FORM -->
                            <h4 class="page-header margin-bottom-40">添加评论</h4>
                            <!-- Comment -->
                            <div class="margin-bottom-30">
                                <textarea name="content" id="text" class="form-control" rows="6" placeholder="评论内容"
                                          maxlength="1000"></textarea>
                            </div>
                            <!-- Stars -->
                            <div class="product-star-vote clearfix">
                                <label class="radio pull-left"> <input type="radio" name="stars"
                                                                       value="1"><i></i>1星</label>
                                <label class="radio pull-left"> <input type="radio" name="stars"
                                                                       value="2"><i></i>2星</label>
                                <label class="radio pull-left"> <input type="radio" name="stars"
                                                                       value="3"><i></i>3星</label>
                                <label class="radio pull-left"> <input type="radio" name="stars"
                                                                       value="4"><i></i>4星</label>
                                <label class="radio pull-left"> <input type="radio" name="stars"
                                                                       value="5"><i></i>5星</label>

                            </div>
                            <button onclick="addReviews()" type="button" class="btn btn-primary sysBuilding">
                                <i class="fa fa-check"></i>提交
                            </button>
                            <!-- Send Button -->
                            <!-- /REVIEW FORM -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / -->

    <jsp:include page="include/footer.jsp"/>

</div>
<!-- /wrapper -->
<!-- JAVASCRIPT FILES -->
<script src="/pc/resources/pc/assets/js/bootstrap.min.js"></script>
<script src="/pc/resources/pc/assets/js/bootstrap-touchspin-master/src/jquery.bootstrap-touchspin.js"></script>
<script src="/pc/resources/pc/assets/js/swiper.min.js"></script>
<script>
    function submit() {
        document.buyform.submit();
    }
</script>


</body>

</html>