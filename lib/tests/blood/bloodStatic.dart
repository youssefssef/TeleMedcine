// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:liya_health_care/tests/blood/blood.dart';
import 'package:liya_health_care/tests/heart/heartTest.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../design/menuScreen.dart';

class BloodStatic extends StatefulWidget {
  const BloodStatic({super.key});

  @override
  State<BloodStatic> createState() => _BloodStaticState();
}

class _BloodStaticState extends State<BloodStatic> {
  final zoomDrawerController = ZoomDrawerController();

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BloodScreen()));
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'Test',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 184, 15, 3),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          'Statistique',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    'Last test',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    labelStyle: TextStyle(color: Colors.black),
                    intervalType: DateTimeIntervalType.hours, // set interval type to hours
                    
                  ),
                  primaryYAxis: NumericAxis(
                    majorGridLines: MajorGridLines(width: 0),
                    labelStyle: TextStyle(color: Colors.black),
                    minimum: 60, // set minimum value of y-axis
                    maximum: 90, // set maximum value of y-axis
                    interval: 5, // set interval of y-axis
                  ),
                  series: <ChartSeries>[
                    ColumnSeries<HeartRateData, DateTime>(
                      color: Colors.blue,
                      dataSource: <HeartRateData>[
                        HeartRateData(DateTime(2023, 3, 1, 8), 70),
                        HeartRateData(DateTime(2023, 3, 1, 9), 72),
                        HeartRateData(DateTime(2023, 3, 1, 10), 75),
                        HeartRateData(DateTime(2023, 3, 1, 11), 77),
                        HeartRateData(DateTime(2023, 3, 1, 13), 77),
                      ],
                      xValueMapper: (HeartRateData data, _) => data.time,
                      yValueMapper: (HeartRateData data, _) => data.heartRate,
                      name: 'Heart Rate',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Text(
                    'History',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                SfCartesianChart(
                  primaryXAxis: DateTimeAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      labelStyle: TextStyle(color: Colors.black)),
                  primaryYAxis: NumericAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      labelStyle: TextStyle(color: Colors.black)),
                  series: <ChartSeries>[
                    ColumnSeries<HeartRateData, DateTime>(
                      color: Colors.blue,
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
                      xValueMapper: (HeartRateData data, _) => data.time,
                      yValueMapper: (HeartRateData data, _) => data.heartRate,
                      name: 'Heart Rate',
                    ),
                  ],
                ),
              ],
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
