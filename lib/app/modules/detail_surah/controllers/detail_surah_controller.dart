import 'dart:convert';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:quran/app/model/detail_surah.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<Detailsurah?> getDetailSurah(String? nomor) async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat/$nomor");
    var res = await http.get(url);
    print(url);
    final Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return Detailsurah.fromJson(data);
  }

  void playAudio(String? url) async {
    if (url != null) {
      try {
        final player = AudioPlayer();
        await player.setUrl(url);
        await player.play();
      } on PlayerException catch (e) {
        Get.defaultDialog(
            title: "terjadi kesalahan", middleText: e.message.toString());
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
            title: "terjadi kesalahan",
            middleText: "connection abroad : ${e.message}");
      } catch (e) {
        // Fallback for all other errors

        Get.defaultDialog(
            title: "terjadi kesalahan",
            middleText: "tidak dapat memutar audio");
      }
    } else {
      Get.defaultDialog(
          title: "terjadi kesalahan",
          middleText: "URL audio tidak dapat diproses/tidak dapat diaks");
    }
  }
}
