import 'package:flutter/material.dart';
import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/core/design/app_spacing_extension.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/progress_section.dart';
import '../widgets/network_topology.dart';
import '../widgets/action_section.dart';

class HomeNetworkPage extends StatefulWidget {
  const HomeNetworkPage({super.key});

  @override
  State<HomeNetworkPage> createState() => _HomeNetworkPageState();
}

class _HomeNetworkPageState extends State<HomeNetworkPage> {
  void _handleBackgroundTap() {
    // 点击背景时隐藏气泡
    editTitleBarController.hideBubble();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: GestureDetector(
        onTap: _handleBackgroundTap,
        behavior: HitTestBehavior.translucent,
        child: Column(
          children: [
            SizedBox(height: statusBarHeight),
            const CustomAppBar(),
            Expanded(
              child: Column(
                children: [
                  ProgressSection(),
                  Spacing.v30,
                  NetworkTopology(onEditBubbleTap: _handleBackgroundTap),
                ],
              ),
            ),
            const ActionSection(),
          ],
        ),
      ),
    );
  }
}
