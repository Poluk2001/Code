package com.example.coffeestore1;

import android.content.Intent;
import android.icu.text.CaseMap;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.example.coffeestore1.fragment.Fragment1;
import com.example.coffeestore1.fragment.Fragment2;
import com.example.coffeestore1.fragment.Fragment3;
import com.example.coffeestore1.fragment.Fragment4;
import com.example.coffeestore1.fragment.Fragment5;

import java.util.ArrayList;
import java.util.List;

public class HomeActivity extends AppCompatActivity {
    private ArrayList<ImageView> imageList = new ArrayList<>();
    private int[] imgs = new int[]{R.drawable.img_viewflow1,R.drawable.img_viewflow2,R.drawable.img_viewflow3};
    private ViewPager vpPhoto1;
    private ViewPager vpPhoto2;
    private LinearLayout llIndicator;
    private ViewPager vp;
    private ArrayList<Fragment> fragmentList;
    private Fragment1 homeFragment;
    private RadioGroup radioGroup;
    private RadioButton radioButton1;
    private RadioButton radioButton2;
    private RadioButton radioButton3;
    private RadioButton radioButton4;
    private RadioButton radioButton5;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_coffee_store);
        vp = findViewById(R.id.vp);
        radioGroup = findViewById(R.id.radio);
        radioButton1 = findViewById(R.id.radio_home);
        radioButton2 = findViewById(R.id.radio_shopcar);
        radioButton3 = findViewById(R.id.radio_sort);
        radioButton4 = findViewById(R.id.radio_search);
        radioButton5 = findViewById(R.id.radio_me);
        List<Fragment>  list = new ArrayList<>();
        list.add(new Fragment1());
        list.add(new Fragment2());
        list.add(new Fragment3());
        list.add(new Fragment4());
        list.add(new Fragment5());
        vp.setAdapter(new FragmentPagerAdapter(getSupportFragmentManager()) {
            @NonNull
            @Override
            public Fragment getItem(int position) {
                return list.get(position);
            }

            @Override
            public int getCount() {
                return list.size();
            }
        });

        radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int i) {
                    switch (i) {
                        case R.id.radio_home:
                            vp.setCurrentItem(0);
                            break;
                        case R.id.radio_shopcar:
                            vp.setCurrentItem(1);
                            break;
                        case R.id.radio_sort:
                            vp.setCurrentItem(2);
                            break;
                        case R.id.radio_search:
                            vp.setCurrentItem(3);
                            break;
                        case R.id.radio_me:
                            vp.setCurrentItem(4);
                            break;
                    }
            }
        });
        vp.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
                RadioButton rb = (RadioButton) radioGroup.getChildAt(position);
                rb.setChecked(true);
            }

            @Override
            public void onPageScrollStateChanged(int state) {

            }
        });

    }

    public void ban(View view) {
        Intent intent = new Intent(this, LoginActivity.class);
        startActivity(intent);
    }
    public void shopClick(View view) {
        Intent intent = new Intent(this,ShopActivity.class);
        startActivity(intent);
        finish();
    }

}
