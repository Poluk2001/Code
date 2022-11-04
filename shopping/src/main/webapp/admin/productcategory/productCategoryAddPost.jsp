<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    request.setCharacterEncoding("utf-8");
    String sName = request.getParameter("name");
    String sSortOrder = request.getParameter("sortOrder");
    String sDescription = request.getParameter("description");
    int userid = 1;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");

        String sql = "insert into product_category(name,sort_order,description," +
                "update_time,update_user_id)" +
                "values(?,?,?,?,?)";
        PreparedStatement pst = c.prepareStatement(sql);

        pst.setString(1, sName);
        pst.setString(2, sSortOrder);
        pst.setString(3, sDescription);
        pst.setDate(4, new Date(System.currentTimeMillis()));
        pst.setInt(5, userid);

        pst.execute();
        response.sendRedirect("productCategoryList.jsp");
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>


