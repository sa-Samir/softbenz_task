import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:softbenz_task/bindings/controller_binding.dart';
import 'package:softbenz_task/utils/constants.dart';
import 'package:softbenz_task/views/home.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Constants.pColor,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maahuri',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Constants.pColor,
      ),
      home: const AppBase(),
      initialBinding: ControllerBinding(),
    );
  }
}
