package com.example.kwboo.androidpoc

import android.content.pm.ActivityInfo
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.ViewGroup
import android.widget.RelativeLayout
import io.flutter.facade.Flutter
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);

        fab.setOnClickListener(object : View.OnClickListener {
            override fun onClick(view: View) {
                val flutterView = Flutter.createView(
                    this@MainActivity,
                    lifecycle,
                    "route1"
                )
                val layout = RelativeLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
                addContentView(flutterView, layout)
            }
        })
    }
}
