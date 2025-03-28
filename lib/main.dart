import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelheroes_app/app/config/modular/app_module.dart';
import 'package:marvelheroes_app/app/config/modular/app_widget.dart';
import 'package:marvelheroes_app/app/modules/dashboard/presenter/screens/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => initApp();

void initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  //SharedPreferences
  SharedPreferences onboardingSharedPreferences =
      await SharedPreferences.getInstance();

  return runApp(
    ModularApp(
      module: AppModule(
        onboardingSharedPreferences: onboardingSharedPreferences,
      ),
      child: AppWidget('Marvel Heroes'),
    ),
  );
}

class MyApp extends StatelessWidget {
  //color red marvel #ed1a23
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Heroes',
      theme: ThemeData(
        fontFamily: 'ComicNeue',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}
