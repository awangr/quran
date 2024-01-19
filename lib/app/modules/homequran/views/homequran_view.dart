import 'package:flutter/material.dart';
import 'package:quran/app/model/juz.dart';
import 'package:quran/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:quran/app/model/surah.dart';
import 'package:quran/app/constan/color.dart';
import '../controllers/homequran_controller.dart';

class HomequranView extends GetView<HomequranController> {
  const HomequranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Get.isDarkMode ? black : black,
        elevation: Get.isDarkMode ? 0 : 4,
        title: Text('Al Quran Apps'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEARCH), //Masuk ke file search
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: TextStyle(
                  color: Get.isDarkMode ? crm : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [blue, Appurple]),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.toNamed(Routes
                        .TERAKHIR_DIBACA), //Masuk ke file Terakhir_baca.dart
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -50,
                            right: 0,
                            child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  "assets/logo/qoroa.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.menu_book_rounded,
                                        color: crm), //color dari import Color
                                    SizedBox(width: 10),
                                    Text(
                                      "Terakhir dibaca",
                                      style: TextStyle(color: crm),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Al-Fatihah",
                                  style: TextStyle(color: crm, fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Juz 1 | Ayat 6",
                                  style: TextStyle(color: crm),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "Surah",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Juz",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Bookmark",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Tidak Ada Data"),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: surah);
                              },
                              leading: Obx(
                                () => Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(controller.isDark.isTrue
                                          ? "assets/logo/octagona.png"
                                          : "assets/logo/octagona.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${surah.nomor}",
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                "${surah.namaLatin}",
                              ),
                              subtitle: Text(
                                "${surah.jumlahAyat} Ayat | ${surah.tempatTurun}",
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              trailing: Text(
                                "${surah.nama}",
                              ),
                            );
                          },
                        );
                      },
                    ),
                    FutureBuilder<List<Juzs>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Tidak Ada Data"),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Juzs detailJuz = snapshot.data![index];
                            if (detailJuz.verseMapping != null) {
                              print('eror');
                            }
                            return ListTile(
                              onTap: () {},
                              leading: Obx(
                                () => Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(controller.isDark.isTrue
                                          ? "assets/logo/octagona.png"
                                          : "assets/logo/octagona.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                "Juz ${index + 1}",
                              ),
                              isThreeLine: true,
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Mulai dari ${detailJuz.verseMapping.toString()}"),
                                  Text("Sampai"),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Center(
                      child: Text("page 3"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        // digunakan untuk mengubah warna tema
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            Get.isDarkMode
                ? Get.changeTheme(ThemeLight)
                : Get.changeTheme(ThemeDark);
            controller.isDark.toggle();
          },
          child: Obx(
            () => Icon(
              Icons.color_lens_rounded,
              color: controller.isDark.isTrue ? DarkPurple : crm,
            ),
          ),
        ),
      ),
    );
  }
}
