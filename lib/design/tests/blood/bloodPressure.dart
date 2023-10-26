// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:liya_health_care/menuPage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({super.key});

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

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
        mainScreen: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Blood Pressure Test',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 20),
                          child: Icon(Icons.notifications, size: 30),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, 
                      top: MediaQuery.of(context).size.height *0.025),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Lets check',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              fit : BoxFit.scaleDown,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'your ',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'blood pressure!',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 3, 10, 145),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.02),
                    TabBar(tabs: [
                      Tab(
                        icon: Icon(
                          Icons.play_arrow,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.equalizer_rounded,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                    Expanded(
                      child: TabBarView(children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  child: Image.asset('lib/icons/blood-pressure.png', color: Color.fromARGB(255, 3, 10, 145),),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Container(
                                        height: 80,
                                        width: MediaQuery.of(context).size.width / 2.2,
                                        decoration: BoxDecoration(
                                            borderRadius:BorderRadius.circular(15),
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0, top: 15),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width *0.2,
                                                    child: Align(
                                                      alignment:  Alignment.centerLeft,
                                                      child: FittedBox(
                                                        fit : BoxFit.scaleDown,
                                                        child: Text('SYS',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight.bold)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0,
                                                            top: 15),
                                                    child: Container(
                                                      height: 20,
                                                      child: Image.asset(
                                                        'lib/icons/blood-pressure.png',
                                                        color: Color.fromARGB(255, 3, 10, 145),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 23.0, top: 10),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width* 0.22,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        'No data',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 3, 64, 186),
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15.0, top: 15),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width *0.1,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text('mmHg',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight.bold)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Container(
                                        height: 80,
                                        width: MediaQuery.of(context).size.width / 2.2,
                                        decoration: BoxDecoration(
                                            borderRadius:BorderRadius.circular(15),
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0, top: 15),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width *0.2,
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: FittedBox(
                                                        fit : BoxFit.scaleDown,
                                                        child: Text('DIA',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight.bold)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0,
                                                            top: 15),
                                                    child: Container(
                                                      height: 20,
                                                      child: Image.asset(
                                                        'lib/icons/blood-pressure.png',
                                                        color: Color.fromARGB(255, 3, 10, 145),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 23.0, top: 10),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width *0.22,
                                                    child: FittedBox(
                                                      fit : BoxFit.scaleDown,
                                                      child: Text(
                                                        'No data',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 3, 64, 186),
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15.0, top: 15),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width *0.1,
                                                    child: FittedBox(
                                                      fit : BoxFit.scaleDown,
                                                      child: Text('mmHg',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight.bold)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                        height: 80,
                                        width: MediaQuery.of(context).size.width / 1.1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0, top: 15),
                                                  child: SizedBox(
                                                    width:  MediaQuery.of(context).size.width *0.7,
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text('Pulse',
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight.bold)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0,
                                                            top: 15),
                                                    child: Container(
                                                      height: 20,
                                                      child: Image.asset(
                                                        'lib/icons/blood-pressure.png',
                                                        color: Color.fromARGB(255, 3, 10, 145),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 23.0, top: 10),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width *0.7,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        'No data',
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 3, 10, 145),
                                                            fontSize: 23,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20.0, top: 15),
                                                  child: SizedBox(
                                                    width : MediaQuery.of(context).size.width *0.08,
                                                    child: FittedBox(
                                                      fit : BoxFit.scaleDown,
                                                      child: Text('min',
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight.bold)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    
                                SizedBox(height: 25),
                                Center(
                                  child: Container(
                                    height: 66,
                                    width:MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.topLeft,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        colors: [
                                          Color(0xFF41a747),
                                          Color(0xFF12679a),
                                        ],
                                      ),
                                    ),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'Scan',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20),
                                  child: Text(
                                    'Last test',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(
                                    majorGridLines: MajorGridLines(width: 0),
                                    labelStyle: TextStyle(color: Colors.black),
                                    intervalType: DateTimeIntervalType
                                        .hours, // set interval type to hours
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
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 8), 70),
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 9), 72),
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 10), 75),
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 11), 77),
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 13), 77),
                                      ],
                                      xValueMapper: (HeartRateData data, _) =>
                                          data.time,
                                      yValueMapper: (HeartRateData data, _) =>
                                          data.heartRate,
                                      name: 'Heart Rate',
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Text(
                                    'History',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SfCartesianChart(
                                  primaryXAxis: DateTimeAxis(
                                      majorGridLines: MajorGridLines(width: 0),
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                  primaryYAxis: NumericAxis(
                                      majorGridLines: MajorGridLines(width: 0),
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                  series: <ChartSeries>[
                                    ColumnSeries<HeartRateData, DateTime>(
                                      color: Colors.blue,
                                      dataSource: <HeartRateData>[
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 8), 70),
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 9), 72),
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 10), 75),
                                        HeartRateData(
                                            DateTime(2023, 3, 1, 11), 77),
                                        HeartRateData(
                                            DateTime(2023, 3, 2, 8), 68),
                                        HeartRateData(
                                            DateTime(2023, 3, 2, 9), 70),
                                        HeartRateData(
                                            DateTime(2023, 3, 2, 10), 72),
                                        HeartRateData(
                                            DateTime(2023, 3, 2, 11), 74),
                                        HeartRateData(
                                            DateTime(2023, 3, 3, 8), 75),
                                        HeartRateData(
                                            DateTime(2023, 3, 3, 9), 77),
                                        HeartRateData(
                                            DateTime(2023, 3, 3, 10), 80),
                                        HeartRateData(
                                            DateTime(2023, 3, 3, 11), 82),
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
                        ),
                      ]),
                    ),
                  ]),
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
