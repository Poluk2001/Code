package com.example.coffeestore;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

public class HomeActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_coffee_store);
    }
    public void shopClick(View view) {
        Intent intent = new Intent(this,ShopActivity.class);
        startActivity(intent);
        finish();
    }

}
