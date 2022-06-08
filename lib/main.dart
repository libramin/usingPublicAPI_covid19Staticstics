import 'package:covid19staticstics/controller/covid_statistics_cotroller.dart';
import 'package:covid19staticstics/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder((){
        Get.put(CovidStatisticsController());
      }),
      title: 'covid19-staticstics',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home : const HomeScreen()
    );
  }
}

