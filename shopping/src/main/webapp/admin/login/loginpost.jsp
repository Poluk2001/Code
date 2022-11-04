<%@ page import="java.sql.*" %>
<%@ page pageEncoding="utf-8" %>

<%
    //步骤1.获取用户输入的用户名和密码 request.getParameter
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    //步骤2.是根据获取的用户名到数据库查找该用户
    Connection c = null;
    try {
        //1.加载一个Driver驱动
        Class.forName("com.mysql.cj.jdbc.Driver");
        //2.创建数据库连接（Connection）
        c = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "123456");
        //3.获取sql语句
        String sql = "select * from user where user_name='" + username + "'";
        //4.获取数据库对象
        PreparedStatement pst = c.prepareStatement(sql);
        //5.执行数据库操作
        ResultSet rs = pst.executeQuery();

        //步骤3.判断用户是否存在
        if (rs.next()) {
            //获取用户密码
            String pwd = rs.getString("pwd");
            //判断该用户的密码和输入的密码是否相等
            if (pwd.equals(password)) {
                session.setAttribute("user", username);
                /*session.setAttribute("userid",rs.getInt("id"));*/
                response.sendRedirect(request.getContextPath() + "/admin/product/productlist.jsp");
            } else {
                session.setAttribute("error", "用户名或者密码错误");
                response.sendRedirect("login.jsp");
            }
        } else {
            session.setAttribute("error", "用户名或者密码错误");
            response.sendRedirect("login.jsp");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
        session.setAttribute("error", "程序出现未知异常");
        response.sendRedirect("login.jsp");
    } finally {
        c.close();
    }
%>
