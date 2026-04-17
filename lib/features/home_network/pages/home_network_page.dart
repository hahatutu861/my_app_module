import 'package:flutter/material.dart';
import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/core/design/app_spacing_extension.dart';

import '../widgets/action_section.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/network_topology.dart';
import '../widgets/progress_section.dart';

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
