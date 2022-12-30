import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_praktikum_pbm/view/welcome.dart';
import 'notif_absen.dart';

class profilPage extends StatefulWidget {
  const profilPage({super.key});

  @override
  _profilPageState createState() => _profilPageState();
}

class _profilPageState extends State<profilPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String Email = '', Nama = '', Npm = '';
  getAcc() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      Npm = prefs.getString('Npm') ?? Npm;
      Nama = prefs.getString('$Npm+Nama') ?? Nama;
      Email = prefs.getString('$Npm+Email') ?? Email;
    });
  }

  @override
  void initState(){
    super.initState();
    getAcc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap:() => Navigator.pop(context),
          child: Image.asset('assets/left.png')),
        centerTitle: true,
        elevation: 0,
        title: Text('Akun Profil',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xfe066997)),),
      ),
      body: Container(
         width: double.infinity,
          height: (MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
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
              ] ) ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                       decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        child: Image.asset('assets/profil_4x.png',width: 110,height: 110,)),
                    ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('EMAIL',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xfeC7F0FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('$Email',style: TextStyle(color: Color(0xfe066997),fontSize: 16,fontWeight: FontWeight.w700),)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('NAMA',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xfeC7F0FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('$Nama',style: TextStyle(color: Color(0xfe066997),fontSize: 16,fontWeight: FontWeight.w700),)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('NPM',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xfeC7F0FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('$Npm',style: TextStyle(color: Color(0xfe066997),fontSize: 16,fontWeight: FontWeight.w700),)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          primary: Color(0xfeA1CA36),
                          onPrimary: Color(0xfeA1CA36),
                        ),
                        onPressed:() async {
                          final SharedPreferences prefs = await _prefs;
                          prefs.setBool('isLogedIn', false);
                          Navigator.push(context, MaterialPageRoute(builder:(context) => WelcomePage(), ));
                      },child: Text('Keluar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                ]
                ),
              ),
      ),
    );
  }
}