import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/screens/splash_screen/splash_screen.dart';
import 'package:weather_app/service/cache_service/cache_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color.fromRGBO(255, 255, 255, 1),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            title: 'ERP',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Overpass',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
              appBarTheme: const AppBarTheme(
                surfaceTintColor: Colors.transparent,
              ),
              useMaterial3: true,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.transparent,
              ),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
