import 'package:flutter/material.dart';
import 'list_absen.dart';
import 'home.dart';

class notifikasiPage extends StatelessWidget {
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
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        child: Image.asset('assets/brand.png'),
      ),
      centerTitle: true,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Image.asset('assets/notif.png'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text('Hore!' ,style: TextStyle(color: Color(0xfe066997),fontSize: 32,fontWeight: FontWeight.w900),),
                  Text('Kamu Sudah Absen' ,style: TextStyle(color: Color(0xfe066997),fontSize: 32,fontWeight: FontWeight.w900),),
                ],
              ),
     ),
     floatingActionButton: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
       child: FloatingActionButton.extended(
        backgroundColor: Color(0xfe00EA99),
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        label: Text("Kembali Ke Beranda ",style: TextStyle(color: Colors.white),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
     ),
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
   );
 }
}