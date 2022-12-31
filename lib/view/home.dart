
import 'dart:async';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_praktikum_pbm/Api/connect_api.dart';
import 'package:uas_praktikum_pbm/view/notif_absen.dart';
import 'package:uas_praktikum_pbm/view/profil.dart';
import 'profil.dart';
import 'list_absen.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'notif_absen.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var now = DateTime.now();
  final tcNama = TextEditingController();
  final tcNpm = TextEditingController();

  String Nama = '', Npm ='', Kelas ='', Tgl ='', Ket ='', accNama = '', accNpm = '';
  int s = DateTime.now().second;
  
  getAcc() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      accNpm = prefs.getString('Npm') ?? accNpm;
      accNama = prefs.getString('$accNpm+Nama') ?? accNama;
    });
  }
  void waktuReal(){
    setState(() {
      now = DateTime.now();
      s = DateTime.now().second;
    });
  }
  @override
  void initState(){
    super.initState();
    getAcc();
    waktuReal();
    Timer.periodic(Duration(seconds: 1), (Timer t) => waktuReal());
  }

  @override
  Widget build(BuildContext context) {

    var formatterTime = DateFormat('kk:mm');
    var formatterDay = DateFormat('EEEE');
    var formatterDate = DateFormat('d MMMM yyyy');
    String actualTime = formatterTime.format(now);
    String actualDay = formatterDay.format(now);
    String actualDate = formatterDate.format(now);

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => notifikasiPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0,1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //DRAWER
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Image.asset('assets/brand.png'),
                  ]),
                ),
                Divider(
                  color: Color(0xfe00FFA7),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,top: 10),
                  width: double.infinity,
                  child: Text('Kelas yang terdaftar',style: TextStyle(color: Color(0xfe00FFA7),fontSize: 12),textAlign: TextAlign.start,)
                  ),
                  GestureDetector(
                    onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5A'), ));
                    }),
                    child: Container(
                      margin: EdgeInsets.only(right: 136,left: 20,top: 20),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xfeC7F0FF),
                              shape: BoxShape.circle
                            ),
                            child: Center(child: Text('A',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.w700,fontSize: 30),)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Kelas 5A',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5B'), ));
                    }),
                    child: Container(
                      margin: EdgeInsets.only(right: 136,left: 20,top: 20),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xfeC7F0FF),
                              shape: BoxShape.circle
                            ),
                            child: Center(child: Text('B',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.w700,fontSize: 30),)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Kelas 5B',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5C'), ));
                    }),
                    child: Container(
                      margin: EdgeInsets.only(right: 136,left: 20,top: 20),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xfeC7F0FF),
                              shape: BoxShape.circle
                            ),
                            child: Center(child: Text('C',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.w700,fontSize: 30),)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Kelas 5C',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5D'), ));
                    }),
                    child: Container(
                      margin: EdgeInsets.only(right: 136,left: 20,top: 20),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xfeC7F0FF),
                              shape: BoxShape.circle
                            ),
                            child: Center(child: Text('D',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.w700,fontSize: 30),)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Kelas 5D',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ]),
                    ),
                  ),
            ]),
            height: (MediaQuery.of(context).size.height),
            width: double.infinity,
            color: Colors.white,),
        ),
      ),

      //END DRAWER

      //APPBAR
      backgroundColor: Color(0xFe0383BF),
      appBar: AppBar(
        toolbarHeight: 122,
        backgroundColor: Colors.transparent,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap:() {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Image.asset('assets/brand.png'));
                }
              ),
              GestureDetector(
            onTap:() {
              Navigator.push(context, MaterialPageRoute(builder:(context) => profilPage(),));
            },
            child: Image.asset('assets/user.png')),
          ]),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        ),
      ),
      //END APPBAR

      //BODY
      body: SingleChildScrollView(
        reverse: false,

        //GRADIENT BACKGROUND
        child: Container(
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
            //END GRADIENT BACKGROUND

            //CONTENT TOP
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text('$accNama ($accNpm)',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: 86,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFE00FFA1),width: 1.0),
                    color: Color(0xFe066997),
                    borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          children: [
                            Text(actualTime,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 48),),
                            Container(
                              width: 25,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(s.toString(),style: TextStyle(fontSize:12,color: Colors.white),),
                                ],
                              ))
                          ],
                        ),
                      ),
                      Column(
                         mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(actualDay,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700),),
                          Text(actualDate,style: TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.w700),)
                        ],
                      ),
                  ]) ,
                ),
                //END CONTENT TOP

                //CONTENT BOTTOM
                SizedBox(
                  height: 30,
                ),
                Text('Pilih Kelas',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                SizedBox(
                  height: 30,
                ),

                //BOX A
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context, builder:(context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            contentPadding: EdgeInsets.all(15),
                            title: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(actualTime,style: TextStyle(color: Color(0xFE066997),fontSize: 40,fontWeight: FontWeight.bold),),
                                      Text('$actualDay, $actualDate',style: TextStyle(color: Color(0xFE066997),fontSize: 12,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  IconButton(onPressed:() => Navigator.pop(context), icon: Icon(Icons.close,color: Color(0xfe49E3FE),))
                                ],
                              ),
                            ),
                            content: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child: Container(
                                height: MediaQuery.of(context).size.height*.7,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                  Text('Nama',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 10,
                                    ),
                                  TextField(
                                  controller: tcNama,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik namamu disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                  Text('NPM',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 5,
                                    ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                  controller: tcNpm,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik npm disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                Text('Kelas',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                            
                                    //BOX A
                                    Container(
                                      child: Center(
                                        child: Text('A',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xfe00FFA7),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                            
                                    SizedBox(
                                      width: 10,
                                    ),
                            
                                    //BOX B
                                    Container(
                                      child: Center(
                                        child: Text('B',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                            
                                    SizedBox(
                                      width: 10,
                                    ),
                            
                                    //BOX C
                                    Container(
                                      child: Center(
                                        child: Text('C',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                            
                            
                                    SizedBox(
                                      width: 10,
                                    ),
                            
                                    //BOX D
                                    Container(
                                      child: Center(
                                        child: Text('D',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                      height: 20,
                                    ),
                                Text('Keterangan',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE00EA99)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Ket = 'Hadir';
                                      Kelas = '5A';
                                      Tgl = '$actualDay, $actualDate';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                      Navigator.push(context, MaterialPageRoute(builder:(context) => notifikasiPage(),));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "HADIR",style: TextStyle(color: Colors.white,fontSize: 18)
                                      ),
                                    ),
                                  ),
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE066997)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Kelas = '5A';
                                      Tgl = '$actualDay, $actualDate';
                                      Ket = 'Tidak Hadir';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                      Navigator.of(context).push(_createRoute());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "TIDAK HADIR",style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  ],
                                )
                                ],),
                              ),
                            ),
                          ),
                          );
                      },
                      child: Container(
                        child: Center(
                          child: Text('A',style: TextStyle(color: Color(0xFEA1CA36),fontWeight: FontWeight.bold,fontSize: 90),),
                        ),
                        height: 127,
                        width: 127,
                        decoration: BoxDecoration(
                          color: Color(0xFEC7F0FF),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xfe00FFA7)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(0, 5),
                              blurStyle: BlurStyle.normal
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context, builder:(context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            contentPadding: EdgeInsets.all(15),
                            title: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(actualTime,style: TextStyle(color: Color(0xFE066997),fontSize: 40,fontWeight: FontWeight.bold),),
                                      Text('$actualDay, $actualDate',style: TextStyle(color: Color(0xFE066997),fontSize: 12,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  IconButton(onPressed:() => Navigator.pop(context), icon: Icon(Icons.close,color: Color(0xfe49E3FE),))
                                ],
                              ),
                            ),
                            content: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child: Container(
                                height: MediaQuery.of(context).size.height*.7,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                  Text('Nama',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 10,
                                    ),
                                  TextField(
                                    controller: tcNama,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik namamu disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                  Text('NPM',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 5,
                                    ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                  controller: tcNpm,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik npm disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                Text('Kelas',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text('A',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('B',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xfe00FFA7),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('C',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('D',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                      height: 40,
                                    ),
                                Text('Keterangan',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE00EA99)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Kelas = '5B';
                                      Tgl = '$actualDay, $actualDate';
                                      Ket = 'Hadir';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                      Navigator.of(context).push(_createRoute());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "HADIR",style: TextStyle(color: Colors.white,fontSize: 18)
                                      ),
                                    ),
                                  ),
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE066997)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Kelas = '5B';
                                      Tgl = '$actualDay, $actualDate';
                                      Ket = 'Tidak Hadir';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                      Navigator.of(context).push(_createRoute());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "TIDAK HADIR",style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  ],
                                )
                                ],),
                              ),
                            ),
                          ),
                          );
                        // Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5A'), ));
                      },
                      child: Container(
                        child: Center(
                           child: Text('B',style: TextStyle(color: Color(0xFEA1CA36),fontWeight: FontWeight.bold,fontSize: 90),),
                        ),
                        height: 127,
                        width: 127,
                        decoration: BoxDecoration(
                          color: Color(0xFEC7F0FF),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xfe00FFA7)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(0, 5),
                              blurStyle: BlurStyle.normal
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),

                //BOX B
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context, builder:(context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            contentPadding: EdgeInsets.all(15),
                            title: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(actualTime,style: TextStyle(color: Color(0xFE066997),fontSize: 40,fontWeight: FontWeight.bold),),
                                      Text('$actualDay, $actualDate',style: TextStyle(color: Color(0xFE066997),fontSize: 12,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  IconButton(onPressed:() => Navigator.pop(context), icon: Icon(Icons.close,color: Color(0xfe49E3FE),))
                                ],
                              ),
                            ),
                            content: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child: Container(
                                height: MediaQuery.of(context).size.height*.7,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                  Text('Nama',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 10,
                                    ),
                                  TextField(
                                    controller: tcNama,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik namamu disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                  Text('NPM',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 5,
                                    ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: tcNpm,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik npm disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                Text('Kelas',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text('A',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('B',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('C',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xfe00FFA7),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('D',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                      height: 40,
                                    ),
                                Text('Keterangan',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE00EA99)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Kelas = '5C';
                                      Tgl = '$actualDay, $actualDate';
                                      Ket = 'Hadir';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                      Navigator.of(context).push(_createRoute());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "HADIR",style: TextStyle(color: Colors.white,fontSize: 18)
                                      ),
                                    ),
                                  ),
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE066997)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Kelas = '5C';
                                      Tgl = '$actualDay, $actualDate';
                                      Ket = 'Tidak Hadir';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                     Navigator.of(context).push(_createRoute());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "TIDAK HADIR",style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  ],
                                )
                                ],),
                              ),
                            ),
                          ),
                          );
                        // Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5A'), ));
                      },
                      child: Container(
                        child: Center(
                           child: Text('C',style: TextStyle(color: Color(0xFEA1CA36),fontWeight: FontWeight.bold,fontSize: 90),),
                        ),
                        height: 127,
                        width: 127,
                        decoration: BoxDecoration(
                          color: Color(0xFEC7F0FF),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xfe00FFA7)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(0, 5),
                              blurStyle: BlurStyle.normal
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),

                    //BOX D
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context, builder:(context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            contentPadding: EdgeInsets.all(15),
                            title: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(actualTime,style: TextStyle(color: Color(0xFE066997),fontSize: 40,fontWeight: FontWeight.bold),),
                                      Text('$actualDay, $actualDate',style: TextStyle(color: Color(0xFE066997),fontSize: 12,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  IconButton(onPressed:() => Navigator.pop(context), icon: Icon(Icons.close,color: Color(0xfe49E3FE),))
                                ],
                              ),
                            ),
                            content: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child: Container(
                                height: MediaQuery.of(context).size.height*.7,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                  Text('Nama',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 10,
                                    ),
                                  TextField(
                                    controller: tcNama,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik namamu disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                  Text('NPM',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                  SizedBox(
                                      height: 5,
                                    ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: tcNpm,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1,color: Color(0xFE00EA99)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle: TextStyle(color: Color(0xFE00EA99)),
                                      hintText: "Ketik npm disini...",
                                      fillColor: Colors.transparent),
                                ),
                                SizedBox(
                                      height: 10,
                                    ),
                                Text('Kelas',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text('A',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('B',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('C',style: TextStyle(color: Color(0xfe066997),fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFEC7F0FF),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Color(0xfe00FFA7)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text('D',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xfe00FFA7),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 0,
                                            blurRadius: 3,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.normal
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                      height: 40,
                                    ),
                                Text('Keterangan',style: TextStyle(fontSize: 16,color: Color(0xFE066997),fontWeight: FontWeight.bold),),
                                SizedBox(
                                      height: 10,
                                    ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE00EA99)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Kelas = '5D';
                                      Tgl = '$actualDay, $actualDate';
                                      Ket = 'Hadir';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                      Navigator.of(context).push(_createRoute());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "HADIR",style: TextStyle(color: Colors.white,fontSize: 18)
                                      ),
                                    ),
                                  ),
                                    TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Color(0xfE066997)),
                                    onPressed: () {
                                      Nama = tcNama.text;
                                      Npm = tcNpm.text;
                                      Kelas = '5D';
                                      Tgl = '$actualDay, $actualDate';
                                      Ket = 'Tidak Hadir';
                                      inputAbsen.connectAPI(Nama, Npm, Kelas, Tgl, Ket).then(
                                        (value) {
                                          // print('data ${value.Nama} berhasil diinput');
                                        }
                                      );
                                      Navigator.of(context).push(_createRoute());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "TIDAK HADIR",style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  ],
                                )
                                ],),
                              ),
                            ),
                          ),
                          );
                        // Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5A'), ));
                      },
                      child: Container(
                        child: Center(
                           child: Text('D',style: TextStyle(color: Color(0xFEA1CA36),fontWeight: FontWeight.bold,fontSize: 90),),
                        ),
                        height: 127,
                        width: 127,
                        decoration: BoxDecoration(
                          color: Color(0xFEC7F0FF),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xfe00FFA7)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(0, 5),
                              blurStyle: BlurStyle.normal
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: (() {
                //     Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5A'), ));
                //   }),
                //   child: Container(
                //     width: 50,
                //     height: 50,
                //     color: Colors.amber,
                //     child: const Text('5A'),
                //   ),
                // ),
                // InkWell(
                //   onTap: (() {
                //     Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5B'), ));
                //   }),
                //   child: Container(
                //     width: 50,
                //     height: 50,
                //     color: Colors.amber,
                //     child: const Text('5B'),
                //   ),
                // ),
                // InkWell(
                //   onTap: (() {
                //     Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5C'), ));
                //   }),
                //   child: Container(
                //     width: 50,
                //     height: 50,
                //     color: Colors.amber,
                //     child: const Text('5C'),
                //   ),
                // ),
                // InkWell(
                //   onTap: (() {
                //     Navigator.push(context, MaterialPageRoute(builder:(context) => const listAbsenPage(kelas: '5D'), ));
                //   }),
                //   child: Container(
                //     width: 50,
                //     height: 50,
                //     color: Colors.amber,
                //     child: const Text('5D'),
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(context, MaterialPageRoute(builder:(context) => inputAbsenPage(), ));
                //   },
                //   child: Text('Absen'),
                // )
              ],
            ),

        ),
      ),
    );
  }
}