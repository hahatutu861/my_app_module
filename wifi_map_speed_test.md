# WiFi Map 测速逻辑

## 一、测速触发

用户可以在两个地方发起测速：

1. **地图页面**：选中某个房间后，点击底部"开始测速"按钮
2. **历史记录页面**：进入某个房间的测速历史后，点击"测速"按钮

## 二、测速前检查

点击测速按钮后，系统会先检查当前设备是否已连接到目标WiFi（通过`MethodChannelManagerRoom.checkWifiAllow()`检查）

- **如果已连接** → 立即开始测速
- **如果未连接** → 弹出提示框，引导用户去连接WiFi

## 三、测速过程

- 调用原生方法`startSpeedTest()`启动测速
- 整个测速过程持续 **5秒**
- 每秒更新一次进度条（共5个进度阶段，每个阶段增加20%）
- 实时监听测速事件，收集多次测速数据

## 四、测速结果处理

- 收集测速过程中的多个速度值，**排序后取中间值**（如果有多次结果，取排序后的第2个值）
- 同时记录以下信息：
  - WiFi频段（2.4G/5G）
  - WiFi频道
  - 信号强度（RSSI）
  - 当前连接的WiFi名称和MAC地址
  - 测速时间戳

## 五、速度等级划分

系统根据测速结果将网络质量分为三个等级：

| 等级 | 速度范围 | 显示颜色 |
|------|----------|----------|
| 良好 | ≥ 50 Mbps | 绿色 |
| 一般 | ≥ 10 Mbps 且 < 50 Mbps | 黄色 |
| 弱 | < 10 Mbps | 红色 |

## 六、数据存储与展示

- 测速结果会保存到对应的**房间记录**中
- 在地图上根据速度等级显示不同颜色的房间格子
- 用户可以进入历史记录页面查看每个房间历次的测速记录

## 七、数据来源

### 通信机制

Flutter与原生平台之间通过 **EventChannel** 实时通信：

```dart
static const eventChannel =
    EventChannel('hitroncloud.wifiTest.flutter.message/getSpeedTest');
```

### 数据流向

1. **原生平台（iOS/Android）** 在测速过程中，通过系统的WiFi API获取信息
2. 原生平台通过EventChannel将数据实时推送给Flutter
3. Flutter接收并解析数据：

| 信息 | 字段名 | 来源 |
|------|--------|------|
| WiFi频段 | wifiBand | 原生平台WiFi API |
| WiFi频道 | wifiChannel | 原生平台WiFi API |
| 信号强度 | wifiRssi | 原生平台WiFi API |
| WiFi名称 | connectToName | 原生平台WiFi API |
| MAC地址 | connectToMac | 原生平台WiFi API |

**Flutter本身无法直接获取这些WiFi信息**，必须依赖原生平台（iOS的Core Location/Network框架，Android的WifiManager等）来获取，然后通过EventChannel实时推送回Flutter层。

---

## 流程图

```
用户点击测速
     ↓
检查WiFi连接状态
     ↓
    ┌─ 已连接 ──→ 启动测速（5秒）
    │                 ↓
    │           实时收集速度数据
    │                 ↓
    │           排序取中间值
    │                 ↓
    │           记录WiFi信息
    │                 ↓
    │           保存到房间记录
    │                 ↓
    │           地图显示颜色
    │
    └─ 未连接 ──→ 弹出连接提示框
                      ↓
                 引导用户连接WiFi
```
