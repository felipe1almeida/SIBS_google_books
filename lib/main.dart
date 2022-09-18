import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibs_books/routes/sibs_pages.dart';

import 'bindings/initial_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SIBS Google Books',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBinding(),
      getPages: SibsPages.pages,
    );
  }
}
