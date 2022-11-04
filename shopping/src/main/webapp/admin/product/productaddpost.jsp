<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    //1.提取表单数据
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

    //2.数据验证
    if (sName == null || !sName.matches("^.{1,100}$")) {
        request.getRequestDispatcher("productadd.jsp")
                .forward(request, response);
        return;
    }
    if (sCategory == null || !sCategory.matches("^\\d{1,7}$")) {
        request.getRequestDispatcher("productadd.jsp")
                .forward(request, response);
        return;
    }
    if (sPrice == null || !sPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")) {
        request.getRequestDispatcher("productadd.jsp")
                .forward(request, response);
        return;
    }

    //3.插入数据
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");

        String sql = "insert into product(name,category_id,price,shop_price,quantity," +
                "product_status,hot,general_explain,update_time,update_user_id" + ")" +
                "values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = c.prepareStatement(sql);

        pst.setString(1, sName);
        pst.setString(2, sCategory);
        /*int price = (int) Double.parseDouble(sPrice) * 100;
        int shopPrice = (int) Double.parseDouble(sShopPrice) * 100;
        pst.setInt(3, price);
        pst.setInt(4, shopPrice);*/
        pst.setString(3, sPrice);
        pst.setString(4, sShopPrice);
        pst.setString(5, sQuantity);
        pst.setString(6, sProductStatus);
        pst.setString(7, sHot);
        pst.setString(8, sGeneralExplain);
        pst.setDate(9, new Date(System.currentTimeMillis()));
        pst.setInt(10,userid);
        /*pst.setString(10, session.getAttribute("userid").toString());*/
        pst.execute();
        response.sendRedirect("productlist.jsp");
    } catch (Exception ignored) {

    }
%>

