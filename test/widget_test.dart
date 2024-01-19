import 'package:quran/app/model/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  /*Uri url = Uri.parse("https://equran.id/api/v2/surat");
  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  Surah surahAnnas = Surah.fromJson(data[113]);
  print(surahAnnas);*/

  Future<Detailsurah?> getDetailSurah(String? nama) async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat/$nama");
    var res = await http.get(url);
    print(url);
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return Detailsurah.fromJson(data);
  }

  await getDetailSurah(0.toString());
}
