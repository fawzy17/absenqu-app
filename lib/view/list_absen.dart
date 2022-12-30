import 'package:uas_praktikum_pbm/Api/connect_api.dart';
import 'package:uas_praktikum_pbm/view/profil.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'profil.dart';

class listAbsenPage extends StatefulWidget {
  const listAbsenPage({Key? key, required this.kelas}) : super(key: key);

  final String kelas;
  @override
  State<listAbsenPage> createState() => _listAbsenPageState(kelas: kelas);
}

class _listAbsenPageState extends State<listAbsenPage> {
  _listAbsenPageState({required this.kelas});
  String kelas;

  tampilAbsen services = tampilAbsen();

  @override
  Widget build(BuildContext context) {

    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const homePage(),
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
                      Navigator.of(context).push(_createRoute());
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
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.symmetric(horizontal:20,vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xfeC7F0FF),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xfe00FFA7),),
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
                child: Center(
                  child: Text('Daftar Hadir Kelas $kelas',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w700),)),
              ),
              FutureBuilder(
                future: services.connectAPI(kelas),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder:(context, index) {
                        return ClipRRect(
                          child: Container(
                            width: double.infinity, 
                            height: 58,
                            margin: EdgeInsets.symmetric(horizontal:20,vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: ListTile(
                              title: Text(snapshot.data![index].nama,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFEA1CA36)),),
                          ),
                            ),),
                        );
                      },
                    );
                    
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator()
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}