package com.example.coffeestore1;

import android.os.Bundle;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.coffeestore1.adapter.ShopAdapter;
import com.example.coffeestore1.model.Shop;
import com.example.coffeestore1.adapter.ShopAdapter;
import com.example.coffeestore1.model.Shop;

import java.util.ArrayList;

public class ShopActivity extends AppCompatActivity {

    private ArrayList<Shop> shopList = new ArrayList<Shop>();
    private ListView lvShop;
    private ShopAdapter shopAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_shop);
        initData();
        initView();
    }


    private void initView() {
        lvShop = findViewById(R.id.lv_shop);
        shopAdapter = new ShopAdapter(this,shopList);
        lvShop.setAdapter(shopAdapter);
    }

    private void initData() {
        Shop shop = new Shop();
        shop.setShop_id("001");
        shop.setShop_name("左岸咖啡店");
        shop.setShop_address("星海广场001号");
        shop.setTel("041183404848");
        shop.setImg_name("img_coffee_01");
        shopList.add(shop);

        Shop shop1 = new Shop();
        shop1.setShop_id("002");
        shop1.setShop_name("漫猫咖啡店");
        shop1.setShop_address("中山区无名街002号");
        shop1.setTel("041183404444");
        shop1.setImg_name("img_coffee_02");
        shopList.add(shop1);

        Shop shop2 = new Shop();
        shop2.setShop_id("003");
        shop2.setShop_name("星巴克咖啡店");
        shop2.setShop_address("甘井子区数码路北段18-25号");
        shop2.setTel("88147265");
        shop2.setImg_name("img_coffee_03");
        shopList.add(shop2);

        Shop shop3 = new Shop();
        shop3.setShop_id("004");
        shop3.setShop_name("萌客思维主题咖啡馆");
        shop3.setShop_address("甘井子区软件园路144号");
        shop3.setTel("15041190144");
        shop3.setImg_name("img_coffee_04");
        shopList.add(shop3);

        Shop shop4 = new Shop();
        shop4.setShop_id("005");
        shop4.setShop_name("蓝湾咖啡店");
        shop4.setShop_address("文鼎广场100号");
        shop4.setTel("15041190144");
        shop4.setImg_name("img_coffee_05");
        shopList.add(shop4);

        Shop shop5 = new Shop();
        shop5.setShop_id("006");
        shop5.setShop_name("猫空");
        shop5.setShop_address("南京湖南路668号");
        shop5.setTel("123456789");
        shop5.setImg_name("img_coffee_06");
        shopList.add(shop5);

        Shop shop6 = new Shop();
        shop6.setShop_id("007");
        shop6.setShop_name("星巴克");
        shop6.setShop_address("文鼎广场点");
        shop6.setTel("123123");
        shop6.setImg_name("img_coffee_07");
        shopList.add(shop6);

        Shop shop7 = new Shop();
        shop7.setShop_id("008");
        shop7.setShop_name("呆呆猫猫咪咖啡店");
        shop7.setShop_address("大学城");
        shop7.setTel("234234567");
        shop7.setImg_name("img_coffee_08");
        shopList.add(shop7);

        getResources().getIdentifier("img_coffee_01","drawable",getPackageName());

    }

}