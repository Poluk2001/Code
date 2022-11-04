<%@ page import="edu.jmi.shop.bean.OrderItem" %>
<%@ page import="edu.jmi.shop.dao.OrderDAO" %>
<%@page pageEncoding="UTF-8" %>
<%
    String s = request.getParameter("productid");
    int productId = Integer.parseInt(s);
    s = request.getParameter("price");
    int price = Integer.parseInt(s);
    s = request.getParameter("number");
    int quantity = Integer.parseInt(s);

    OrderItem orderItem = new OrderItem();
    orderItem.setId(System.currentTimeMillis()+"");
    orderItem.setOrderNumber("000000");
    orderItem.setProductId(productId);
    orderItem.setPrice(price);
    orderItem.setQuantity(quantity);
    orderItem.setUserId();
    OrderDAO orderDAO = new OrderDAO();

    boolean bSave = orderDAO.insertOrder(orderItem);

%>
