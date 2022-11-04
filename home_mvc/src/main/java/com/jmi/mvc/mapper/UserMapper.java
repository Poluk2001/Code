package com.jmi.mvc.mapper;

import com.jmi.mvc.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    @Select("select * from user")
    List<User> selectAllUser();
}
