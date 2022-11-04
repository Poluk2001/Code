package com.example.demo3_1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

public class activity_view_pager extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_pager);
        initData();
        initView();
    }

    private void initView() {
        vpPhoto = findViewById(R.id.vp_photo);
        tlTilte = findViewById(R.id.tl_title);
        MyPagerAdapter myPagerAdapter = new MyPagerAdapter(this,photos);
        vpPhoto.setAdap ter(myPagerAdapter);
        tlTilte.setupWithViewPager(vpPhoto);

    }

    private void initData() {
    }
}