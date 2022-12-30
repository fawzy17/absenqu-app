// To parse this JSON data, do
//
//     final absen = absenFromJson(jsonString);

import 'dart:convert';

List<Absen> absenFromJson(String str) => List<Absen>.from(json.decode(str).map((x) => Absen.fromJson(x)));

String absenToJson(List<Absen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Absen {
    Absen({
        required this.id,
        required this.nama,
        required this.npm,
        required this.kelas,
        required this.tgl,
        required this.ket,
    });

    String id;
    String nama;
    String npm;
    String kelas;
    String tgl;
    String ket;

    factory Absen.fromJson(Map<String, dynamic> json) => Absen(
        id: json["id"],
        nama: json["nama"],
        npm: json["npm"],
        kelas: json["kelas"],
        tgl: json["tgl"],
        ket: json["ket"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "npm": npm,
        "kelas": kelas,
        "tgl": tgl,
        "ket": ket,
    };
}
