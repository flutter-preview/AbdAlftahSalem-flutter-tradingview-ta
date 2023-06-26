import 'package:flutter/material.dart';
import 'package:flutter_tradingview_ta/view/home_screen.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter trading view',
      home: HomeScreen(),
    );
  }
}
