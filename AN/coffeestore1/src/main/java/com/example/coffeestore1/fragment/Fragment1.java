package com.example.coffeestore1.fragment;

import android.content.Context;
import android.media.Image;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import com.example.coffeestore1.R;

import java.util.ArrayList;

public class Fragment1 extends Fragment implements ViewPager.OnPageChangeListener, View.OnClickListener {

    // TODO: Rename and change types and number of parameters
//    public static Fragment1 newInstance(String param1, String param2) {
//        Fragment1 fragment = new Fragment1();
//        Bundle args = new Bundle();
//        args.putString(ARG_PARAM1, param1);
//        args.putString(ARG_PARAM2, param2);
//        fragment.setArguments(args);
//        return fragment;
//    }

//    private HomeFragment homeFragment;
    int[] imgs = new int[]{R.drawable.img_viewflow1, R.drawable.img_viewflow2, R.drawable.img_viewflow3};
    ArrayList<ImageView> imageList = new ArrayList<>();
    LinearLayout ll;
    ViewPager vpPhoto;
    ImageView imageView;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_home, null);
        ll = view.findViewById(R.id.ll_indicator);
        MyPagerAdapter myPagerAdapter = new MyPagerAdapter();
        vpPhoto = view.findViewById(R.id.vp_photo);
        vpPhoto.setAdapter(myPagerAdapter);

        vpPhoto.addOnPageChangeListener(this);

        //循环遍历三个点，注册监听器
        for (int i = 0 ; i  < ll.getChildCount(); i++){
            ImageView imageView = (ImageView) ll.getChildAt(i);
            imageView.setOnClickListener(this);
        }

//        for (int i = 0 ; i < imgs.length;i++){
//            imageView = new ImageView(this);
//            imageView.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT));
//            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
//            imageView.setImageResource(imgs[i]);
//            imageList.add(imageView);
//        }
        return view;
    }





    @Override
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

    }

    @Override
    public void onPageSelected(int position) {
        for ( int i = 0 ; i < ll.getChildCount(); i++){
            ImageView imageView = (ImageView) ll.getChildAt(i);
            if (i == position){
                imageView.setImageResource(R.drawable.indicator_focused);
            }else{
                imageView.setImageResource(R.drawable.indicator);
            }
        }
    }

    @Override
    public void onPageScrollStateChanged(int state) {

    }

    @Override
    public void onClick(View view) {
        for (int i = 0 ; i < ll.getChildCount();i++){
            if (view == ll.getChildAt(i)){
                vpPhoto.setCurrentItem(i);
                break;
            }
        }
    }

    class MyPagerAdapter extends PagerAdapter{

        @Override
        public int getCount() {
            return imageList.size();
        }

        @Override
        public boolean isViewFromObject(@NonNull View view, @NonNull Object object) {
            return view ==object;
        }
        //初始化对应的组件
        @NonNull
        @Override
        public Object instantiateItem(@NonNull ViewGroup container, int position) {
            ImageView imageView = imageList.get(position);
            container.addView(imageView);
            return imageView;
        }

        @Override
        public void destroyItem(@NonNull ViewGroup container, int position, @NonNull Object object) {
            container.removeView(imageList.get(position));
        }
    }

}