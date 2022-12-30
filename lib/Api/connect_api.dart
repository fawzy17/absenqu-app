import 'dart:convert';

import 'package:uas_praktikum_pbm/model/absen.dart';
import 'package:http/http.dart' as http;


class inputAbsen{
  String? Nama, Npm, Kelas, Tgl, Ket;

  inputAbsen({required this.Nama, required this.Npm, required this.Kelas, required this.Tgl, required this.Ket});

  static Future<inputAbsen> connectAPI(String Nama, String Npm, String Kelas, String Tgl, String Ket) async {
    try {
      Uri url = Uri.parse('https://6368a40328cd16bba7086a2d.mockapi.io/api/uas/$Kelas');

      var hasilRespon = await http.post(
        url,
        body: {
          'nama' : Nama,
          'npm' : Npm,
          'kelas' : Kelas,
          'tgl' : Tgl,
          'ket' : Ket
        }
      );

      var data = json.decode(hasilRespon.body);


      return inputAbsen(
        Nama: data['nama'],
        Npm: data['npm'], 
        Kelas: data['kelas'], 
        Tgl: data['tgl'],
        Ket: data['ket']
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}


class tampilAbsen{
  String? kelas;

  tampilAbsen({this.kelas});

  Future<List<Absen>> connectAPI(String kelas) async {
    try {
      Uri url = Uri.parse('https://6368a40328cd16bba7086a2d.mockapi.io/api/uas/$kelas');

      final hasilRespon = await http.get(url);
      
      final List<Absen> result = absenFromJson(hasilRespon.body);

      return result;

    } catch (e) {
      throw Exception(e);
    }

  }
}