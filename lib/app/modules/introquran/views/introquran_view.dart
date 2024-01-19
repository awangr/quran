import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:quran/app/routes/app_pages.dart';
import 'package:quran/app/constan/color.dart';
import '../controllers/introquran_controller.dart';

class IntroquranView extends GetView<IntroquranController> {
  const IntroquranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Al-Quran Apps",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Get.isDarkMode ? crm : DarkPurple),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Sesibuk itukah kamu sampai belum membaca Al-Quran",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Get.isDarkMode ? crm : DarkPurple),
              ),
            ),
            SizedBox(height: 70),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 300,
                height: 300,
                child: LottieBuilder.asset("assets/lottie_files/woman.json"),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.HOMEQURAN),
              child: Text(
                "GET STARTED",
                style: TextStyle(color: crm),
              ),
              style: ElevatedButton.styleFrom(
                /*   primary: Get.isDarkMode ? crm : Appurple, */
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: blue,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
