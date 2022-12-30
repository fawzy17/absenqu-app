import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8, 0.9],
          colors: [
            Color.fromRGBO(3, 131, 191, 1),
            Color.fromRGBO(84, 217, 254, 1),
            Color.fromRGBO(243, 251, 252, 1)
          ],
        )
      ),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                padding: const EdgeInsets.only(top: 320),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash.png') )
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/absenQu.png') )
                ),
              ),
            ],
          ),
        ),
    );
  }
}