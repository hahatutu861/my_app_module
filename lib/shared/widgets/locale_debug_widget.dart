import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app_module/l10n/app_localizations.dart';
import 'package:my_app_module/shared/utils/build_context_extension.dart';

/// 诊断当前语言设置的 Widget
class LocaleDebugWidget extends StatelessWidget {
  const LocaleDebugWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final systemLocale = PlatformDispatcher.instance.locale;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('🔍 语言诊断信息', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            _buildInfoRow('当前应用语言', locale.toString()),
            _buildInfoRow('系统语言', systemLocale.toString()),
            _buildInfoRow('语言代码', locale.languageCode),
            if (locale.countryCode != null)
              _buildInfoRow('国家代码', locale.countryCode!),
            const Divider(height: 32),
            _buildInfoRow('测试文本', context.l10n.networkReady),
            const SizedBox(height: 8),
            _buildInfoRow('Counter 页面标题', context.l10n.counterPage),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontFamily: 'monospace')),
          ),
        ],
      ),
    );
  }
}
