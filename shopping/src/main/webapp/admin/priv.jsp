<%
    Object user = session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login/login.jsp");
        return;
    }
%>