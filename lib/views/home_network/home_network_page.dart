import 'package:flutter/material.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';

import 'package:my_app_module/widgets/action_section.dart';
import 'package:my_app_module/widgets/custom_app_bar.dart';
import 'package:my_app_module/widgets/network_topology.dart';
import 'package:my_app_module/widgets/progress_section.dart';

class HomeNetworkPage extends StatelessWidget {
  const HomeNetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: context.appColors.fontWh1with100Opacity,
      body: Column(
        children: [
          SizedBox(height: statusBarHeight),
          const CustomAppBar(),
          Expanded(
            child: Column(
              children: [
                const ProgressSection(),
                const SizedBox(height: 30),
                Expanded(child: const NetworkTopology()),
              ],
            ),
          ),
          const ActionSection(),
        ],
      ),
    );
  }
}
