package com.jmi.mvc.controller;

import com.jmi.mvc.mapper.AdminMapper;
import com.jmi.mvc.pojo.Admin;
import com.jmi.mvc.pojo.User;
import com.jmi.mvc.utils.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    //登录页面控制器
    @RequestMapping("/login")
    public String login(Admin admin,HttpServletRequest request, Model model, HttpSession session) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
        //判断用户发送来的数据是否和数据库的数据相匹配
        Admin root = adminMapper.selectAdmin(request.getParameter("username"), request.getParameter("password"));
        if (root != null) {
            //如果不等于空，说明用户输入的数据和数据库的数据匹配，并且查出了信息，所以不为空，并且将用户信息存储到session中，用于拦截器的session判断
            session.setAttribute("userinfo",root);
            return "index";
        } else {
            return "login";
        }
    }
    //列表返回主页控制器
    @RequestMapping("/index")
    public String index() {
        return "index";
    }
    //退出登录页面控制器
    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) {
        session.invalidate();
        model.addAttribute("success", "用户退出成功");
        return "login";
    }
}
