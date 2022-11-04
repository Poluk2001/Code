package edu.jmi.shop.controller;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.bean.ProductCategory;
import edu.jmi.shop.dao.ProductCategoryDAO;
import edu.jmi.shop.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/productServlet/*")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        if (url.endsWith("/list")) {
            list(request, response);
        } else if (url.endsWith("/add")) {
            add(request, response);
        } else if (url.endsWith("/edit")) {
            edit(request, response);
        } else if (url.endsWith("/del")) {
            del(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURL().toString();
        if (url.endsWith("/addpost")) {
            addpost(request, response);
        } else if (url.endsWith("/editpost")) {
            editpost(request, response);
        }
    }

    private void addpost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");

        Product product = new Product();
        product.setName(name);
        product.setCategoryId(Integer.parseInt(category));
        product.setPrice(Integer.parseInt(price));

        ProductDAO productDAO = new ProductDAO();
        productDAO.insert(product);

        response.sendRedirect("/shopping/productServlet/list");
    }

    private void editpost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");

        Product product = new Product();
        product.setId(Integer.parseInt(id));
        product.setName(name);
        product.setCategoryId(Integer.parseInt(category));
        product.setPrice(Integer.parseInt(price));

        ProductDAO productDAO = new ProductDAO();
        productDAO.update(product);

        response.sendRedirect("/shopping/productServlet/list");

    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='utf-8'>");
        out.println("<title>商品列表</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<a href=\"productServlet/add\">增加</a>");
        out.println("<table border=1>");
        out.println("<tr><th>商品名称</th><th>商品价格</th><th>操作</th></tr>");
        ProductDAO productDAO = new ProductDAO();
        List<Product> list = productDAO.select();
        for (Product product : list) {
            out.println("<tr>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getPrice() + "</td>");
            out.println("<td>\n" +
                    "<a href=\"productServlet/edit?id=" + product.getId() + "\">修改</a>&nbsp;\n" +
                    "<a href=\"productServlet/del?id=" + product.getId() + "\">删除</a>&nbsp;\n" +
                    "</td>");
            out.println("<tr>");
        }
        out.println("</table>");
        out.println("</body>");


    }

    private void add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='utf-8'>");
        out.println("<title>商品列表</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<form action='productServlet/addpost' method='post'>");
        out.println("商品名称:<input type=\"text\" name=\"name\"><br>");
        out.println("商品价格:<input type=\"text\" name=\"price\"><br>\n");
        out.println("<select name=\"category\">");
        ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
        List<ProductCategory> list = productCategoryDAO.selectAll();
        for (ProductCategory productCategory : list) {
            out.println("<option value=\"" + productCategory.getId() + "\">" + productCategory.getName() + "</option>");
        }
        out.println("</select><br>");
        out.println("<input type=\"submit\"/>\n");
        out.println("</body>");
        out.println("</html>");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='utf-8'>");
        out.println("<title>商品列表</title>");
        out.println("</head>");
        out.println("<body>");
        String sId = request.getParameter("id");
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.select(sId);
        out.println("<form action='productServlet/editpost' method='post'>");
        out.println("<input type=\"hidden\" name=\"id\" value=\"" + product.getId() + "\"/>");
        out.println("商品名称:<input type=\"text\" name=\"name\" value=\"" + product.getName() + "\"/><br>");
        out.println("商品价格:<input type=\"text\" name=\"price\" value=\"" + product.getPrice() + "\"><br>");
        out.println("<select name=\"category\">");
        ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
        List<ProductCategory> list = productCategoryDAO.selectAll();
        for (ProductCategory productCategory : list) {
            if (productCategory.getId() == product.getCategoryId()) {
                out.println("<option selected value=\"" + productCategory.getId() + "\">" + productCategory.getName() + "</option>");
            } else {
                out.println("<option value=\"" + productCategory.getId() + "\">" + productCategory.getName() + "</option>");

            }
        }
        out.println("</select><br>");
        out.println("<input type=\"submit\"/>\n");
        out.println("</body>");
        out.println("</html>");
    }

    private void del(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductDAO productDAO = new ProductDAO();
        productDAO.delete(Integer.parseInt(id));
        response.sendRedirect("/shopping/productServlet/list");
    }
}
