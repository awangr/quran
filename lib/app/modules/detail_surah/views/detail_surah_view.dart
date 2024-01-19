import 'package:flutter/material.dart';
import 'package:quran/app/model/surah.dart';
import 'package:get/get.dart';

import 'package:quran/app/model/detail_surah.dart' as detail;
import 'package:quran/app/constan/color.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah? surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SURAH ${surah?.namaLatin.toString().toUpperCase()}'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTap: () => Get.defaultDialog(
              title: "TAFSIR",
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Darkblue, Appurple],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "${surah?.namaLatin}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      "(${surah?.arti})",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Text(
                      "${surah?.jumlahAyat} ayat | ${surah?.tempatTurun}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          FutureBuilder<detail.Detailsurah?>(
            future: controller.getDetailSurah(surah?.nomor.toString()),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.connectionState == ConnectionState.waiting) {
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
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data?.ayat?.length ?? 0,
                itemBuilder: (context, index) {
                  if (snapshot.data?.ayat?.length == 0) {
                    return SizedBox();
                  }
                  detail.Ayat? ayat = snapshot.data?.ayat?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: blue.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Get.isDarkMode
                                          ? "assets/logo/octagona.png"
                                          : "assets/logo/octagona.png"),
                                      fit: BoxFit.contain),
                                ),
                                child: Center(
                                  child: Text("${index + 1}"),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.bookmark_add_outlined,
                                        color: Appurple),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.playAudio(
                                          surah!.audioFull.toString());
                                    },
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Appurple,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${ayat!.teksArab}",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${ayat.teksLatin}",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${ayat.teksIndonesia}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 50),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
