<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");
    String sName = request.getParameter("name");
    String sSortOrder = request.getParameter("sortOrder");
    String sDescription = request.getParameter("description");
    int userid = 1;
    String sId = request.getParameter("id");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");
        String sql = "update product_category set name =?,sort_order=?,description=?,update_time=?,update_user_id=? where id =?";
        PreparedStatement pst = c.prepareStatement(sql);
        pst.setString(1, sName);
        pst.setString(2, sSortOrder);
        pst.setString(3, sDescription);
        pst.setDate(4, new Date(System.currentTimeMillis()));
        pst.setInt(5, userid);
        pst.setString(6, sId);
        pst.execute();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    response.sendRedirect(request.getContextPath() + "/admin/productcategory/productCategoryList.jsp");
%>



