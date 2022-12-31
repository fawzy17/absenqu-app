
import 'package:shared_preferences/shared_preferences.dart';

import 'masuk.dart';
import 'package:flutter/material.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  TextEditingController _tcEmail = TextEditingController();
  TextEditingController _tcNama = TextEditingController();
  TextEditingController _tcNpm = TextEditingController();
  TextEditingController _tcPass = TextEditingController();

  String Email = '';
  String Nama = '';
  String Npm = '';
  String Pass = '';

  int id_user = 0;

  getId() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      id_user = prefs.getInt('id_user') ?? id_user;
    });
  }

  @override
  void initState(){
    super.initState();
    getId();
  }

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
                padding: const EdgeInsets.only(top: 140),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash.png'))
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
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
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Daftar',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold, color: Color.fromRGBO(161, 202, 54, 1)),),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 340,
                      child: TextFormField(
                        controller: _tcEmail,
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(199, 240, 255, 1),
                          labelText: 'Email Kampus',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16))
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                    height: 60,
                    width: 340,
                      child: TextFormField(
                        controller: _tcNama,
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(199, 240, 255, 1),
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16))
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                    height: 60,
                    width: 340,
                      child: TextFormField(
                        controller: _tcNpm,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
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
                      height: 20,
                    ),
                    Container(
                    height: 60,
                    width: 340,
                      child: TextFormField(
                        controller: _tcPass,
                        obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
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
                      height: 20,
                    ),
                    Container(
                      width: 316,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          final SharedPreferences prefs = await _prefs;
                          Email = _tcEmail.text;
                          Nama = _tcNama.text;
                          Npm = _tcNpm.text;
                          Pass = _tcPass.text;
                          if (Npm == prefs.getString('$Npm+Npm')) {
                            
                          } else {
                            id_user++;
                            prefs.setInt('$Npm+id', id_user);
                            prefs.setString('$Npm+Email', Email);
                            prefs.setString('$Npm+Nama', Nama);
                            prefs.setString('$Npm+Npm', Npm);
                            prefs.setString('$Npm+Pass', Pass);
                            // print(prefs.getString('$Npm+Email'));
                            // print(prefs.getString('$Npm+Nama'));
                            // print(prefs.getString('$Npm+Npm'));
                            // print(prefs.getString('$Npm+Pass'));
                            Navigator.push(context, MaterialPageRoute(builder:(context) => MasukPage(), ));
                          }
                        } ,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(0, 234, 153, 1))
                      ), 
                      child:
                        const Text(
                          'Daftar',
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
                        const Text('Sudah Punya Akun?',
                        style: TextStyle(fontFamily: ('Poppins'), fontSize: 12, fontWeight: FontWeight.w600,color: Color.fromRGBO(6, 105, 151, 1)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context) => MasukPage(),));},
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(Colors.white)
                            ), 
                            child: const Text('Masuk',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color.fromRGBO(6, 105, 151, 1)),
                          ),
                        )
                      ],
                    )
                  ],
                ),  
              ),
            ],
          ),
        ),
      ),
    );
  }
}