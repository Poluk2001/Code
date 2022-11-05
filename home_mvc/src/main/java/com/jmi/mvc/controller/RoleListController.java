package com.jmi.mvc.controller;

import com.jmi.mvc.mapper.RoleMapper;
import com.jmi.mvc.mapper.UserMapper;
import com.jmi.mvc.pojo.Role;
import com.jmi.mvc.utils.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class RoleListController {
    //查询角色信息
    @RequestMapping("/role")
    public String roleList(Model model) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        RoleMapper mapper = sqlSession.getMapper(RoleMapper.class);
        List<Role> roles = mapper.selectAllRole();
        model.addAttribute("roles", roles);
        return "rolelist";
    }
    //根据id查询角色信息
    @RequestMapping("/role/{id}")
    public String selectRole(@PathVariable("id") Integer id, Model model) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        RoleMapper mapper = sqlSession.getMapper(RoleMapper.class);
        Role role = mapper.selectRoleById(id);
        model.addAttribute("role", role);
        return "roleupdate";
    }
    //修改用户信息
    @RequestMapping(value = "/roleupdate",method = RequestMethod.PUT)
    public String updateRole(Role role) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        RoleMapper mapper = sqlSession.getMapper(RoleMapper.class);
        mapper.updateRole(role);
        return "redirect:/role";
    }
}
