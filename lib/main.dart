import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_simple_crud/presentation/main/main_binding.dart';
import 'package:my_simple_crud/presentation/main/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Simple CRUD App',
      getPages: Pages.routes,
      initialRoute: Pages.initailRoutes,
      initialBinding: MainBinding(),
    );
  }
}
