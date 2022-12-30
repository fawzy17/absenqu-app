import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_praktikum_pbm/view/home.dart';
import 'package:uas_praktikum_pbm/view/setelahmasuk.dart';

import 'daftar.dart';
import 'masuk.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String Npm = '';
  String Pass = '';

  bool _isLogedIn = false;


  void isLogedIn() async{
    final SharedPreferences prefs = await _prefs;
    setState(() {
      if (_isLogedIn) {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => homePage(), ));
      } else {
        
      }
    });
  }

  getAcc() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _isLogedIn = prefs.getBool('isLogedIn') ?? _isLogedIn;
      Npm = prefs.getString('Npm') ?? Npm;
      Pass = prefs.getString('Pass') ?? Pass;
    });
  }

  @override
  void initState(){
    super.initState();
    getAcc();
    isLogedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(top: 300),
                width: 280,
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
              const Text('Selamat Datang',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold, color: Colors.white,),),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 330,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: ElevatedButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context) => DaftarPage(),));},
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(0, 234, 153, 1))), 
                        child: const Text('Buat Akun',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                        )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                      height: 50,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: ElevatedButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context) => MasukPage()),);},
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(199, 240, 255, 1))), 
                        child: const Text('Masuk',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color.fromRGBO(6, 105, 151, 1)),),
                        )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 86,
                            height: 1,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Atau masuk dengan'),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 86,
                            height: 1,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill ,
                                image: AssetImage('assets/google.png')
                              )
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/fb.png')
                              )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
        ),
        ),
      );
  }
}