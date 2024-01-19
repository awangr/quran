// To parse this JSON data, do
//
//     final detailsurah = detailsurahFromJson(jsonString);

import 'dart:convert';

Detailsurah detailsurahFromJson(String str) =>
    Detailsurah.fromJson(json.decode(str));

String detailsurahToJson(Detailsurah data) => json.encode(data.toJson());

class Detailsurah {
  Detailsurah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
    required this.suratSelanjutnya,
    required this.suratSebelumnya,
  });

  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  Map<String, String>? audioFull;
  List<Ayat>? ayat;
  SuratSenya? suratSelanjutnya;
  SuratSenya? suratSebelumnya;

  factory Detailsurah.fromJson(Map<String, dynamic>? json) => Detailsurah(
        nomor: json?["nomor"],
        nama: json?["nama"],
        namaLatin: json?["namaLatin"],
        jumlahAyat: json?["jumlahAyat"],
        tempatTurun: json?["tempatTurun"],
        arti: json?["arti"],
        deskripsi: json?["deskripsi"],
        audioFull: Map.from(json?["audioFull"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        ayat: List<Ayat>.from(json?["ayat"].map((x) => Ayat.fromJson(x))),
        suratSelanjutnya: SuratSenya.fromJson(json?["suratSelanjutnya"]),
        suratSebelumnya: SuratSenya.fromJson(json?["suratSebelumnya"]),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor == null ? null : nomor,
        "nama": nama == null ? null : nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": ayat == null
            ? null
            : List<dynamic>.from(ayat!.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya?.toJson(),
        "suratSebelumnya": suratSebelumnya?.toJson(),
      };
}

class Ayat {
  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  Map<String, String>? audio;

  factory Ayat.fromJson(Map<String, dynamic>? json) => Ayat(
        nomorAyat: json?["nomorAyat"],
        teksArab: json?["teksArab"],
        teksLatin: json?["teksLatin"],
        teksIndonesia: json?["teksIndonesia"],
        audio: Map.from(json?["audio"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio":
            Map.from(audio!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class SuratSenya {
  SuratSenya({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;

  factory SuratSenya.fromJson(Map<String, dynamic>? json) => SuratSenya(
        nomor: json?["nomor"],
        nama: json?["nama"],
        namaLatin: json?["namaLatin"],
        jumlahAyat: json?["jumlahAyat"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}
