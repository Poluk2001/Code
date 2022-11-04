package com.example.demo3_1;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Spinner;

public class SpinnerActivity extends AppCompatActivity {
    private String[] books;
    private AutoCompleteTextView actvBook;
    private String [] provinces = new String[]{"北京","上海","天津","重庆","河北","山西","辽宁","吉林"};
    private Spinner spinnerProvinces;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_spinner);
        initData();
        initView();
    }

    private void initView() {
        actvBook = findViewById(R.id.actvBook);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1,
                android.R.layout.text1,
                books);
        actvBook.setAdapter(adapter);
        spinnerProvince = findViewById(R.id.spinnerProvince);
ArrayAdapter<String> adapter2 = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1,
                android.R.layout.text1,
                provinces);
        spinnerProvince.setAdapter(adapter2);
    }

    private void initData() {
        books = getResources().getStringArray(R.array.books);
    }
}