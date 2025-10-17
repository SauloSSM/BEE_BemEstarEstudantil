import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:app_project/controller/mood_tracker_controller.dart';
import 'package:app_project/controller/positive_habits_controller.dart';
import 'package:app_project/controller/self_reflection_controller.dart';
import 'package:app_project/view/splash_screen.dart';
import 'package:app_project/view/login_view.dart';
import 'package:app_project/view/register_view.dart';
import 'package:app_project/view/forgot_password_view.dart';
import 'package:app_project/view/home_view.dart';
import 'package:app_project/view/about_view.dart';
import 'package:app_project/view/funcionalidade_mood_tracker_view.dart';
import 'package:app_project/view/funcionalidade_daily_mindfulness_view.dart';
import 'package:app_project/view/funcionalidade_wellness_dashboard_view.dart';
import 'package:app_project/view/funcionalidade_self_reflection_view.dart';
import 'package:app_project/view/funcionalidade_positive_habits_view.dart';

// BEE - Bem Estar Estudantil

final g = GetIt.instance;

void setupLocator() {
  g.registerFactory(() => MoodTrackerController());
  g.registerFactory(() => PositiveHabitsController());
  g.registerFactory(() => SelfReflectionController());
}

void main() {
  setupLocator();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFF2EDDC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE3DECC),
        ),
      ),
      // Define as rotas do aplicativo
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/forgot_password': (context) => const ForgotPasswordView(),
        '/home': (context) => const HomeView(),
        '/about': (context) => const AboutView(),
        '/mood_tracker': (context) => const FuncionalidadeMoodTrackerView(),
        '/daily_mindfulness': (context) => const FuncionalidadeDailyMindfulnessView(),
        '/wellness_dashboard': (context) => const FuncionalidadeWellnessDashboardView(),
        '/self_reflection': (context) => const FuncionalidadeSelfReflectionView(),
        '/positive_habits': (context) => const FuncionalidadePositiveHabitsView(),
      },
      initialRoute: '/', // A rota inicial é a splash screen
    );
  }
}
