<%@ page import="java.sql.*" %>
<%@page pageEncoding="UTF-8" %>
<%--<%@include file="../priv.jsp"%>--%>

<%
    String sId = request.getParameter("id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");
        String sql = "delete from product_category where id=?";
        PreparedStatement pst = c.prepareStatement(sql);

        pst.setString(1, sId);
        pst.execute();
        c.close();

    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    response.sendRedirect(request.getContextPath() + "/admin/productcategory/productCategoryList.jsp");
%>
