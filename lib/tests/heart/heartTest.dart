// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:liya_health_care/tests/heart/static.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../design/menuScreen.dart';

class HeartScreen extends StatefulWidget {
  const HeartScreen({super.key});

  @override
  State<HeartScreen> createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen> {
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
                    'Heart Test',
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
                                builder: (context) => const HeartStatic()));
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          border: Border.all(
                            color: Colors.grey,
                          ),
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
                SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.9,
                  child: CircleProgressBar(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.black12,
                      value: 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Text('65',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 36, left: 10),
                                child:
                                    Text('bpm', style: TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                          Container(
                            height: 135,
                            child: Image.asset(
                              'lib/icons/heart-rate.png',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 60),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            Color.fromARGB(255, 15, 150, 233),
                            Color.fromARGB(255, 42, 211, 53),
                          ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, top: 30),
                            child: Text(
                              'MIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, top: 10),
                            child: Text(
                              '46',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 40.0, top: 30),
                            child: Text(
                              'MAX',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 40.0, top: 10),
                            child: Text(
                              '136',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
