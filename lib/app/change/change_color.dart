import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeColor extends StatefulWidget {
  ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.dark())
                  : Get.changeTheme(ThemeData.light());
            });
          },
          child: Text('Data'),
        ),
      ),
    );
  }
}
