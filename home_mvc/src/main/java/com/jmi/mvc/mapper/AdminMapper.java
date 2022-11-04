package com.jmi.mvc.mapper;

import com.jmi.mvc.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface AdminMapper {
    @Select("select * from admin where username=#{username} and password=#{password}")
    Admin selectAdmin(@Param("username") String username, @Param("password") String password);
}
