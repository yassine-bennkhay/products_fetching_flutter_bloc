// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:real_estate_app_ui/routers.dart';

void main() {
  runApp( MyApp(appRoutes: AppRoutes(),));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRoutes,
  }) : super(key: key);
final AppRoutes appRoutes;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',
      theme: ThemeData(fontFamily: "Qanelas"),
    onGenerateRoute: appRoutes.generateRoutes,
    );
  }
}
