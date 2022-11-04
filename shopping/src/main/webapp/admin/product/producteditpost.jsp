<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");
    String sName = request.getParameter("name");
    String sCategory = request.getParameter("categoryId");
    String sPrice = request.getParameter("price");
    String sShopPrice = request.getParameter("shopPrice");
    String sQuantity = request.getParameter("quantity");
    String sProductStatus = request.getParameter("productStatus");
    String sHot = request.getParameter("hot");
    String sGeneralExplain = request.getParameter("generalExplain");
    int userid = 1;
    String sId = request.getParameter("id");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");
    String sql = "update product set name=?,category_id=?,price=?," +
            "shop_price=?,quantity=?,product_status=?," +
            "hot=?,general_explain=?,update_time=?," +
            "update_user_id=? " +
            "where id=?";

    PreparedStatement pst = c.prepareStatement(sql);
    pst.setString(1, sName);
    pst.setString(2, sCategory);
    pst.setString(3, sPrice);
    pst.setString(4, sShopPrice);
    pst.setString(5, sQuantity);
    pst.setString(6, sProductStatus);
    pst.setString(7, sHot);
    pst.setString(8, sGeneralExplain);
    pst.setDate(9, new Date(System.currentTimeMillis()));
    pst.setInt(10, userid);
    pst.setString(11, sId);
    pst.execute();
    response.sendRedirect(request.getContextPath() + "/admin/product/productlist.jsp");
}catch (Exception ignored){

}
%>

