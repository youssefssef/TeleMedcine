// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:liya_health_care/design/tests/blood/bloodPressure.dart';
import 'package:liya_health_care/design/tests/heart/heartPage.dart';

import '../menuPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
 

 //greeting the user
  String _greeting() {
  var now = DateTime.now();

  if (now.hour >= 0 && now.hour < 12) {
    return 'Good Morning';
  } else if (now.hour >= 12 && now.hour < 17) {
    return 'Good Afternoon';
  } else if (now.hour >= 17 && now.hour < 21) {
    return 'Good Evening';
  } else {
    return 'Good Night';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        menuScreen: MenuPage(),
        controller: zoomDrawerController,
        menuBackgroundColor: Color(0xFF2575FC),
        slideWidth: MediaQuery.of(context).size.width / 1.5,
        showShadow: true,
        angle: 0.0,
        style: DrawerStyle.defaultStyle,
        mainScreen: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: InkWell(
                            onTap: () {
                              zoomDrawerController.toggle!();
                            },
                            child: Icon(Icons.fitbit, size: 30)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 20),
                        child: Icon(Icons.notifications, size: 30),
                      ),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/luffy.png'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _greeting(),
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                'Youssef',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HeartPage()),
                      );
                    },
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 15, 150, 233),
                                Color.fromARGB(255, 42, 211, 53),
                              ])),
                      child: Column(
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.05,
                                    top: 10),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 33,
                                    child: Image.asset(
                                        'lib/icons/heartbeat.png',
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Heart Rate',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.2),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text('80 ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 45,
                                            color: Colors.white),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width *
                                          0.036),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'bpm',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.025,
                              ),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'yesterday',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      top: MediaQuery.of(context).size.width * 0.0375,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Your supervisors',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.0375,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.0375),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 27,
                                  backgroundImage:
                                      AssetImage('assets/doctor1.jpg'),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025),
                                CircleAvatar(
                                  radius:27,
                                  backgroundImage:
                                      AssetImage('assets/doctor2.jpg'),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025),
                                CircleAvatar(
                                  radius:27,
                                  backgroundImage:
                                      AssetImage('assets/doctor3.jpg'),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025),
                                CircleAvatar(
                                  radius:27,
                                  backgroundImage:
                                      AssetImage('assets/doctor4.jpg'),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025),
                                CircleAvatar(
                                  radius:27,
                                  backgroundImage:
                                      AssetImage('assets/doctor5.jpg'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      top: MediaQuery.of(context).size.width * 0.0375,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit : BoxFit.scaleDown,
                        child: Text(
                          'Your tests',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize:17),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BloodPressure()),
                              );
                            },
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromARGB(255, 15, 150, 233),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, top: 10),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              Colors.white.withOpacity(0.2),
                                          child: Container(
                                            height: 28,
                                            child: Image.asset(
                                                'lib/icons/arm.png',
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 10),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width /3.5,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Blood Pressure',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 40),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'SYS :',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 20),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width *0.14,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            '125',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 40, right: 10),
                                      child: FittedBox(
                                        fit : BoxFit.scaleDown,
                                        child: Text(
                                          'mmHg',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'DIA :',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width *0.14,
                                        child: FittedBox(
                                          fit : BoxFit.scaleDown,
                                          child: Text(
                                            '85',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'mmHg',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        bottom:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: FittedBox(
                                          fit : BoxFit.scaleDown,
                                          child: Text(
                                            'yesterday',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.025,
                          ),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 10),
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.blue,
                                        child: Container(
                                          height: 28,
                                          child: Image.asset(
                                              'lib/icons/temperature.png',
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width /3.2,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'Temperature',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Colors.black,
                                            ),
                                           
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40.0, top: 40),
                                      child: SizedBox(
                                        width : MediaQuery.of(context).size.width *0.3,
                                        child: FittedBox(
                                          fit : BoxFit.scaleDown,
                                          child: Text(
                                            '36 ',
                                            style: TextStyle(
                                                color:
                                                    Color.fromARGB(255, 70, 5, 192),
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 50),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'F ',
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 70, 5, 192),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, bottom: 10),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '03/03',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeartRateData {
  HeartRateData(this.time, this.heartRate);

  final DateTime time;
  final double heartRate;
}
