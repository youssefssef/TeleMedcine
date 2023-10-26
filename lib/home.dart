// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, unused_field, deprecated_member_use, must_call_super, unused_local_variable, avoid_print

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:liya_health_care/tests/blood/blood.dart';
import 'package:liya_health_care/tests/heart/heartTest.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'design/menuScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final zoomDrawerController = ZoomDrawerController();

//bluethoot activation
  Future<void> checkBluetooth(BuildContext context) async {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    // Check if Bluetooth is already enabled
    bool isEnabled = await flutterBlue.isOn;
    if (isEnabled) {
      print('Bluetooth is already enabled');
      return;
    }

    // Prompt user to enable Bluetooth
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enable Bluetooth'),
          content: Text('Please enable Bluetooth to continue.'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Settings'),
              onPressed: () {
                AppSettings.openBluetoothSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        menuScreen: MenuScreen(),
        controller: zoomDrawerController,
        menuBackgroundColor: Color.fromARGB(255, 7, 126, 200),
        slideWidth: MediaQuery.of(context).size.width / 1.5,
        showShadow: true,
        style: DrawerStyle.defaultStyle,
        mainScreen: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                Color.fromARGB(255, 12, 196, 24),
                Color.fromARGB(255, 7, 126, 200),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.white.withOpacity(0.9),
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context)!.welcome,
                style: TextStyle(fontSize: 25, color: Colors.grey[800]),
              ),
              leading: IconButton(
                  onPressed: () {
                    zoomDrawerController.toggle!();
                  },
                  icon: Icon(Icons.clear_all, color: Colors.black, size: 30)),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50))),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 30, bottom: 20, right: 30),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Row(children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/luffy.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'youssef',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications, size: 30)),
                  ]),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GNav(
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                  activeColor: Colors.black,
                  tabBackgroundColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  gap: 8,
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.list,
                      text: 'List Doctors',
                    ),
                    GButton(
                      icon: Icons.history,
                      text: 'histories',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Sittings',
                    ),
                  ]),
            ),
            body: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            SizedBox(height: 8),
                            Text(
                              DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Add Supervisor',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )),
                                Icon(Icons.person_add_alt_1,
                                    color: Colors.white),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GlassContainer.clearGlass(
                    height: 400,
                    width: MediaQuery.of(context).size.width / 1.1,
                    blur: 20.0,
                    borderRadius: BorderRadius.circular(20),
                    borderColor: Colors.transparent,
                    child: Column(
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 40,
                                    child: Image.asset(
                                        'lib/icons/heartbeat.png',
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HeartScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Heart Rate',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                )),
                            Spacer(),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    '80',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 20),
                                  child: Text(
                                    'bpm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SfCartesianChart(
                          zoomPanBehavior: ZoomPanBehavior(
                              enablePinching: true,
                              enablePanning: true,
                              enableDoubleTapZooming: true,
                              zoomMode: ZoomMode.y),
                          primaryXAxis: DateTimeAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              labelStyle: TextStyle(color: Colors.white)),
                          primaryYAxis: NumericAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              labelStyle: TextStyle(color: Colors.white)),
                          series: <ChartSeries>[
                            SplineSeries<HeartRateData, DateTime>(
                              color: Colors.white,
                              dataSource: <HeartRateData>[
                                HeartRateData(DateTime(2023, 3, 1, 8), 70),
                                HeartRateData(DateTime(2023, 3, 1, 9), 72),
                                HeartRateData(DateTime(2023, 3, 1, 10), 75),
                                HeartRateData(DateTime(2023, 3, 1, 11), 77),
                                HeartRateData(DateTime(2023, 3, 2, 8), 68),
                                HeartRateData(DateTime(2023, 3, 2, 9), 70),
                                HeartRateData(DateTime(2023, 3, 2, 10), 72),
                                HeartRateData(DateTime(2023, 3, 2, 11), 74),
                                HeartRateData(DateTime(2023, 3, 3, 8), 75),
                                HeartRateData(DateTime(2023, 3, 3, 9), 77),
                                HeartRateData(DateTime(2023, 3, 3, 10), 80),
                                HeartRateData(DateTime(2023, 3, 3, 11), 82),
                              ],
                              xValueMapper: (HeartRateData data, _) =>
                                  data.time,
                              yValueMapper: (HeartRateData data, _) =>
                                  data.heartRate,
                              name: 'Heart Rate',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: (){
                       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BloodScreen()));
                    },
                    child: GlassContainer.clearGlass(
                      height: 120,
                      width: MediaQuery.of(context).size.width / 1.1,
                      blur: 20.0,
                      borderRadius: BorderRadius.circular(20),
                      borderColor: Colors.transparent,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, top: 10),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white.withOpacity(0.2),
                                  child: Container(
                                    height: 40,
                                    child: Image.asset('lib/icons/arm.png',
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25.0, top: 15),
                                child: Text(
                                  'Blood Pressure',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 10),
                                    child: Text(
                                      'SYS :',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 10),
                                    child: Text(
                                      '125',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 10),
                                    child: Text(
                                      'mmHg',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 10),
                                    child: Text(
                                      'DIA :',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 10),
                                    child: Text(
                                      '85',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 10),
                                    child: Text(
                                      'mmHg',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GlassContainer.clearGlass(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 1.1,
                    blur: 20.0,
                    borderRadius: BorderRadius.circular(20),
                    borderColor: Colors.transparent,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white.withOpacity(0.2),
                                child: Container(
                                  height: 40,
                                  child: Image.asset(
                                      'lib/icons/temperature.png',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25.0, top: 15),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: Text(
                                  'Temperature',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          '36 ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 5),
                          child: Text(
                            'F ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
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
