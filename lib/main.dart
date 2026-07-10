import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';
import 'routes/app_router.dart';
import 'shared/ui/theme/app_theme.dart';
import 'providers/theme_provider.dart';
import 'providers/shared_preferences_provider.dart';
import 'providers/app_runtime_config.dart';
import 'services/database/database_service.dart';
import 'shared/bridges/pigeon_generated.dart';

/// Flutter Module 主入口
/// 用于嵌入到原生应用中
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeMode initialThemeMode;
  String deviceId;
  String token;
  String? connectedDeviceName;
  String language;
  bool enableLog;
  try {
    final config = await NativeApi().getAppRuntimeConfig();
    initialThemeMode = convertToThemeMode(config.themeMode);
    deviceId = config.deviceId;
    token = config.accessToken;
    connectedDeviceName = config.connectedDeviceName;
    language = config.language;
    enableLog = config.enableLog;
  } catch (e) {
    initialThemeMode = ThemeMode.system;
    deviceId = '';
    token = '';
    connectedDeviceName = null;
    language = 'en';
    enableLog = false;
  }
  final prefs = await SharedPreferences.getInstance();
  await DatabaseService.instance.database;
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        themeModeProvider.overrideWith(() => ThemeModeNotifier(initialMode: initialThemeMode)),
        deviceIdProvider.overrideWithValue(deviceId),
        tokenProvider.overrideWithValue(token),
        connectedDeviceNameProvider.overrideWithValue(connectedDeviceName),
        languageProvider.overrideWithValue(language),
        enableLogProvider.overrideWithValue(enableLog),
      ],
      child: MyAppModule(),
    ),
  );
}

/// Flutter Module 根 Widget
class MyAppModule extends ConsumerWidget {
  const MyAppModule({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);
    final appLanguage = ref.watch(languageProvider);
    final appLocale = Locale(appLanguage);

    return MaterialApp.router(
      title: 'Clean Architecture Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      locale: appLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('fr')],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale?.languageCode == 'fr') {
          return const Locale('fr');
        }
        return const Locale('en');
      },
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          child: Builder(
            builder: (context) {
              final brightness = Theme.of(context).brightness;
              final isDark = brightness == Brightness.dark;
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: isDark
                    ? const SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.light,
                        systemNavigationBarColor: Color(0xFF1C1C1E),
                        systemNavigationBarIconBrightness: Brightness.light,
                      )
                    : const SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarIconBrightness: Brightness.dark,
                        systemNavigationBarColor: Colors.white,
                        systemNavigationBarIconBrightness: Brightness.dark,
                      ),
                child: child!,
              );
            },
          ),
        );
      },
      routerConfig: router,
    );
  }
}
