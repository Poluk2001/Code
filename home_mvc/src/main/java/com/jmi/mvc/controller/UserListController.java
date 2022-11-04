package com.jmi.mvc.controller;

import com.jmi.mvc.mapper.UserMapper;
import com.jmi.mvc.pojo.User;
import com.jmi.mvc.utils.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserListController {
    @RequestMapping("/user")
    public String userList(Model model) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<User> users = mapper.selectAllUser();
        model.addAttribute("users", users);
        return "userlist";
    }
}
