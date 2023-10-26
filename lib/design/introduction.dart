// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {

   @override
  void initState() {
    super.initState();
    // lock screen orientation to portrait mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 2, 139, 225),
                Color.fromARGB(255, 10, 218, 24),
                Color.fromARGB(255, 32, 160, 239),
              ]),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 240,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20),
                    child: Text(
                      'Your Perfect Healthcare Solution',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Lottie.asset(
                    'assets/d_animation1.json',
                    height: 500
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width /1.5,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextButton(
                      onPressed: (){}, 
                      child: Text('Get started', style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),)
                      ),
                
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
