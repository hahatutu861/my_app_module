import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app_module/views/counter/counter_page.dart';

import 'package:my_app_module/views/wifi_map/wifi_history_page.dart';
import 'package:my_app_module/views/wifi_map/wifi_map_empty_page.dart';
import 'package:my_app_module/views/wifi_map/wifi_map_page.dart';


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
        builder: (context, state) {
          final floorId = state.uri.queryParameters['floorId'];
          return WifiMapPage(floorId: floorId);
        },
      ),
      GoRoute(
        path: '/wifi-map-empty',
        name: 'wifiMapEmpty',
        builder: (context, state) => const WifiMapEmptyPage(),
      ),
      GoRoute(
        path: '/wifi-history',
        name: 'wifiHistory',
        builder: (context, state) {
          final roomIndex = int.tryParse(
            state.uri.queryParameters['roomIndex'] ?? '',
          );
          return WifiHistoryPage(roomIndex: roomIndex);
        },
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
});
