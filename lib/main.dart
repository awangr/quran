import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/app/change/colors.dart';
import 'app/change/change_color.dart';
import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      //   home: ChangeColor(),
      theme: ThemeData.light(), //
      darkTheme: ThemeData.dark(),

      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
