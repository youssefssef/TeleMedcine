// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:liya_health_care/tests/blood/bloodStatic.dart';
import 'package:liya_health_care/tests/heart/static.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../design/menuScreen.dart';

class BloodScreen extends StatefulWidget {
  const BloodScreen({super.key});

  @override
  State<BloodScreen> createState() => _BloodScreenState();
}

class _BloodScreenState extends State<BloodScreen> {
  final zoomDrawerController = ZoomDrawerController();

  //chackbluetooth
  Future<void> checkBluetooth(BuildContext context) async {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    // Check if Bluetooth is already enabled
    bool isEnabled = await flutterBlue.isOn;
    if (isEnabled) {
      print('Bluetooth is already enabled');
      return;
    }
    // ignore: use_build_context_synchronously
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      barrierDismissible: true,
      title: 'Activation...',
      text: 'please enable bluethooth',
      confirmBtnText: 'Settings',
      onConfirmBtnTap: () {
        AppSettings.openBluetoothSettings();
        Navigator.of(context).pop();
      },
      showCancelBtn: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        menuScreen: const MenuScreen(),
        controller: zoomDrawerController,
        menuBackgroundColor: Color.fromARGB(255, 7, 126, 200),
        slideWidth: MediaQuery.of(context).size.width / 1.5,
        showShadow: true,
        angle: 0.0,
        style: DrawerStyle.defaultStyle,
        mainScreen: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            shadowColor: Colors.grey,
            leading: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  zoomDrawerController.toggle!();
                },
                icon: Icon(Icons.clear_all, color: Colors.white, size: 30),
              ),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [Icon(Icons.notifications, color: Colors.white, size: 30)],

            /* flexibleSpace: Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  // ignore: prefer_const_constructors
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      const Color.fromARGB(255, 12, 196, 24),
                      const Color.fromARGB(255, 7, 126, 200),
                    ],
                  ),
                ),
              ),*/
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50))),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                      child: Text(
                    'Blood Pressure Test',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                )),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Center(
                        child: Text(
                          'Test',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BloodStatic()));
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Statistique',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 15),
                                  child: Text('SYS',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Spacer(),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 15),
                                    child: Container(
                                      height: 20,
                                      child: Image.asset(
                                        'lib/icons/heart.png',
                                        color: Colors.red,
                                      ),
                                    )),
                              ],
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23.0, top: 10),
                                  child: Text(
                                    'No data',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 12, 5, 216),
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 15),
                                  child: Text('mmHg',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 15),
                                  child: Text('DIA',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Spacer(),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 15),
                                    child: Container(
                                      height: 20,
                                      child: Image.asset(
                                        'lib/icons/heart.png',
                                        color: Colors.red,
                                      ),
                                    )),
                              ],
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 23.0, top: 10),
                                  child: Text(
                                    'No data',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 12, 5, 216),
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 15),
                                  child: Text('mmHg',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('lib/icons/heart-rate.png',
                        color: Color.fromARGB(255, 250, 126, 117)),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: CircleProgressBar(
                          foregroundColor: Color.fromARGB(255, 12, 5, 216),
                          backgroundColor: Colors.black12,
                          value: 0.1,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.2,
                            width: MediaQuery.of(context).size.width / 2.2,
                            
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text('No data', style: TextStyle(
                                 fontSize: 25,
                                 fontWeight : FontWeight.bold,
                                 color: Color.fromARGB(255, 12, 5, 216)
                              ),),
                            ),

                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
               Container(
                  constraints: BoxConstraints(
                    minHeight: 80,
                    maxHeight: double.infinity,
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            Color.fromARGB(255, 42, 211, 53),
                            Color.fromARGB(255, 15, 150, 233),
                          ])),
                  child: TextButton(
                      onPressed: () {
                        checkBluetooth(context);
                      },
                      child: Text(
                        'Start',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ),           
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
