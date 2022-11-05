package com.example.coffeestore1;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

public class LoginActivity extends AppCompatActivity {

    private EditText etName;
    private EditText etPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        etName = (EditText) findViewById(R.id.et_name);
        etPassword = (EditText) findViewById(R.id.et_password);
    }

    public void loginClick(View view) {
        String name = etName.getText().toString();
        String password = etPassword.getText().toString();
        if("zhangsan".equals(name) && "123456".equals(password)){
            Intent intent = new Intent(this,HomeActivity.class);
            startActivity(intent);
            finish();
        }else{
            dialog("用户名或者密码错误，是否继续登录？");
        }
    }
    private void dialog(String msg){
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setIcon(R.mipmap.ic_launcher)
                .setTitle("咖啡店")
                .setMessage(msg)
                .setPositiveButton("是", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                }).setNegativeButton("否", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        finish();
                    }
                });
        builder.create().show();
    }
    //启动第二界面来获得结果
    public void  registerClick(View view){
        Intent intent = new Intent(this,RegisterActivity.class);
        startActivityForResult(intent,0x11);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(resultCode == Activity.RESULT_OK){
            if(requestCode == 0x11){
                String name = data.getStringExtra("name");
                String password = data.getStringExtra("password");
                etName.setText(name);
                etPassword.setText(password);

            }
        }
    }

}