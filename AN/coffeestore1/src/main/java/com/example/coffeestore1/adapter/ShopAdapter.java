package com.example.coffeestore1.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;

import com.example.coffeestore1.R;
import com.example.coffeestore1.model.Shop;

import java.util.ArrayList;

public class ShopAdapter extends BaseAdapter {
    private Context context;
    private ArrayList<Shop> shopList;

    public ShopAdapter(Context context, ArrayList<Shop> shopList) {
        this.context = context;
        this.shopList = shopList;
    }

    @Override
    public int getCount() {
        return shopList.size();
    }

    @Override
    public Object getItem(int i) {
        return null;
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int position, View converView, ViewGroup parent) {
        View view = LayoutInflater.from(context).inflate(R.layout.shop_lv_item,null);
        Shop shop = shopList.get(position);
        ImageView ivShop = view.findViewById(R.id.iv_shop);

        ivShop.setImageResource(context.getResources().getIdentifier(shop.getImg_name(),"drawable",context.getPackageName()));

        return view;
    }
}


