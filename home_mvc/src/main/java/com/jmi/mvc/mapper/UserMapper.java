package com.jmi.mvc.mapper;

import com.jmi.mvc.pojo.User;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {
    @Select("select * from user")
    List<User> selectAllUser();

    @Select("select * from user where id = #{id}")
    User selectUserById(Integer id);

    @Update("update user set name = #{name},phone = #{phone},email = #{email} where id = #{id}")
    void updateUser(User user);
}
