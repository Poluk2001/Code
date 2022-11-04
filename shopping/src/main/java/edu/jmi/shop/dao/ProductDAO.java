package edu.jmi.shop.dao;
/*
  完成product表到Java对象自己的映射
  实现增删改查操作
 */

import edu.jmi.shop.bean.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends BaseDAO {
    public List<Product> select() {
        Connection c = getConnection();
        List<Product> list = new ArrayList<Product>();

        try {
            String sql = "select product.*,product_category.name " +
                    "as category_name,user.user_name " +
                    "from product " +
                    "left join product_category on product.category_id=product_category.id " +
                    "left join user on product.update_user_id=user.id";
            PreparedStatement pst = c.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setShopPrice(rs.getInt("shop_price"));
                product.setHot(rs.getInt("hot"));
                product.setPrice(rs.getInt("price"));
                product.setProductStatus(rs.getInt("product_status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGeneralExplanin(rs.getString("general_explain"));
                product.setCategoryName(rs.getString("category_name"));
                product.setUpdateUsername(rs.getString("user_name"));
                product.setDefaultImg(rs.getString("default_img"));
                product.setUpdateTime(rs.getDate("update_time"));

                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(c);
            return list;
        }

    }

    public Product select(String id) {
        Connection c = getConnection();
        Product product = new Product();

        try {
            String sql = "select product.*,product_category.name " +
                    "as category_name,user.user_name " +
                    "from product " +
                    "join product_category " +
                    "on product.category_id=product_category.id " +
                    "join user on product.update_user_id=user.id " +
                    "where product.id=?";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setShopPrice(rs.getInt("shop_price"));
                product.setHot(rs.getInt("hot"));
                product.setPrice(rs.getInt("price"));
                product.setProductStatus(rs.getInt("product_status"));
                product.setQuantity(rs.getInt("quantity"));
                product.setGeneralExplanin(rs.getString("general_explain"));
                product.setCategoryName(rs.getString("category_name"));
                product.setUpdateUsername(rs.getString("user_name"));
                product.setDefaultImg(rs.getString("default_img"));
                product.setUpdateTime(rs.getDate("update_time"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(c);
            return product;
        }

    }

    public boolean insert(Product product) {
        Connection connection = getConnection();
        try {
            String sql = "insert into product(name,price,category_id,update_user_id) " +
                    "values(?,?,?,1)";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, product.getName());
            pst.setInt(2, product.getPrice());
            pst.setInt(3, product.getCategoryId());
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            closeConnection(connection);
        }
    }

    public boolean update(Product product) {
        Connection connection = getConnection();
        try {
            String sql = "update product " +
                    "set name=?,category_id=?,price=? " +
                    "where id=?";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, product.getName());
            pst.setInt(2, product.getCategoryId());
            pst.setInt(3, product.getPrice());
            pst.setInt(4, product.getId());
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            closeConnection(connection);

        }
    }

    public boolean delete(int id) {
        Connection connection = getConnection();
        try {
            String sql = "delete from product where id=?";
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            closeConnection(connection);
        }
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.select("933");
        System.out.println(product.getName());


    }

}
