<%@ page import="java.sql.*" %>
<%@ page import="edu.jmi.shop.dao.ProductDAO" %>
<%@ page import="edu.jmi.shop.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.jmi.shop.dao.ProductCategoryDAO" %>
<%@ page import="edu.jmi.shop.bean.ProductCategory" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<%--<%@include file="../priv.jsp"%>--%>

<%
    String sId = request.getParameter("id");
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.select(sId);
    request.setAttribute("product", product);


    ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
    List<ProductCategory> list = productCategoryDAO.selectAll();
    request.setAttribute("categoryList", list);

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
    <div class="panel-body">
        <!-- 每个页面的功能模块填写在这里 -->
        <div class="content animate-panel" style="">
            <div class="hpanel" style="">
                <div class="panel-body" style="">
                    <div class="hpanel" style="">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a id="liProduct" data-toggle="tab" href="#tab-1">商品信息</a>
                            </li>
                        </ul>
                        <div class="tab-content" style="">
                            <div id="tab-1" class="tab-pane active" style="">
                                <form id="form_productInfo" name="form_productInfo"
                                      action="<%=request.getContextPath()%>/admin/product/producteditpost.jsp"
                                      method="POST" novalidate="novalidate" style="">
                                    <input type="hidden" id="parameterName" value="_csrf">
                                    <input type="hidden" id="token" value="0418ccd2-9861-4db2-ba80-58f3e36ec876">
                                    <div class="row" style="padding: 20px;">
                                        <div class="row animated-panel zoomIn" style="animation-delay: 0.1s;">
                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.2s;">
                                                <label>商品名称</label>
                                                <input id="id" name="id" type="hidden" value="${product.id}">
                                                <input name="name" class="form-control" type="text"
                                                       placeholder="商品名称" value="${product.name}">
                                            </div>
                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.2s;">
                                                <label>所属分类</label>
                                                <select id="categoryId" name="categoryId" class="form-control">
                                                    <c:forEach items="${categoryList}" var="category">
                                                        <option
                                                                <c:if test="">
                                                                    selected
                                                                </c:if>
                                                                value="${category.id}">${category.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row animated-panel zoomIn" style="animation-delay: 0.3s;">
                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.4s;">
                                                <label>市场价格</label>
                                                <input name="price" class="form-control" type="text"
                                                       placeholder="市场价格" value="${product.price}">
                                            </div>

                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.4s;">
                                                <label>店内价格</label>
                                                <input name="shopPrice" class="form-control" type="text"
                                                       placeholder="店内价格"
                                                       value="${product.shopPrice}">
                                            </div>
                                        </div>

                                        <div class="row animated-panel zoomIn" style="animation-delay: 0.5s;">
                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.5s;">
                                                <label>商品库存</label>
                                                <input name="quantity" class="form-control" type="text"
                                                       placeholder="商品库存"
                                                       value="${product.quantity}">
                                            </div>

                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.6s;">
                                                <label>状态</label>
                                                <select name="productStatus" class="form-control">
                                                    <option value="0"
                                                            <c:if test="${product.productStatus == 0}">
                                                                selected
                                                            </c:if>
                                                    >上架
                                                    </option>

                                                    <option value="1"
                                                            <c:if test="${product.productStatus == 1}">
                                                                selected
                                                            </c:if>
                                                    >下架
                                                    </option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row animated-panel zoomIn" style="animation-delay: 0.7s;">
                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.7s;">
                                                <label>是否热销</label>
                                                <div>
                                                    <label>
                                                        <input type="radio" value="0" name="hot"
                                                        <c:if test="${product.hot == 0}">
                                                               checked=""
                                                        </c:if>
                                                        >&nbsp;&nbsp;非热门商品</label>&nbsp;&nbsp;
                                                    <label class="">

                                                        <input type="radio" value="1" name="hot"
                                                        <c:if test="${product.hot == 1}">
                                                               checked=""
                                                        </c:if>
                                                        >&nbsp;&nbsp;热门商品</label>
                                                </div>
                                            </div>

                                            <div class="form-group col-lg-6 animated-panel zoomIn"
                                                 style="animation-delay: 0.8s;">
                                                <label>商品概要说明</label>
                                                <input name="generalExplain" class="form-control" type="text"
                                                       placeholder="商品概要说明"
                                                       value="${product.generalExplanin}">
                                            </div>
                                        </div>

                                        <div class="form-group col-lg-12 animated-panel zoomIn"
                                             style="animation-delay: 0.9s;">
                                            <input type="hidden" id="explain" name="explain" value="">
                                            <label class="control-label">商品说明</label>
                                            <div style="width: auto; height: auto;">
                                                <div id="container" class="edui-default" style="">
                                                    <div id="edui1" class="edui-editor  edui-default"
                                                         style="width: 800px; z-index: 999;">
                                                        <div id="edui1_toolbarbox"
                                                             class="edui-editor-toolbarbox edui-default" style="">
                                                            <div id="edui1_toolbarboxouter"
                                                                 class="edui-editor-toolbarboxouter edui-default">
                                                                <div class="edui-editor-toolbarboxinner edui-default">
                                                                    <div id="edui2" class="edui-toolbar   edui-default"
                                                                         onselectstart="return false;"
                                                                         onmousedown="return $EDITORUI[&quot;edui2&quot;]._onMouseDown(event, this);"
                                                                         style="user-select: none;">
                                                                        <div id="edui3"
                                                                             class="edui-box edui-button edui-for-fullscreen edui-default">
                                                                            <div id="edui3_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui3&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui3_body"
                                                                                         unselectable="on" title="全屏"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui3&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui3&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui4"
                                                                             class="edui-box edui-button edui-for-source edui-default">
                                                                            <div id="edui4_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui4&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui4&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui4&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui4&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui4_body"
                                                                                         unselectable="on"
                                                                                         title="源代码"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui4&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui4&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui5"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui6"
                                                                             class="edui-box edui-button edui-for-undo edui-default">
                                                                            <div id="edui6_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui6&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui6&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui6&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui6&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui6_body"
                                                                                         unselectable="on" title="撤销"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui6&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui6&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui7"
                                                                             class="edui-box edui-button edui-for-redo edui-default">
                                                                            <div id="edui7_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui7&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui7&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui7&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui7&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui7_body"
                                                                                         unselectable="on" title="重做"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui7&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui7&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui8"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui9"
                                                                             class="edui-box edui-button edui-for-bold edui-default">
                                                                            <div id="edui9_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui9&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui9&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui9&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui9&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui9_body"
                                                                                         unselectable="on" title="加粗"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui9&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui9&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui10"
                                                                             class="edui-box edui-button edui-for-italic edui-default">
                                                                            <div id="edui10_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui10&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui10&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui10&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui10&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui10_body"
                                                                                         unselectable="on" title="斜体"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui10&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui10&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui11"
                                                                             class="edui-box edui-button edui-for-underline edui-default">
                                                                            <div id="edui11_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui11&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui11&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui11&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui11&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui11_body"
                                                                                         unselectable="on"
                                                                                         title="下划线"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui11&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui11&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui12"
                                                                             class="edui-box edui-button edui-for-fontborder edui-default">
                                                                            <div id="edui12_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui12&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui12&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui12&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui12&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui12_body"
                                                                                         unselectable="on"
                                                                                         title="字符边框"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui12&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui12&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui13"
                                                                             class="edui-box edui-button edui-for-strikethrough edui-default">
                                                                            <div id="edui13_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui13&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui13&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui13&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui13&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui13_body"
                                                                                         unselectable="on"
                                                                                         title="删除线"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui13&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui13&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui14"
                                                                             class="edui-box edui-button edui-for-formatmatch edui-default">
                                                                            <div id="edui14_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui14&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui14&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui14&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui14&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui14_body"
                                                                                         unselectable="on"
                                                                                         title="格式刷"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui14&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui14&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui15"
                                                                             class="edui-box edui-button edui-for-pasteplain edui-default">
                                                                            <div id="edui15_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui15&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui15&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui15&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui15&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui15_body"
                                                                                         unselectable="on"
                                                                                         title="纯文本粘贴模式"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui15&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui15&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui16"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui17"
                                                                             class="edui-box edui-splitbutton edui-for-forecolor edui-default edui-colorbutton">
                                                                            <div title="字体颜色" id="edui17_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui17&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-splitbutton-body edui-default">
                                                                                    <div id="edui17_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui17&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div id="edui17_colorlump"
                                                                                             class="edui-colorlump"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui17&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui20"
                                                                             class="edui-box edui-splitbutton edui-for-backcolor edui-default edui-colorbutton">
                                                                            <div title="背景色" id="edui20_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui20&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui20&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui20&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui20&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-splitbutton-body edui-default">
                                                                                    <div id="edui20_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui20&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div id="edui20_colorlump"
                                                                                             class="edui-colorlump"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui20&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui23"
                                                                             class="edui-box edui-menubutton edui-for-insertorderedlist edui-default">
                                                                            <div title="有序列表" id="edui23_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui23&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui23&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui23&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui23&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-menubutton-body edui-default">
                                                                                    <div id="edui23_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui23&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui23&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui36"
                                                                             class="edui-box edui-menubutton edui-for-insertunorderedlist edui-default">
                                                                            <div title="无序列表" id="edui36_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui36&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-menubutton-body edui-default">
                                                                                    <div id="edui36_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui36&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui36&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui43"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui44"
                                                                             class="edui-box edui-menubutton edui-for-rowspacingtop edui-default">
                                                                            <div title="段前距" id="edui44_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui44&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui44&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui44&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui44&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-menubutton-body edui-default">
                                                                                    <div id="edui44_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui44&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui44&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui51"
                                                                             class="edui-box edui-menubutton edui-for-rowspacingbottom edui-default">
                                                                            <div title="段后距" id="edui51_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui51&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui51&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui51&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui51&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-menubutton-body edui-default">
                                                                                    <div id="edui51_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui51&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui51&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui58"
                                                                             class="edui-box edui-menubutton edui-for-lineheight edui-default">
                                                                            <div title="行间距" id="edui58_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui58&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui58&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui58&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui58&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-menubutton-body edui-default">
                                                                                    <div id="edui58_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui58&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui58&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui67"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui68"
                                                                             class="edui-box edui-combox edui-for-fontfamily edui-default">
                                                                            <div title="字体" id="edui68_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui68&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui68&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui68&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui68&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-combox-body edui-default">
                                                                                    <div id="edui68_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui68&quot;]._onButtonClick(event, this);">
                                                                                        arial
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui68&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui81"
                                                                             class="edui-box edui-combox edui-for-fontsize edui-default">
                                                                            <div title="字号" id="edui81_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui81&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui81&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui81&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui81&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-combox-body edui-default">
                                                                                    <div id="edui81_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui81&quot;]._onButtonClick(event, this);">
                                                                                        16px
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui81&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui92"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui93"
                                                                             class="edui-box edui-button edui-for-justifyleft edui-default">
                                                                            <div id="edui93_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui93&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui93&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui93&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui93&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-checked">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui93_body"
                                                                                         unselectable="on"
                                                                                         title="居左对齐"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui93&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui93&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui94"
                                                                             class="edui-box edui-button edui-for-justifycenter edui-default">
                                                                            <div id="edui94_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui94&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui94&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui94&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui94&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui94_body"
                                                                                         unselectable="on"
                                                                                         title="居中对齐"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui94&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui94&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui95"
                                                                             class="edui-box edui-button edui-for-justifyright edui-default">
                                                                            <div id="edui95_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui95&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui95&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui95&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui95&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui95_body"
                                                                                         unselectable="on"
                                                                                         title="居右对齐"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui95&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui95&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui96"
                                                                             class="edui-box edui-button edui-for-justifyjustify edui-default">
                                                                            <div id="edui96_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui96&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui96&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui96&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui96&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui96_body"
                                                                                         unselectable="on"
                                                                                         title="两端对齐"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui96&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui96&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui97"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui98"
                                                                             class="edui-box edui-button edui-for-simpleupload edui-default">
                                                                            <div id="edui98_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui98&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui98&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui98&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui98&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui98_body"
                                                                                         unselectable="on"
                                                                                         title="单图上传"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui98&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui98&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default">
                                                                                            <iframe style="display: block; width: 800px; height: 20px; overflow: hidden; border: 0px; margin: 0px; padding: 0px; position: absolute; top: 0px; left: 0px; opacity: 0; cursor: pointer;"></iframe>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui99"
                                                                             class="edui-box edui-splitbutton edui-for-emotion edui-default">
                                                                            <div title="表情" id="edui99_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui99&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui99&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui99&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui99&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-splitbutton-body edui-default">
                                                                                    <div id="edui99_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui99&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui99&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui107"
                                                                             class="edui-box edui-button edui-for-template edui-default">
                                                                            <div id="edui107_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui107&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui107&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui107&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui107&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui107_body"
                                                                                         unselectable="on" title="模板"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui107&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui107&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui108"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui109"
                                                                             class="edui-box edui-splitbutton edui-for-inserttable edui-default">
                                                                            <div title="插入表格" id="edui109_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui109&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui109&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui109&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui109&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-splitbutton-body edui-default">
                                                                                    <div id="edui109_button_body"
                                                                                         class="edui-box edui-button-body edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui109&quot;]._onButtonClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                    <div class="edui-box edui-splitborder edui-default"></div>
                                                                                    <div class="edui-box edui-arrow edui-default"
                                                                                         onclick="$EDITORUI[&quot;edui109&quot;]._onArrowClick();"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui112"
                                                                             class="edui-box edui-button edui-for-deletetable edui-default">
                                                                            <div id="edui112_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui112&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui112&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui112&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui112&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui112_body"
                                                                                         unselectable="on"
                                                                                         title="删除表格"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui112&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui112&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui113"
                                                                             class="edui-box edui-button edui-for-insertparagraphbeforetable edui-default">
                                                                            <div id="edui113_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui113&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui113&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui113&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui113&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui113_body"
                                                                                         unselectable="on"
                                                                                         title="表格前插入行"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui113&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui113&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui114"
                                                                             class="edui-box edui-button edui-for-insertrow edui-default">
                                                                            <div id="edui114_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui114&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui114&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui114&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui114&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui114_body"
                                                                                         unselectable="on"
                                                                                         title="前插入行"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui114&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui114&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui115"
                                                                             class="edui-box edui-button edui-for-deleterow edui-default">
                                                                            <div id="edui115_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui115&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui115&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui115&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui115&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui115_body"
                                                                                         unselectable="on"
                                                                                         title="删除行"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui115&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui115&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui116"
                                                                             class="edui-box edui-button edui-for-insertcol edui-default">
                                                                            <div id="edui116_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui116&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui116&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui116&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui116&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui116_body"
                                                                                         unselectable="on"
                                                                                         title="前插入列"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui116&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui116&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui117"
                                                                             class="edui-box edui-button edui-for-deletecol edui-default">
                                                                            <div id="edui117_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui117&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui117&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui117&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui117&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui117_body"
                                                                                         unselectable="on"
                                                                                         title="删除列"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui117&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui117&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui118"
                                                                             class="edui-box edui-button edui-for-mergecells edui-default">
                                                                            <div id="edui118_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui118&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui118&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui118&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui118&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui118_body"
                                                                                         unselectable="on"
                                                                                         title="合并多个单元格"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui118&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui118&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui119"
                                                                             class="edui-box edui-button edui-for-mergeright edui-default">
                                                                            <div id="edui119_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui119&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui119&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui119&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui119&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui119_body"
                                                                                         unselectable="on"
                                                                                         title="右合并单元格"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui119&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui119&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui120"
                                                                             class="edui-box edui-button edui-for-mergedown edui-default">
                                                                            <div id="edui120_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui120&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui120&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui120&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui120&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui120_body"
                                                                                         unselectable="on"
                                                                                         title="下合并单元格"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui120&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui120&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui121"
                                                                             class="edui-box edui-button edui-for-splittocells edui-default">
                                                                            <div id="edui121_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui121&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui121&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui121&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui121&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui121_body"
                                                                                         unselectable="on"
                                                                                         title="完全拆分单元格"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui121&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui121&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui122"
                                                                             class="edui-box edui-button edui-for-splittorows edui-default">
                                                                            <div id="edui122_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui122&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui122&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui122&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui122&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui122_body"
                                                                                         unselectable="on"
                                                                                         title="拆分成行"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui122&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui122&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui123"
                                                                             class="edui-box edui-button edui-for-splittocols edui-default">
                                                                            <div id="edui123_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui123&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui123&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui123&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui123&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default edui-state-disabled">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui123_body"
                                                                                         unselectable="on"
                                                                                         title="拆分成列"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui123&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui123&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui124"
                                                                             class="edui-box edui-separator  edui-default"></div>
                                                                        <div id="edui127"
                                                                             class="edui-box edui-button edui-for-preview edui-default">
                                                                            <div id="edui127_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui127&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui127&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui127&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui127&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui127_body"
                                                                                         unselectable="on" title="预览"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui127&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui127&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="edui130"
                                                                             class="edui-box edui-button edui-for-searchreplace edui-default">
                                                                            <div id="edui130_state"
                                                                                 onmousedown="$EDITORUI[&quot;edui130&quot;].Stateful_onMouseDown(event, this);"
                                                                                 onmouseup="$EDITORUI[&quot;edui130&quot;].Stateful_onMouseUp(event, this);"
                                                                                 onmouseover="$EDITORUI[&quot;edui130&quot;].Stateful_onMouseOver(event, this);"
                                                                                 onmouseout="$EDITORUI[&quot;edui130&quot;].Stateful_onMouseOut(event, this);"
                                                                                 class="edui-default">
                                                                                <div class="edui-button-wrap edui-default">
                                                                                    <div id="edui130_body"
                                                                                         unselectable="on"
                                                                                         title="查询替换"
                                                                                         class="edui-button-body edui-default"
                                                                                         onmousedown="return $EDITORUI[&quot;edui130&quot;]._onMouseDown(event, this);"
                                                                                         onclick="return $EDITORUI[&quot;edui130&quot;]._onClick(event, this);">
                                                                                        <div class="edui-box edui-icon edui-default"></div>
                                                                                        <div class="edui-box edui-label edui-default"></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="edui1_toolbarmsg"
                                                                 class="edui-editor-toolbarmsg edui-default"
                                                                 style="display:none;">
                                                                <div id="edui1_upload_dialog"
                                                                     class="edui-editor-toolbarmsg-upload edui-default"
                                                                     onclick="$EDITORUI[&quot;edui1&quot;].showWordImageDialog();">
                                                                    点击上传
                                                                </div>
                                                                <div class="edui-editor-toolbarmsg-close edui-default"
                                                                     onclick="$EDITORUI[&quot;edui1&quot;].hideToolbarMsg();">
                                                                    x
                                                                </div>
                                                                <div id="edui1_toolbarmsg_label"
                                                                     class="edui-editor-toolbarmsg-label edui-default"></div>
                                                                <div style="height:0;overflow:hidden;clear:both;"
                                                                     class="edui-default"></div>
                                                            </div>
                                                            <div id="edui1_message_holder"
                                                                 class="edui-editor-messageholder edui-default"
                                                                 style="top: 58px; z-index: 1000;"></div>
                                                        </div>
                                                        <div id="edui1_iframeholder"
                                                             class="edui-editor-iframeholder edui-default"
                                                             style="width: 800px; height: 320px; z-index: 999; overflow: hidden;">
                                                            <iframe id="ueditor_0" width="100%" height="100%"
                                                                    frameborder="0"
                                                                    src="javascript:void(function(){document.open();document.write(&quot;<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml' class='view' ><head><style type='text/css'>.view{padding:0;word-wrap:break-word;cursor:text;height:90%;}
body{margin:8px;font-family:sans-serif;font-size:16px;}p{margin:5px 0;}</style><link rel='stylesheet' type='text/css' href='http://120.27.151.49:8080/Shopping/resources/admin/js/ueditor/themes/iframe.css'/></head><body class='view' ></body><script type='text/javascript'  id='_initialScript'>setTimeout(function(){editor = window.parent.UE.instants['ueditorInstant0'];editor._setup(document);},0);var _tmpScript = document.getElementById('_initialScript');_tmpScript.parentNode.removeChild(_tmpScript);</script></html>&quot;);document.close();}())"></iframe>
                                                        </div>
                                                        <div id="edui1_bottombar"
                                                             class="edui-editor-bottomContainer edui-default">
                                                            <table class="edui-default">
                                                                <tbody class="edui-default">
                                                                <tr class="edui-default">
                                                                    <td id="edui1_elementpath"
                                                                        class="edui-editor-bottombar edui-default">
                                                                        <div class="edui-editor-breadcrumb"
                                                                             onmousedown="return false;">元素路径: <span
                                                                                unselectable="on"
                                                                                onclick="$EDITORUI[&quot;edui1&quot;].editor.execCommand(&quot;elementpath&quot;, &quot;0&quot;);">body</span>
                                                                            &gt; <span unselectable="on"
                                                                                       onclick="$EDITORUI[&quot;edui1&quot;].editor.execCommand(&quot;elementpath&quot;, &quot;1&quot;);">p</span>
                                                                            &gt; <span unselectable="on"
                                                                                       onclick="$EDITORUI[&quot;edui1&quot;].editor.execCommand(&quot;elementpath&quot;, &quot;2&quot;);">br</span>
                                                                        </div>
                                                                    </td>
                                                                    <td id="edui1_wordcount"
                                                                        class="edui-editor-wordcount edui-default">
                                                                        当前已输入0个字符, 您还可以输入10000个字符。
                                                                    </td>
                                                                    <td id="edui1_scale"
                                                                        class="edui-editor-scale edui-default"
                                                                        style="display: none;">
                                                                        <div class="edui-editor-icon edui-default"></div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div id="edui1_scalelayer" class="edui-default"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="padding:20px">
                                        <div class="text-left m-t-xs animated-panel zoomIn"
                                             style="animation-delay: 1s;">

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
                                    </div>
                                    <div>
                                        <input type="hidden" name="_csrf" value="0418ccd2-9861-4db2-ba80-58f3e36ec876">
                                    </div>
                                    <textarea name="editorValue" id="ueditor_textarea_editorValue"
                                              style="display: none;"></textarea></form>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-3 animated-panel zoomIn" style="animation-delay: 1s;">
                                            <div class="hpanel">
                                                <div class="panel-heading">商品选项</div>
                                                <div class="form-group">

                                                </div>
                                                <button id="createSkuBtn" class="btn btn-success" type="button">
                                                    生成SKU
                                                </button>
                                                <button id="deleteSkuBtn" class="btn btn-success" type="button">
                                                    清除SKU
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-md-9 animated-panel zoomIn" style="animation-delay: 1.1s;">
                                            <div class="hpanel">
                                                <div id="skuListId" class="panel-heading">
                                                    SKU列表
                                                </div>
                                                <div class="panel">
                                                    <div id="skuGroup">

                                                    </div>
                                                    <div class="form-group text-center">
                                                        <div class="col-sm-8 col-sm-offset-2" style="padding-top: 20px">
                                                            <button class="btn btn-success" onclick="saveSku(this)">
                                                                保存SKU
                                                            </button>
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
            </div>
        </div>
    </div>
</div>

</body>
</html>