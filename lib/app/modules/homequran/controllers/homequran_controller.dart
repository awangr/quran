import 'dart:convert';

import 'package:get/get.dart';
import 'package:quran/app/model/juz.dart';
import 'package:quran/app/model/surah.dart';
import 'package:http/http.dart' as http;

class HomequranController extends GetxController {
  RxBool isDark = false.obs;
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat");
    var res = await http.get(url);
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  Future<List<Juzs>> getAllJuz() async {
    List<Juzs> allJuzs = [];
    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse("https://api.quran.com/api/v4/juzs/$i");
      var res = await http.get(url);
      Map<String, dynamic>? data =
          (json.decode(res.body) as Map<String, dynamic>)["Juzs"];
      Juzs? juzs = Juzs.fromJson(data);
      allJuzs.add(juzs);
      /* print(juz); */

      /* if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  } */
    }
    return allJuzs;
  }
}
