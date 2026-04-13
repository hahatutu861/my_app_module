//
// MainActivity.kt
// Android App with Flutter Module
//
// 此文件展示如何在 Android Kotlin 代码中集成 Flutter Module
//

package com.example.myapp

// MARK: - 方式一：使用 FlutterFragment（推荐）
class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 显示 Flutter Fragment
        if (savedInstanceState == null) {
            val flutterFragment = FlutterFragment.createDefault()
            supportFragmentManager
                .beginTransaction()
                .add(R.id.fragment_container, flutterFragment)
                .commit()
        }
    }

    companion object {
        private const val TAG = "MainActivity"
    }
}

// MARK: - 方式二：使用带缓存的 FlutterFragment（性能优化）
class CachedFlutterActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 使用预热的 FlutterEngine
        val flutterEngine = FlutterEngineCache.getInstance().get("my_engine")

        if (flutterEngine != null) {
            val flutterFragment = FlutterFragment.withCachedEngine("my_engine").build()
            supportFragmentManager
                .beginTransaction()
                .add(R.id.fragment_container, flutterFragment)
                .commit()
        }
    }
}

// MARK: - 方式三：使用 FlutterActivity（完整 Flutter 界面）
class FullFlutterActivity : AppCompatActivity() {

    fun openFlutterScreen(view: View) {
        // 启动完整的 Flutter 界面
        startActivity(
            FlutterActivity.createDefaultIntent(this)
        )
    }

    fun openFlutterWithRoute(view: View) {
        // 启动 Flutter 界面并指定初始路由
        startActivity(
            FlutterActivity.withNewEngine()
                .initialRoute("/counter")
                .build(this)
        )
    }
}

// MARK: - 方式四：Application 类中预热 FlutterEngine（推荐）
class MyApplication : Application() {

    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()

        // 创建并预热 Flutter 引擎
        flutterEngine = FlutterEngine(this)

        // 启动 Dart 代码
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // 缓存引擎以便后续使用
        FlutterEngineCache.getInstance().put("my_engine", flutterEngine)

        // 设置 Method Channel 处理器
        setupMethodChannels(flutterEngine)
    }

    private fun setupMethodChannels(engine: FlutterEngine) {
        MethodChannel(engine.dartExecutor.binaryMessenger, "com.myapp.module")
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getNativeData" -> {
                        // 处理来自 Flutter 的请求
                        result.success("Native data from Android")
                    }
                    "getDeviceInfo" -> {
                        // 返回设备信息
                        val info = mapOf(
                            "platform" to "Android",
                            "version" to Build.VERSION.RELEASE,
                            "model" to Build.MODEL
                        )
                        result.success(info)
                    }
                    "navigateToNativeScreen" -> {
                        // 导航到原生页面
                        navigateToNativeScreen()
                        result.success(null)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }

    private fun navigateToNativeScreen() {
        // 实现导航到原生页面的逻辑
    }
}

// MARK: - 方式五：使用 FlutterFragment 带自定义配置
class CustomFlutterActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 创建带自定义配置的 FlutterFragment
        val flutterFragment = FlutterFragment.withNewEngine()
            .initialRoute("/custom") // 设置初始路由
            .build()

        supportFragmentManager
            .beginTransaction()
            .add(R.id.fragment_container, flutterFragment)
            .commit()
    }
}

// MARK: - 方式六：动态创建多个 FlutterFragment
class MultiFlutterFragmentActivity : AppCompatActivity() {

    private val engines = mutableListOf<FlutterEngine>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_multi_flutter)

        // 创建多个独立的 Flutter 引擎
        for (i in 1..3) {
            val engine = FlutterEngine(this)
            engine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )
            engines.add(engine)
        }

        // 显示第一个 Flutter 界面
        showFlutterScreen(0)
    }

    fun showFlutterScreen(index: Int) {
        if (index >= engines.size) return

        val flutterFragment = FlutterFragment
            .withCachedEngine("flutter_engine_$index")
            .build()

        supportFragmentManager
            .beginTransaction()
            .replace(R.id.fragment_container, flutterFragment)
            .commit()
    }

    override fun onDestroy() {
        super.onDestroy()
        // 清理所有引擎
        engines.forEach { it.destroy() }
    }
}

// MARK: - 方式七：使用 FlutterView（自定义布局）
class FlutterViewActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // 创建 FlutterEngine
        val flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // 创建 FlutterView
        val flutterView = FlutterView(this)

        // 设置布局
        setContentView(flutterView)

        // 将 FlutterView 附加到引擎
        flutterView.attachToFlutterEngine(flutterEngine)
    }

    override fun onDestroy() {
        super.onDestroy()
        // 清理资源
    }
}

// MARK: - 布局文件示例 (res/layout/activity_main.xml)
/*
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <FrameLayout
        android:id="@+id/fragment_container"
        android:layout_width="0dp"
        android:layout_height="0dp"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintEnd_toEndOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
*/

// MARK: - Gradle 配置示例
/*
// settings.gradle
include ':app'
setBinding(new Binding([gradle: this]))
evaluate(new File(
    settingsDir.parentFile,
    'my_app_module/.android/include_flutter.groovy'
))

// app/build.gradle
dependencies {
    implementation project(':flutter')
}
*/
