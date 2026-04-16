import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/features/counter/presentation/pages/counter_page.dart';
import 'package:my_app_module/features/home_network/presentation/pages/home_network_page.dart';

import '../../features/wifi_map/presentation/pages/wifi_map_empty_page.dart';
import '../../features/wifi_map/presentation/pages/wifi_map_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const WifiMapEmptyPage(),
      ),
      GoRoute(
        path: '/counter',
        name: 'counter',
        builder: (context, state) => const CounterPage(),
      ),
      GoRoute(
        path: '/wifi-map',
        name: 'wifiMap',
        builder: (context, state) => const WifiMapPage(),
      ),
      GoRoute(
        path: '/wifi-map-empty',
        name: 'wifiMapEmpty',
        builder: (context, state) => const WifiMapEmptyPage(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
});
