<%@ page import="java.sql.*" %>
<%@ page import="edu.jmi.shop.dao.UserDAO" %>
<%@ page pageEncoding="utf-8" %>
<jsp:useBean id="user" class="edu.jmi.shop.bean.User"/>
<jsp:setProperty name="user" property="*"/>

<%
    user.setRegisterTime(new Date(System.currentTimeMillis()));
    user.getRole("ROLE_GUEST");

    UserDAO userDAO = new UserDAO();
    if (userDAO.insert(user)){
        response.sendRedirect(request.getContextPath()+"index/login.jsp");
    }else {
        response.sendRedirect(request.getContextPath()+"index/register.jsp");
    }
%>