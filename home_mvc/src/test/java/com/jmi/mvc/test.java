package com.jmi.mvc;

import com.jmi.mvc.mapper.AdminMapper;
import com.jmi.mvc.mapper.UserMapper;
import com.jmi.mvc.pojo.Admin;
import com.jmi.mvc.pojo.User;
import com.jmi.mvc.utils.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;

import java.util.List;

public class test {
    @Test
    public void test() {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<User> users = mapper.selectAllUser();
        System.out.println(users);
    }
}
