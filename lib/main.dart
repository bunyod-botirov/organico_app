import 'package:flutter/material.dart';
import 'package:organico_app/core/components/theme_comp.dart';
import 'package:organico_app/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeComp.themeData,
      onGenerateRoute: AppRouter().onGenerateRoute,
      initialRoute: "/splash",
    );
  }
}
