<%@ page import="java.sql.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="edu.jmi.shop.bean.Order" %>
<%@ page import="edu.jmi.shop.dao.OrderDAO" %>
<%@page pageEncoding="UTF-8" %>
<%
    String productId = request.getParameter("productId");
    String userId = request.getParameter("userId");
    String quantity = request.getParameter("number");
    String shopPrice = request.getParameter("shopPrice");
    Date date = new Date(Calendar.getInstance().getTimeInMillis());

    Order order = new Order();
    order.setShopPrice(Integer.parseInt(shopPrice));
    order.setQuantity(Integer.parseInt(quantity));
    order.setProductId(Integer.parseInt(productId));
    order.setUserID(Integer.parseInt(userId));
    order.setBuyTime(date);

    OrderDAO orderDAO = new OrderDAO();
    orderDAO.insert(order);
    response.sendRedirect(request.getContextPath()+"/index/index.jsp");
%>
