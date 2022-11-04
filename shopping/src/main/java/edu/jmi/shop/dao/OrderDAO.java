package edu.jmi.shop.dao;

import edu.jmi.shop.bean.Order;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

public class OrderDAO extends BaseDAO {
    /* *//*根据用户ID和订单ID查找用户订单下的商品列表*//*
    public List<OrderItem> selectOrderItem(int usrId, String orderNumber) {
        List<OrderItem> list = new ArrayList<OrderItem>();
        try {
            Connection c = this.getConnection();
            String sql = "select order_item.*,product.name as product_name,product.default_img as product_img\n" +
                    "from order_item,product \n" +
                    "where order_num =?and user_id=?and product.id = order_item.product_id";

            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, orderNumber);
            pst.setInt(2, usrId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                OrderItem orderItem = new OrderItem();

                orderItem.setId(rs.getString("id"));
                orderItem.setOrderNumber(rs.getString("order_number"));
                orderItem.setProductId(rs.getInt("product_id"));
                orderItem.setPrice(rs.getInt("price"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItem.setUserId(rs.getInt("user_id"));
                orderItem.setId(rs.getString("product_name"));
                orderItem.setId(rs.getString("product_img"));

                list.add(orderItem);
            }
            return list;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    *//*查找购买商品的条目*//*
    public OrderItem selectOrderItem(String orderNumber, int productId, int userId) {
        OrderItem orderItem = null;
        try {
            Connection c = this.getConnection();
            String sql = "select * " +
                    "from order_item " +
                    "where order_num=? and product_id=?and user_id=?";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, orderNumber);
            pst.setInt(2, productId);
            pst.setInt(3, userId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                orderItem.setId(rs.getString("id"));
                orderItem.setOrderNumber(rs.getString("order_num"));
                orderItem.setProductId(rs.getInt("product_id"));
                orderItem.setPrice(rs.getInt("price"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItem.setUserId(rs.getInt("user_id"));
            }
            return orderItem;
        } catch (Exception ex) {
            ex.printStackTrace();
            return orderItem;
        }
    }

    *//*插入购买商品的条目*//*
    public boolean insertItem(OrderItem orderItem) {
        try {
            Connection c = this.getConnection();
            String sql = "insert into order_item(id,order_num,product_id,price,quantity,user_id) values(?,?,?,?,?,?)";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, orderItem.getId());
            pst.setString(2, orderItem.getOrderNumber());
            pst.setInt(3, orderItem.getProductId());
            pst.setInt(4, orderItem.getPrice());
            pst.setInt(5, orderItem.getQuantity());
            pst.setInt(6, orderItem.getUserId());
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    *//*更新购买商品的条目*//*
    public boolean updateItem(OrderItem orderItem) {
        try {
            Connection c = this.getConnection();
            String sql = "update order_item set order_num =?,product_id=?,price=?,quantity=?,user_id=? where id=?";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setString(1, orderItem.getOrderNumber());
            pst.setInt(2, orderItem.getProductId());
            pst.setInt(3, orderItem.getPrice());
            pst.setInt(4, orderItem.getQuantity());
            pst.setInt(5, orderItem.getUserId());
            pst.setString(6, orderItem.getId());
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    *//*插入订单*//*
    public boolean insertOrder(OrderItem orderInfo) {
        return false;
    }

    *//*查找订单*//*
    public OrderInfo selectOrder(String orderNumber) {
        return null;
    }
*/
    /*buy*/
    public boolean insert(Order order) {
        try {
            Connection c = this.getConnection();
            String sql = "insert into order_simple(id, user_id, product_id, shopPrice,quantity ,buy_time) values(?,?,?,?,?,?)";
            PreparedStatement pst = c.prepareStatement(sql);
            pst.setInt(1, order.getId());
            pst.setInt(2, order.getUserID());
            pst.setInt(3, order.getProductId());
            pst.setInt(4, order.getShopPrice());
            pst.setInt(5, order.getQuantity());
            pst.setDate(6, (Date) order.getBuyTime());
            pst.execute();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        Order order = new Order();
        order.setUserID(123484);
        order.setBuyTime(new Date(System.currentTimeMillis()));
        order.setProductId(996);
        order.setQuantity(10);
        order.setShopPrice(10000);
        OrderDAO orderDAO = new OrderDAO();
        System.out.println(orderDAO.insert(order));

    }
}
