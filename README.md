# my_app_module - Flutter Module

这是一个使用 **Clean Architecture** + **Riverpod** 的 Flutter Module，可以嵌入到现有的 iOS 和 Android 原生应用中。

## 📱 功能特性

- ✅ **Clean Architecture** - 分层架构设计（Domain/Data/Presentation）
- ✅ **Riverpod** - 状态管理和依赖注入
- ✅ **GoRouter** - 声明式路由导航
- ✅ **网络拓扑可视化** - 交互式网络拓扑图
- ✅ **计数器示例** - 完整的 Clean Architecture 示例
- ✅ **国际化** - 支持英语/法语
- ✅ **主题系统** - 亮色/暗色模式自动切换

## 🚀 快速开始

### 前置要求

- Flutter SDK >= 3.11.0
- Dart SDK >= 3.11.0
- Xcode（iOS 集成）或 Android Studio（Android 集成）

### 安装依赖

```bash
flutter pub get
```

### 代码生成

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 生成本地化

```bash
flutter gen-l10n
```

## 📖 使用方法

### 方式一：嵌入到原生应用

参考 [集成指南](docs/INTEGRATION_GUIDE.md) 了解如何将此 module 嵌入到 iOS 或 Android 应用中。

#### iOS 集成示例

```swift
import Flutter

let flutterEngine = FlutterEngine(name: "my flutter engine")
flutterEngine.run()

let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
```

#### Android 集成示例

```kotlin
import io.flutter.embedding.android.FlutterFragment

val flutterFragment = FlutterFragment.createDefault()
supportFragmentManager.beginTransaction()
    .add(R.id.fragment_container, flutterFragment)
    .commit()
```

### 方式二：独立运行调试

```bash
# 在 iOS 模拟器上运行
flutter run

# 在 Android 模拟器上运行
flutter run -d android
```

## 🏗️ 项目结构

```
lib/
├── core/                      # 核心层
│   ├── design/               # 设计系统（颜色、主题）
│   ├── errors/               # 错误处理
│   ├── network/              # 网络层（Dio、网络状态）
│   └── routing/              # 路由配置
├── features/                  # 功能模块
│   ├── counter/              # 计数器功能（完整示例）
│   │   ├── data/             # 数据层
│   │   ├── domain/           # 领域层
│   │   └── presentation/     # 表现层
│   └── home_network/         # 网络拓扑功能
│       └── presentation/     # 表现层
├── shared/                    # 共享资源
│   ├── ui/                   # UI 组件、主题
│   ├── utils/                # 工具类
│   └── widgets/              # 共享 Widget
└── main.dart                 # Module 入口
```

## 🎨 Clean Architecture 分层

每个 feature 遵循以下结构：

```
feature/
├── data/                    # 数据层
│   ├── datasources/        # 数据源（本地/远程）
│   ├── models/             # 数据模型（DTO）
│   └── repositories/       # 仓储实现
├── domain/                  # 领域层
│   ├── entities/           # 领域实体
│   ├── repositories/       # 仓储接口
│   └── usecases/           # 用例
└── presentation/            # 表现层
    ├── pages/              # 页面
    ├── providers/          # Riverpod StateNotifier
    └── widgets/            # 组件
```

## 📱 可用的页面

| 路由 | 页面 | 描述 |
|------|------|------|
| `/` | HomeNetworkPage | 网络拓扑主页 |
| `/counter` | CounterPage | 计数器示例页面 |

## 🔧 开发指南

### 添加新功能

1. 在 `lib/features/` 下创建新的 feature 目录
2. 按照 Clean Architecture 结构组织代码
3. 在 `app_router.dart` 中添加路由
4. 运行 `build_runner` 生成代码

### 状态管理

使用 **Riverpod** + **StateNotifier**：

```dart
// 定义状态
@freezed
class MyState with _$MyState {
  const factory MyState.initial() = _Initial;
  const factory MyState.loading() = _Loading;
  const factory MyState.data(String data) = _Data;
  const factory MyState.error(String message) = _Error;
}

// 定义 Notifier
class MyNotifier extends StateNotifier<MyState> {
  MyNotifier(this._useCase) : super(MyState.initial());

  final FetchDataUseCase _useCase;

  Future<void> fetchData() async {
    state = MyState.loading();
    final result = await _useCase();
    result.fold(
      (error) => state = MyState.error(error.message),
      (data) => state = MyState.data(data),
    );
  }
}

// 定义 Provider
final myNotifierProvider = StateNotifierProvider<MyNotifier, MyState>((ref) {
  return MyNotifier(ref.watch(fetchDataUseCaseProvider));
});
```

### 网络请求

使用 **Dio** 进行网络请求：

```dart
final dioClient = DioClient();
final response = await dioClient.get('/api/endpoint');
```

### 本地存储

使用 **SharedPreferences** 或 **path_provider**：

```dart
// SharedPreferences
final prefs = await SharedPreferences.getInstance();
await prefs.setString('key', 'value');

// Path Provider
final directory = await getApplicationDocumentsDirectory();
```

## 🧪 测试

```bash
# 运行所有测试
flutter test

# 运行单个测试文件
flutter test test/features/counter/presentation/providers/counter_provider_test.dart
```

## 📚 依赖说明

| 包名 | 版本 | 用途 |
|------|------|------|
| flutter_riverpod | ^2.6.1 | 状态管理 |
| go_router | ^14.6.2 | 路由导航 |
| dio | ^5.7.0 | 网络请求 |
| freezed | ^2.5.7 | 不可变数据类 |
| json_serializable | ^6.9.2 | JSON 序列化 |
| lottie | ^3.1.3 | Lottie 动画 |

## 📖 相关文档

- [集成指南](docs/INTEGRATION_GUIDE.md) - 如何嵌入到原生应用
- [Clean Architecture 教程](docs/Clean_Architecture_小学生版.md)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License
