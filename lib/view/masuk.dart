import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_praktikum_pbm/view/home.dart';
import 'package:uas_praktikum_pbm/view/setelahmasuk.dart';

import 'daftar.dart';
import 'package:flutter/material.dart';


class MasukPage extends StatefulWidget {
  const MasukPage({super.key});

  @override
  State<MasukPage> createState() => _MasukPageState();
}

class _MasukPageState extends State<MasukPage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _tcNpm = TextEditingController();
  final _tcPass = TextEditingController();

  String Npm = '';
  String Pass = '';

  bool _isLogedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
                0.1,
                0.4,
                0.9,
              ],
            colors: [
              Color(0xFe0383BF),
              Color(0xFe54D9FE),
              Color(0xFeF3FBFC),
            ]
          )
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(top: 300),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash.png'))
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/absenQu.png') )
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 500,
                height: (MediaQuery.of(context).size.height)*.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Masuk',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Color.fromRGBO(161, 202, 54, 1)),),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 315,
                      child: TextFormField(
                        controller: _tcNpm,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          
                          floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(199, 240, 255, 1),
                          labelText: 'NPM',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16))
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 315,
                      child: TextFormField(
                        controller: _tcPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(199, 240, 255, 1),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16))
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 316,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          final SharedPreferences prefs = await _prefs;
                          Npm = _tcNpm.text;
                          Pass = _tcPass.text;
                          if (Npm == '' || Pass == '') {
                            
                          } else if(Pass != prefs.getString('$Npm+Pass') || prefs.getString('$Npm+Npm') == null) {

                          } else{
                            _isLogedIn = true;
                            prefs.setString('Npm', Npm);
                            prefs.setString('Pass', Pass);
                            prefs.setBool('isLogedIn', _isLogedIn);
                            Navigator.push(context, MaterialPageRoute(builder:(context) => homePage(),));
                          }
                        } ,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(0, 234, 153, 1))
                      ), 
                      child:
                        const Text(
                          'Masuk',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum Punya Akun?',
                        style: TextStyle(fontFamily: ('Poppins'), fontSize: 12, fontWeight: FontWeight.w600,color: Color.fromRGBO(6, 105, 151, 1)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context) => DaftarPage(),));},
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(Colors.white)
                            ), 
                            child: const Text('Daftar',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromRGBO(6, 105, 151, 1)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ], 
          ),
        ) 
      ),
    );
  }
}