import 'package:flutter/material.dart';
import 'package:my_app_module/l10n/app_localizations.dart';

/// BuildContext 扩展方法，提供安全的 AppLocalizations 访问
extension BuildContextLocalizationExtension on BuildContext {
  /// 获取 AppLocalizations，如果不存在则抛出详细的错误信息
  ///
  /// 使用场景：在 MaterialApp 的子组件中使用，确保 AppLocalizations 一定存在
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw FlutterError(
        'AppLocalizations.of(context) returned null.\n'
        'Ensure that your MaterialApp has the following configuration:\n'
        '```\n'
        'MaterialApp(\n'
        '  localizationsDelegates: AppLocalizations.localizationsDelegates,\n'
        '  supportedLocales: AppLocalizations.supportedLocales,\n'
        '  ...\n'
        ')\n'
        '```\n'
        'Context: $this',
      );
    }
    return localizations;
  }
}
