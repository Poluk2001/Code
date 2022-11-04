package edu.jmi.shop.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/*
    1.什么地址---->@WebServlet("/test")
    2.怎么服务---->
*/
@WebServlet("/test")
public class TestController extends HttpServlet {

    //提供服务的方法
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<head><title>hello</title></head>");
        out.println("<body><h1>hello servlet</h1></body>");
        out.println("</html>");
        out.close();

    }
}
