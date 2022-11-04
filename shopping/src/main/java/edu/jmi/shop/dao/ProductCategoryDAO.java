package edu.jmi.shop.dao;

import edu.jmi.shop.bean.ProductCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductCategoryDAO extends BaseDAO {

    public List<ProductCategory> selectAll() {
        List<ProductCategory> list = new ArrayList<ProductCategory>();
        try {
            Connection c = this.getConnection();
            String sql = "select id,name " +
                    "from product_category " +
                    "order by sort_order";
            PreparedStatement pst = c.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                ProductCategory productCategory = new ProductCategory();

                productCategory.setId(rs.getInt("id"));
                productCategory.setName(rs.getString("name"));

                list.add(productCategory);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return list;
        }
    }
}
