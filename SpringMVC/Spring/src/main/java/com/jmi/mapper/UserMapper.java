package com.jmi.mapper;


import com.jmi.pojo.User;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    @Select("select * from user where id = #{id}")
    User selectById(Integer id);
}
