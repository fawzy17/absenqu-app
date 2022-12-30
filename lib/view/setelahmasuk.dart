import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_praktikum_pbm/view/daftar.dart';

class setelahMasuk extends StatelessWidget {
  const setelahMasuk({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed:() async {
              final SharedPreferences prefs = await _prefs;
              prefs.setBool('isLogedIn', false);
              Navigator.push(context, MaterialPageRoute(builder:(context) => DaftarPage(), ));
            },
            child: Text('kembali'))
        ],
      ),
    );
  }
}