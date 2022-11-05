package com.example.coffeestore1;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import android.os.Bundle;
import android.view.View;
import android.widget.RadioButton;
import android.widget.RadioGroup;

import com.example.coffeestore1.fragment.Fragment1;

import java.util.ArrayList;

public class AddActivity extends AppCompatActivity {
    private RadioGroup rgWeixin;
    private int prePos;
    private ViewPager vpFragment;
    private ArrayList<Fragment> fragmentList;
    private Fragment1 homeFragment;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add);
        initData();
        initView();
    }

    private void initView() {
        vpFragment = findViewById(R.id.vp_home);
        MyFagmentAdapter myFagmentAdapter  = new MyFagmentAdapter(getSupportFragmentManager());
        vpFragment.setAdapter(myFagmentAdapter);

        vpFragment.addOnPageChangeListener(new ViewPager.OnPageChangeListener(){

            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
//                for (int i = 0 ; i < rgWeixin.getChildCount();i++){
//                    RadioButton rb = (RadioButton) rgWeixin.getChildAt(i);
//                    if (i == position){
//                        rb.setChecked(true);
//                        break;
//                    }
//                }

                RadioButton rb = (RadioButton) rgWeixin.getChildAt(position);
                rb.setChecked(true);

            }

            @Override
            public void onPageScrollStateChanged(int state) {

            }
        });

        rgWeixin = findViewById(R.id.radio);

        rgWeixin.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                switch (checkedId) {
                    case R.id.radio_home:
                        vpFragment.setCurrentItem(0);
                        break;
                    case R.id.radio_shopcar:
                        vpFragment.setCurrentItem(1);
                        break;
                    case R.id.radio_sort:
                        vpFragment.setCurrentItem(2);
                        break;
                    case R.id.radio_search:
                        vpFragment.setCurrentItem(3);
                        break;
                    case R.id.radio_me:
                        vpFragment.setCurrentItem(4);
                        break;
                }
            }
        });


//        for (int i = 0 ; i  < rgWeixin.getChildCount(); i++){
//            RadioButton radioButton = (RadioButton) rgWeixin.getChildAt(i);
//            radioButton.setOnClickListener(this);
//        }
    }

    private void initData(){

    }

    public void onClick(View v){
//        for (int i = 0 ; i < rgWeixin.getChildCount();i++){
//            if (v == rgWeixin.getChildAt(i)){
//                vpFragment.setCurrentItem(i);
//                break;
//            }
//        }
    }

    class MyFagmentAdapter extends FragmentPagerAdapter {
        public MyFagmentAdapter(@NonNull FragmentManager fm){
            super(fm);
        }

        @NonNull
        @Override
        public Fragment getItem(int position) {
            return fragmentList.get(position);
        }

        @Override
        public int getCount() {
            return fragmentList.size();
        }
    }
}