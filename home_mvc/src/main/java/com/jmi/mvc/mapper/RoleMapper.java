package com.jmi.mvc.mapper;

import com.jmi.mvc.pojo.Role;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface RoleMapper {
    @Select("select * from role")
    List<Role> selectAllRole();

    @Select("select * from role where id = #{id}")
    Role selectRoleById(Integer id);

    @Update("update role set name = #{name},description = #{description} where id = #{id}")
    void updateRole(Role role);
}
