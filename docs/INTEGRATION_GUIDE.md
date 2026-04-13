# Flutter Module 集成指南

这个 Flutter Module 可以嵌入到现有的 iOS 和 Android 原生应用中。

## 项目结构

```
my_app_module/
├── .android/              # Android 配置
├── .ios/                  # iOS 配置
├── lib/                   # Flutter 代码
│   ├── core/              # 核心功能（网络、主题、路由等）
│   ├── features/          # 功能模块
│   └── shared/            # 共享组件
├── assets/                # 资源文件
└── test/                  # 测试文件
```

## 功能特性

- ✅ Clean Architecture + Riverpod 状态管理
- ✅ GoRouter 路由导航
- ✅ 网络拓扑可视化
- ✅ 计数器示例
- ✅ 国际化支持（英语/法语）
- ✅ 亮色/暗色主题

---

## iOS 集成

### 方式一：CocoaPods 集成（推荐）

#### 1. 在你的 iOS 项目中添加 Flutter

编辑你的 `Podfile`：

```ruby
# 在 Podfile 顶部添加 Flutter 脚本
flutter_application_path = '../my_app_module/'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

# 在你的 target 中
target 'MyExistingApp' do
  # 添加所有 Flutter 框架
  install_all_flutter_pods(flutter_application_path)
end
```

#### 2. 安装 pods

```bash
cd ios
pod install
```

#### 3. 在 Swift 中使用 Flutter

```swift
import UIKit
import Flutter

// 在你的 ViewController 中
class FlutterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建 Flutter 引擎
        let flutterEngine = FlutterEngine(name: "my flutter engine")
        flutterEngine.run()

        // 获取 FlutterViewController
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

        // 添加为子视图
        addChild(flutterViewController)
        view.addSubview(flutterViewController.view)
        flutterViewController.view.frame = view.bounds
        flutterViewController.didMove(toParent: self)
    }
}
```

### 方式二：Swift Package Manager

1. 在 Xcode 中，选择 File → Add Package Dependencies
2. 输入 Flutter module 路径：`../my_app_module/.ios/Flutter`
3. 选择需要的 framework

### 方式三：手动集成

参考：[Flutter iOS Add-to-App](https://docs.flutter.dev/add-to-app/ios/add-flutter-screen)

---

## Android 集成

### 方式一：使用 FlutterFragment（推荐）

#### 1. 在 settings.gradle 中添加 Flutter

```groovy
// 在 settings.gradle 中添加
include ':app'
setBinding(new Binding([gradle: this]))
evaluate(new File(
    settingsDir.parentFile,
    'my_app_module/.android/include_flutter.groovy'
))
```

#### 2. 在 app/build.gradle 中添加依赖

```groovy
dependencies {
    implementation project(':flutter')
}
```

#### 3. 在 Kotlin 中使用 Flutter

```kotlin
import io.flutter.embedding.android.FlutterFragment
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 创建 FlutterFragment
        val flutterFragment = FlutterFragment.createDefault()

        // 添加到布局
        supportFragmentManager
            .beginTransaction()
            .add(R.id.fragment_container, flutterFragment)
            .commit()
    }
}
```

### 方式二：使用 FlutterActivity

```kotlin
import io.flutter.embedding.android.FlutterActivity

// 启动完整的 Flutter 界面
class MainActivity : AppCompatActivity() {
    fun openFlutterScreen(view: View) {
        startActivity(
            FlutterActivity.createDefaultIntent(this)
        )
    }
}
```

### 方式三：使用 FlutterEngine（高级用法）

```kotlin
import io.flutter.embedding.engine.FlutterEngine

class MyApplication : Application() {
    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()

        // 预热 Flutter 引擎
        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        FlutterEngineCache.getInstance().put("my_engine", flutterEngine)
    }
}

// 在 Activity 中使用预热的引擎
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val flutterEngine = FlutterEngineCache.getInstance().get("my_engine")
        val flutterFragment = FlutterFragment.withCachedEngine("my_engine").build()

        supportFragmentManager
            .beginTransaction()
            .add(R.id.fragment_container, flutterFragment)
            .commit()
    }
}
```

---

## 测试 Module

### 测试独立运行

```bash
cd my_app_module
flutter run
```

### 测试嵌入到 iOS 应用

```bash
cd my_app_module/.ios/Flutter
pod install
cd ../..
flutter run
```

### 测试嵌入到 Android 应用

```bash
cd .android
./gradlew assembleDebug
```

---

## 常见问题

### Q: 如何与原生应用通信？

**A:** 使用 **Platform Channels**（MethodChannel、EventChannel）

```dart
// Flutter 端
import 'package:flutter/services.dart';

class NativeBridge {
    static const platform = MethodChannel('com.myapp.module');

    Future<void> callNativeMethod() async {
        try {
            final result = await platform.invokeMethod('getNativeData');
            print('Native result: $result');
        } catch (e) {
            print('Error: $e');
        }
    }
}
```

```swift
// iOS 端
let controller = flutterEngine.binaryMessenger
let channel = FlutterMethodChannel(name: "com.myapp.module", binaryMessenger: controller)

channel.setMethodCallHandler({ [weak self] (call, result) in
    switch call.method {
    case "getNativeData":
        result("Native data here")
    default:
        result(FlutterMethodNotImplemented)
    }
})
```

```kotlin
// Android 端
MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.myapp.module").setMethodCallHandler { call, result ->
    if (call.method == "getNativeData") {
        result.success("Native data here")
    } else {
        result.notImplemented()
    }
}
```

### Q: 如何只显示特定页面？

**A:** 使用路由或创建专门的入口 Widget

```dart
// 创建一个只显示特定页面的 Widget
class CounterPageView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ProviderScope(
            child: MaterialApp(
                home: CounterPage(), // 只显示计数器页面
            ),
        );
    }
}
```

### Q: 如何共享数据？

**A:** 使用 Platform Channels、SharedPreferences，或通过原生应用的依赖注入

### Q: 性能优化建议？

**A**:
1. 预热 FlutterEngine 以减少首次加载时间
2. 使用 FlutterEngineCache 复用引擎
3. 避免频繁创建/销毁 FlutterViewController/Fragment
4. 使用 `FlutterFragment.withCachedEngine()` 复用引擎

---

## 参考资源

- [Flutter Add-to-App iOS](https://docs.flutter.dev/add-to-app/ios/add-flutter-screen)
- [Flutter Add-to-App Android](https://docs.flutter.dev/add-to-app/android/add-flutter-screen)
- [Flutter Platform Channels](https://docs.flutter.dev/development/platform-integration/platform-channels)
- [Clean Architecture Flutter](https://resocoder.com/flutter-clean-architecture/)
