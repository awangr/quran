import 'package:get/get.dart';

import '../modules/detail_quran/bindings/detail_quran_binding.dart';
import '../modules/detail_quran/views/detail_quran_view.dart';
import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/homequran/bindings/homequran_binding.dart';
import '../modules/homequran/views/homequran_view.dart';
import '../modules/introquran/bindings/introquran_binding.dart';
import '../modules/introquran/views/introquran_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/terakhir_dibaca/bindings/terakhir_dibaca_binding.dart';
import '../modules/terakhir_dibaca/views/terakhir_dibaca_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTROQURAN;

  static final routes = [
    GetPage(
      name: _Paths.INTROQURAN,
      page: () => const IntroquranView(),
      binding: IntroquranBinding(),
    ),
    GetPage(
      name: _Paths.HOMEQURAN,
      page: () => const HomequranView(),
      binding: HomequranBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_QURAN,
      page: () => const DetailQuranView(),
      binding: DetailQuranBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.TERAKHIR_DIBACA,
      page: () => const TerakhirDibacaView(),
      binding: TerakhirDibacaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
  ];
}
