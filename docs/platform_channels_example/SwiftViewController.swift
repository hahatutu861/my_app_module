//
//  FlutterViewController.swift
//  iOS App with Flutter Module
//
//  此文件展示如何在 iOS Swift 代码中集成 Flutter Module
//

import UIKit
import Flutter

// MARK: - 方式一：完整的 Flutter View Controller
class FlutterViewController: UIViewController {

    private var flutterEngine: FlutterEngine?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlutter()
    }

    private func setupFlutter() {
        // 1. 创建 Flutter 引擎
        flutterEngine = FlutterEngine(name: "my flutter engine")
        flutterEngine?.run()

        // 2. 注册 Plugin
        // GeneratedPluginRegistrant.register(with: flutterEngine!)

        // 3. 创建 Flutter View Controller
        let flutterVC = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

        // 4. 设置 Method Channel 处理器
        setupMethodChannels(engine: flutterEngine!)

        // 5. 添加为子视图
        addChild(flutterVC)
        view.addSubview(flutterVC.view)
        flutterVC.view.frame = view.bounds
        flutterVC.didMove(toParent: self)
    }

    private func setupMethodChannels(engine: FlutterEngine) {
        let controller = engine.binaryMessenger
        let channel = FlutterMethodChannel(name: "com.myapp.module", binaryMessenger: controller)

        channel.setMethodCallHandler { [weak self] (call, result) in
            switch call.method {
            case "getNativeData":
                // 处理来自 Flutter 的请求
                result("Native data from iOS")

            case "getDeviceInfo":
                // 返回设备信息
                let info: [String: Any] = [
                    "platform": "iOS",
                    "version": UIDevice.current.systemVersion,
                    "model": UIDevice.current.model
                ]
                result(info)

            case "navigateToNativeScreen":
                // 导航到原生页面
                self?.navigateToNativeScreen()
                result(nil)

            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }

    private func navigateToNativeScreen() {
        let nativeVC = UIViewController()
        nativeVC.view.backgroundColor = .systemBackground
        nativeVC.title = "Native Screen"
        navigationController?.pushViewController(nativeVC, animated: true)
    }

    deinit {
        // 清理 Flutter 引擎
        flutterEngine?.destroyContext()
    }
}

// MARK: - 方式二：使用 FlutterAppDelegate（推荐用于完整应用）
@main
class AppDelegate: FlutterAppDelegate {

    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // 预热 Flutter 引擎（提高性能）
        flutterEngine.run()

        // 注册 plugins
        GeneratedPluginRegistrant.register(with: flutterEngine)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

// MARK: - 方式三：在现有 View Controller 中显示 Flutter
class ExistingViewController: UIViewController {

    private var flutterEngine: FlutterEngine?

    @IBAction func showFlutterButtonTapped(_ sender: UIButton) {
        // 使用 AppDelegate 中预热的引擎
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let flutterVC = FlutterViewController(engine: appDelegate.flutterEngine, nibName: nil, bundle: nil)
        present(flutterVC, animated: true)
    }
}

// MARK: - 方式四：显示特定 Flutter 路由
class FlutterWithInitialRouteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let flutterVC = FlutterViewController(engine: appDelegate.flutterEngine, nibName: nil, bundle: nil)

        // 设置初始路由
        flutterVC.setInitialRoute("/counter")

        present(flutterVC, animated: true)
    }
}

// MARK: - 方式五：使用自定义 FlutterEngine（多引擎场景）
class MultiFlutterEngineViewController: UIViewController {

    private var engines: [FlutterEngine] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建多个独立的 Flutter 引擎
        for i in 1...3 {
            let engine = FlutterEngine(name: "flutter_engine_\(i)")
            engine.run()
            engines.append(engine)
        }
    }

    func showFlutterScreen(at index: Int) {
        guard index < engines.count else { return }
        let engine = engines[index]
        let flutterVC = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        present(flutterVC, animated: true)
    }

    deinit {
        // 清理所有引擎
        engines.forEach { $0.destroyContext() }
    }
}
