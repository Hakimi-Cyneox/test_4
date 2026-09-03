package com.app.yayasan.muhibah

import android.os.Bundle
import android.graphics.Color
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Set dark nav and status bar colors
        window.navigationBarColor = Color.BLACK
//        window.statusBarColor = Color.BLACK
    }
}
