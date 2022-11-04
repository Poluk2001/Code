package com.example.coffeestore;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.Toast;

public class RegisterActivity extends AppCompatActivity {
    private EditText etName;
    private EditText etPassword;
    private EditText etRepassword;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        etName = findViewById(R.id.et_name);

        etName.setOnFocusChangeListener(new View.OnFocusChangeListener(){
            public void onFocusChange(View v,boolean hasFocus){
                if(!hasFocus){
                    Toast.makeText(RegisterActivity.this,"用户名不能为空",Toast.LENGTH_LONG).show();
                }
            }
        });
        etPassword = findViewById(R.id.et_Password);
        etPassword.setOnFocusChangeListener(new View.OnFocusChangeListener(){
            public void onFocusChange(View v,boolean hasFocus){
                if(!hasFocus){
                    String password = etPassword.getText().toString();
                    if (TextUtils.isEmpty(password)){
                        Toast.makeText(RegisterActivity.this,"密码不能为空",Toast.LENGTH_LONG).show();
                    }
                }
            }
        });
        etRepassword = findViewById(R.id.et_repassword);
        etRepassword.setOnFocusChangeListener(new View.OnFocusChangeListener(){
            public void onFocusChange(View v,boolean hasFocus){
                String password = etPassword.getText().toString();
                String repassword = etRepassword.getText().toString();
                if (!hasFocus){
                    if (TextUtils.isEmpty(repassword)){
                        Toast.makeText(RegisterActivity.this,"确认密码不能为空",Toast.LENGTH_LONG).show();
                        return;
                    }
                    if (TextUtils.isEmpty(password)) {
                        if (!repassword.equals(password)) {
                            Toast.makeText(RegisterActivity.this, "密码和确认密码不同", Toast.LENGTH_LONG).show();
                            return;
                        }
                    }
                }
            }
        });
    }
    public void hideSoftKeyBoard(View view){
        if (view != null){
            InputMethodManager imm  = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
            imm.hideSoftInputFromWindow(view.getWindowToken(),0);
        }
    }
    public void backClick(){
        finish();
    }
    public void registerClick(View view){
        String name  = etName.getText().toString().trim();
        String password = etPassword.getText().toString().trim();
        String repassword = etRepassword.getText().toString().trim();

        if (TextUtils.isEmpty(name)){
            dialog("用户名不能为空，是否继续注册？");
            return;
        }
        if (TextUtils.isEmpty(password) || TextUtils.isEmpty(repassword)){
            dialog("密码不能为空，是否继续注册？");
            return;
        }
        if (!password.equals(repassword)){
            dialog("密码和确认密码不一样，是否继续注册？");
            return;
        }
        Intent intent = getIntent();
        intent.putExtra("name",name);
        intent.putExtra("password",password);
        setResult(Activity.RESULT_OK,intent);
        finish();
    }

    private void dialog(String msg) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setIcon(R.mipmap.ic_launcher)
                .setTitle("咖啡店")
                .setMessage(msg)
                .setPositiveButton("是", new DialogInterface.OnClickListener(){
                    public void onClick(DialogInterface dialog,int which){dialog.dismiss();}

                }).setPositiveButton("否", new DialogInterface.OnClickListener(){
                    public void onClick(DialogInterface dialog,int which){
                        dialog.dismiss();
                        finish();
                    }
                });
        builder.create().show();
    }

    public void logClick(View view) {
        Intent intent = new Intent(this,LoginActivity.class);
        startActivity(intent);
        finish();
    }
}
