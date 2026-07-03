/// 应用颜色配置
///
/// 设计系统颜色常量（无框架依赖）
/// 源自 Android colors.xml 的设计系统颜色
/// 严格按照原始命名，不做任何修改
///
/// 架构说明：
/// - 此类属于 Core Layer，不依赖任何框架
/// - 使用 int 存储颜色值，可移植到其他平台
/// - shared/ui/theme 负责将其转换为框架特定的 Color 对象
library;

/// 亮色主题颜色常量
class AppColors {
  AppColors._();

  // ============== 品牌色 (Brand) ==============
  /// 品牌主色-浅色 #E9F4FD
  static const int brand1Light = 0xFFE9F4FD;

  /// 品牌主色-浅色(夜间) #E9F4FD
  static const int brand1LightNight = 0xFFE9F4FD;

  /// 品牌聚焦色 #C9E4FA
  static const int brand2Focus = 0xFFC9E4FA;

  /// 设备卡片渐变结束色 #D0D8F0
  static const int deviceCardGradientEnd = 0xFFD0D8F0;

  /// 品牌禁用色 #95C8F5
  static const int brand3Disabled = 0xFF95C8F5;

  /// 品牌正常色 #0572E6
  static const int brand6Normal = 0xFF0572E6;

  /// 品牌深色 #00489F
  static const int brand8 = 0xFF00489F;

  /// 品牌深色(20%透明度) #3300489F
  static const int brand8with20Opacity = 0x3300489F;

  // ============== 青色系 (Cyan) ==============
  /// 青色6 #07A2B3
  static const int cyan6 = 0xFF07A2B3;

  /// 青色 #00A3E0
  static const int cyan = 0xFF00A3E0;

  // ============== 浅蓝色系 (Light Blue) ==============
  /// 浅蓝4 #61C0EF
  static const int lightBlue4 = 0xFF61C0EF;

  /// 浅蓝5 #30A9E9
  static const int lightBlue5 = 0xFF30A9E9;

  /// 浅蓝6 #0292E4
  static const int lightBlue6 = 0xFF0292E4;

  /// 浅蓝2 #C8EBFA
  static const int lightBlue2 = 0xFFC8EBFA;

  /// 浅蓝3 #93D6F4
  static const int lightBlue3 = 0xFF93D6F4;

  // ============== 紫色系 (Purple & Violet) ==============
  /// 紫色6 #9C29B3
  static const int purple6 = 0xFF9C29B3;

  /// 紫罗兰1 #EFECF9
  static const int violet1 = 0xFFEFECF9;

  /// 紫罗兰2 #D9D0F2
  static const int violet2 = 0xFFD9D0F2;

  /// 紫罗兰3 #B7A5E5
  static const int violet3 = 0xFFB7A5E5;

  /// 紫罗兰6 #6539BF
  static const int violet6 = 0xFF6539BF;

  /// 靛蓝1 #ECEFF7
  static const int indigo1 = 0xFFECEFF7;

  /// 靛蓝6 #3E51B3
  static const int indigo6 = 0xFF3E51B3;

  // ============== 绿色系 (Green & Success) ==============
  /// 成功禁用色 #A5E1A6
  static const int success3Disabled = 0xFFA5E1A6;

  /// 成功正常色 #3CB345
  static const int success6Normal = 0xFF3CB345;

  /// 浅绿5 #92C25B
  static const int lightGreen5 = 0xFF92C25B;

  /// 柠檬绿1 #F2FAE6
  static const int lime1 = 0xFFF2FAE6;

  /// 柠檬绿6 #98C902
  static const int lime6 = 0xFF98C902;

  /// 绿色 #7FBB21
  static const int green = 0xFF7FBB21;

  /// 青绿6 #02B39D
  static const int teal6 = 0xFF02B39D;

  // ============== 黄橙色系 (Yellow & Warning) ==============
  /// 警告浅色 #FEF7EA
  static const int warning1Light = 0xFFFEF7EA;

  /// 警告聚焦色 #FCEBCB
  static const int warning2Focus = 0xFFFCEBCB;

  /// 警告4 #F7BC65
  static const int warning4 = 0xFFF7BC65;

  /// 警告正常色 #F28103
  static const int warning6Normal = 0xFFF28103;

  /// 黄色1 #FEFCEA
  static const int yellow1 = 0xFFFEFCEA;

  /// 黄色6 #F0C003
  static const int yellow6 = 0xFFF0C003;

  // ============== 红色系 (Error) ==============
  /// 错误浅色 #FDF1ED
  static const int error1Light = 0xFFFDF1ED;

  /// 错误正常色 #EF3621
  static const int error6Normal = 0xFFEF3621;

  // ============== 灰色系 (Gray) ==============
  /// 灰色1 #F3F3F3
  static const int gray1 = 0xFFF3F3F3;

  /// 灰色1(夜间) #F3F3F3
  static const int gray1Night = 0xFFF3F3F3;

  /// 灰色2 #EEEEEE
  static const int gray2 = 0xFFEEEEEE;

  /// 灰色3 #E7E7E7
  static const int gray3 = 0xFFE7E7E7;

  /// 灰色4 #DCDCDC
  static const int gray4 = 0xFFDCDCDC;

  /// 灰色5 #C5C5C5
  static const int gray5 = 0xFFC5C5C5;

  /// 灰色6 #A6A6A6
  static const int gray6 = 0xFFA6A6A6;

  /// 灰色7 #8B8B8B
  static const int gray7 = 0xFF8B8B8B;

  /// 灰色14 #181818
  static const int gray14 = 0xFF181818;

  /// 灰色14(夜间) #FFFFFFFF
  static const int gray14Night = 0xFFFFFFFF;

  /// 灰色14(20%透明度) #33181818
  static const int gray14with20Opacity = 0x33181818;

  // ============== 基础色 ==============
  /// 白色 #FFFFFFFF
  static const int white = 0xFFFFFFFF;

  /// 黑色 #FF000000
  static const int black = 0xFF000000;

  // ============== 文字颜色 (Font Colors) ==============
  /// 字体灰 #FF000000
  static const int fontGy = 0xFF000000;

  /// 字体灰0 #00000000
  static const int fontGy0 = 0x00000000;

  /// 字体灰1(90%透明度) #E6000000
  static const int fontGy1with90Opacity = 0xE6000000;

  /// 字体灰2(60%透明度) #99000000
  static const int fontGy2with60Opacity = 0x99000000;

  /// 字体灰3(40%透明度) #66000000
  static const int fontGy3with40Opacity = 0x66000000;

  /// 字体灰4(26%透明度) #42000000
  static const int fontGy4with26Opacity = 0x42000000;

  /// 字体白1(100%透明度) #FFFFFFFF
  static const int fontWh1with100Opacity = 0xFFFFFFFF;

  /// 字体白2(55%透明度) #8CFFFFFF
  static const int fontWh2with55Opacity = 0x8CFFFFFF;

  /// 字体白1(0%透明度) #00FFFFFF
  static const int fontWh1with0Opacity = 0x00FFFFFF;

  // ============== 特殊用途颜色 ==============
  /// 弹窗背景色 #FFFFFFFF
  static const int popupTextBg = 0xFFFFFFFF;

  /// 按钮文字色 #FFFFFFFF
  static const int buttonText = 0xFFFFFFFF;

  /// 私密模式弹窗背景色 #FFC9E4FA
  static const int privateModePopupBg = 0xFFC9E4FA;

  /// 按钮禁用文字色 #FFFFFFFF
  static const int buttonTextDisable = 0xFFFFFFFF;

  /// 刷新背景色 #FFE7E7E7
  static const int refreshBg = 0xFFE7E7E7;

  /// 扫码背景色 #E6000000
  static const int scanQrCodeBg = 0xE6000000;

  /// 扫码描述文字色 #8CFFFFFF
  static const int scanQrCodeTextDescription = 0x8CFFFFFF;

  /// 扫码图形背景色 #38FFFFFF
  static const int scanQrCodeGraphicBg = 0x38FFFFFF;
}

/// 暗色主题颜色常量
class AppColorsDark {
  AppColorsDark._();

  // ============== 品牌色 (Brand) - 暗色模式 ==============
  /// 品牌主色-浅色 #33338FEB
  static const int brand1Light = 0x33338FEB;

  /// 品牌主色-浅色(夜间) #E9F4FD
  static const int brand1LightNight = 0xFFE9F4FD;

  /// 品牌聚焦色 #33338FEB
  static const int brand2Focus = 0x33338FEB;

  /// 设备卡片渐变结束色 #FFD0D8F0
  static const int deviceCardGradientEnd = 0xFFD0D8F0;

  /// 品牌禁用色 #0E2B4E
  static const int brand3Disabled = 0xFF0E2B4E;

  /// 品牌正常色 #338FEB
  static const int brand6Normal = 0xFF338FEB;

  /// 品牌深色 #95C8F5
  static const int brand8 = 0xFF95C8F5;

  /// 品牌深色(20%透明度) #3395C8F5
  static const int brand8with20Opacity = 0x3395C8F5;

  // ============== 青色系 (Cyan) - 暗色模式 ==============
  /// 青色6 #2DB6C2
  static const int cyan6 = 0xFF2DB6C2;

  /// 青色 #2EB7E6
  static const int cyan = 0xFF2EB7E6;

  // ============== 浅蓝色系 (Light Blue) - 暗色模式 ==============
  /// 浅蓝4 #0077C0
  static const int lightBlue4 = 0xFF0077C0;

  /// 浅蓝5 #0292E4
  static const int lightBlue5 = 0xFF0292E4;

  /// 浅蓝6 #30A9E9
  static const int lightBlue6 = 0xFF30A9E9;

  /// 浅蓝2 #004779
  static const int lightBlue2 = 0xFF004779;

  /// 浺蓝3 #005F9D
  static const int lightBlue3 = 0xFF005F9D;

  // ============== 紫色系 (Purple & Violet) - 暗色模式 ==============
  /// 紫色6 #B24AC2
  static const int purple6 = 0xFFB24AC2;

  /// 紫罗兰1 #337D59CC
  static const int violet1 = 0x337D59CC;

  /// 紫罗兰2 #421B82
  static const int violet2 = 0xFF421B82;

  /// 紫罗兰3 #4D2496
  static const int violet3 = 0xFF4D2496;

  /// 紫罗兰6 #7D59CC
  static const int violet6 = 0xFF7D59CC;

  /// 靛蓝1 #ECEFF7
  static const int indigo1 = 0xFFECEFF7;

  /// 靛蓝6 #5D6FC2
  static const int indigo6 = 0xFF5D6FC2;

  // ============== 绿色系 (Green & Success) - 暗色模式 ==============
  /// 成功禁用色 #26772F
  static const int success3Disabled = 0xFF26772F;

  /// 成功正常色 #5BC261
  static const int success6Normal = 0xFF5BC261;

  /// 浅绿5 #7AB33C
  static const int lightGreen5 = 0xFF7AB33C;

  /// 柠檬绿1 #33A5D42C
  static const int lime1 = 0x33A5D42C;

  /// 柠檬绿6 #A5D42C
  static const int lime6 = 0xFFA5D42C;

  /// 绿色 #97C944
  static const int green = 0xFF97C944;

  /// 青绿6 #29C2AD
  static const int teal6 = 0xFF29C2AD;

  // ============== 黄橙色系 (Yellow & Warning) - 暗色模式 ==============
  /// 警告浅色 #44331D
  static const int warning1Light = 0xFF44331D;

  /// 警告聚焦色 #792E00
  static const int warning2Focus = 0xFF792E00;

  /// 警告4 #CA6000
  static const int warning4 = 0xFFCA6000;

  /// 警告正常色 #F5A033
  static const int warning6Normal = 0xFFF5A033;

  /// 黄色1 #33F3D333
  static const int yellow1 = 0x33F3D333;

  /// 黄色6 #F3D333
  static const int yellow6 = 0xFFF3D333;

  // ============== 红色系 (Error) - 暗色模式 ==============
  /// 错误浅色 #33F2624B
  static const int error1Light = 0x33F2624B;

  /// 错误正常色 #F2624B
  static const int error6Normal = 0xFFF2624B;

  // ============== 灰色系 (Gray) - 暗色模式 ==============
  /// 灰色1 #242424
  static const int gray1 = 0xFF242424;

  /// 灰色1(夜间) #F3F3F3
  static const int gray1Night = 0xFFF3F3F3;

  /// 灰色2 #2C2C2C
  static const int gray2 = 0xFF2C2C2C;

  /// 灰色3 #383838
  static const int gray3 = 0xFF383838;

  /// 灰色4 #4B4B4B
  static const int gray4 = 0xFF4B4B4B;

  /// 灰色5 #5E5E5E
  static const int gray5 = 0xFF5E5E5E;

  /// 灰色6 #777777
  static const int gray6 = 0xFF777777;

  /// 灰色7 #8B8B8B
  static const int gray7 = 0xFF8B8B8B;

  /// 灰色14 #FFFFFFFF
  static const int gray14 = 0xFFFFFFFF;

  /// 灰色14(夜间) #181818
  static const int gray14Night = 0xFF181818;

  /// 灰色14(20%透明度) #33FFFFFF
  static const int gray14with20Opacity = 0x33FFFFFF;

  // ============== 基础色 - 暗色模式 ==============
  /// 白色(暗色模式下为黑色) #FF000000
  static const int white = 0xFFFFFFFF;

  /// 黑色(暗色模式下为白色) #FFFFFFFF
  static const int black = 0xFFFFFFFF;

  // ============== 文字颜色 (Font Colors) - 暗色模式 ==============
  /// 字体灰 #FF000000
  static const int fontGy = 0xFF000000;

  /// 字体灰0 #00000000
  static const int fontGy0 = 0x00000000;

  /// 字体灰1(90%透明度) #FFFFFFFF
  static const int fontGy1with90Opacity = 0xFFFFFFFF;

  /// 字体灰2(60%透明度) #8CFFFFFF
  static const int fontGy2with60Opacity = 0x8CFFFFFF;

  /// 字体灰3(40%透明度) #8CFFFFFF
  static const int fontGy3with40Opacity = 0x8CFFFFFF;

  /// 字体灰4(26%透明度) #38FFFFFF
  static const int fontGy4with26Opacity = 0x38FFFFFF;

  /// 字体白1(100%透明度) #E6000000
  static const int fontWh1with100Opacity = 0xE6000000;

  /// 字体白2(55%透明度) #99000000
  static const int fontWh2with55Opacity = 0x99000000;

  /// 字体白1(0%透明度) #E6000000
  static const int fontWh1with0Opacity = 0xE6000000;

  // ============== 特殊用途颜色 - 暗色模式 ==============
  /// 弹窗背景色 #FF2C2C2C
  static const int popupTextBg = 0xFF2C2C2C;

  /// 按钮文字色 #FFFFFFFF
  static const int buttonText = 0xFFFFFFFF;

  /// 私密模式弹窗背景色 #33338FEB
  static const int privateModePopupBg = 0x33338FEB;

  /// 按钮禁用文字色 #FF777777
  static const int buttonTextDisable = 0xFF777777;

  /// 刷新背景色 #42000000
  static const int refreshBg = 0x42000000;

  /// 扫码背景色 #E6000000
  static const int scanQrCodeBg = 0xE6000000;

  /// 扫码描述文字色 #8CFFFFFF
  static const int scanQrCodeTextDescription = 0x8CFFFFFF;

  /// 扫码图形背景色 #38FFFFFF
  static const int scanQrCodeGraphicBg = 0x38FFFFFF;
}
