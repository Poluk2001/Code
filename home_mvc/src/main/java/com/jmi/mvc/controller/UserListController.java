package com.jmi.mvc.controller;

import com.jmi.mvc.mapper.UserMapper;
import com.jmi.mvc.pojo.User;
import com.jmi.mvc.utils.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class UserListController {
    //查询用户信息
    @RequestMapping("/user")
    public String userList(Model model) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<User> users = mapper.selectAllUser();
        model.addAttribute("users", users);
        return "userlist";
    }
    //根据id查询用户信息
    @RequestMapping("/user/{id}")
    public String selectUser(@PathVariable("id") Integer id,Model model) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.selectUserById(id);
        model.addAttribute("user", user);
        return "userupdate";
    }
    //修改用户信息
    @RequestMapping(value = "/userupdate",method = RequestMethod.PUT)
    public String updateUser(User user) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.updateUser(user);
        return "redirect:/user";
    }
}
