package edu.jmi.shop.dao;

import edu.jmi.shop.bean.User;

import java.sql.Connection;

import java.sql.PreparedStatement;


public class UserDAO extends BaseDAO {
    public boolean insert(User user) {
        try {
            Connection c = this.getConnection();
            String sql = "insert into  user (id,user_name,pwd,register_time,role,phone) " +
                    "values (?,?,?,?,?,?) ";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setInt(1, user.getId());
            pst.setString(2, user.getUserName());
            pst.setString(3, user.getPwd());
            pst.setDate(4, user.getRegisterTime());
            pst.setString(5, user.getRole());
            pst.setString(6, user.getPhone());
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }
}