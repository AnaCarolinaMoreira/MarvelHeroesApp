import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class AppWidget extends StatelessWidget {
  String appName;
  AppWidget(this.appName, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: appName,
      theme: ThemeData(
        fontFamily: 'ComicNeue',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
