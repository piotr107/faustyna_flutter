import 'dart:io';

import 'package:faustyna/constants/constants.dart';
import 'package:faustyna/pages/home/home_view.dart';
import 'package:faustyna/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(RestApi());
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Faustyna',
        theme: ThemeData(
            primarySwatch: MAIN_COLOR,
            bottomAppBarColor: MAIN_COLOR
        ),
        home: HomePage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}