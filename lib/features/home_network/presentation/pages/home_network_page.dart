import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/core/design/app_spacing_extension.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/progress_section.dart';
import '../widgets/network_topology.dart';
import '../widgets/action_section.dart';

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
          const Expanded(
            child: Column(
              children: [
                ProgressSection(),
                Spacing.v30,
                Expanded(child: NetworkTopology()),
              ],
            ),
          ),
          const ActionSection(),
        ],
      ),
    );
  }
}
