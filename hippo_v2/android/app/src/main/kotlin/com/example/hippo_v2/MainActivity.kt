package com.example.hippo_v2

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import dev.flutter.pigeon.Pigeon.*
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    private class Api: HippoApi {
        override fun initialize() {}
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        HippoApi.setup(flutterEngine.dartExecutor.binaryMessenger, Api())
    }
}
