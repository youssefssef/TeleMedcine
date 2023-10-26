// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:permission_handler/permission_handler.dart';

import '../menuPage.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  StreamSubscription<ScanResult>? scanSubscription;
  //List<BluetoothDevice> devicesList1 = [];

  @override
  void initState() {
    super.initState();
    _onScanPressed();
  }

  // Future<void> _onScanPressed() async {
  //   if (Platform.isAndroid) {
  //     Map<Permission, PermissionStatus> statuses = await [
  //       Permission.bluetoothScan,
  //       Permission.bluetoothConnect,
  //     ].request();
  //     if (statuses[Permission.bluetoothScan] != PermissionStatus.granted ||
  //         statuses[Permission.bluetoothConnect] != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  // }

 
 
 Future<void> _onScanPressed() async {
  if (Platform.isAndroid) {
    Map<Permission, PermissionStatus> statuses = await [      Permission.bluetoothScan,      Permission.bluetoothConnect,    ].request();
    if (statuses[Permission.bluetoothScan] != PermissionStatus.granted ||
        statuses[Permission.bluetoothConnect] != PermissionStatus.granted) {
      return;
    }
  } else if (Platform.isIOS) {
    PermissionStatus status = await Permission.bluetooth.request();
    if (status != PermissionStatus.granted) {
      return;
    }
  }
}
  Future<void> Scan() async {
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      devicesList.clear();
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        BluetoothDevice device = r.device;
        if (!devicesList.contains(device)) {
          devicesList.add(device);
        }
      }
      setState(() {});
    });

    // Stop scanning
    flutterBlue.stopScan();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Devices',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 20),
                    child: Icon(Icons.notifications, size: 30),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: MediaQuery.of(context).size.height * 0.03),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'List of devices :',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    /*scanning
                        ? Center(
                            child: SpinKitSpinningLines(
                            size: 60,
                            color: Color(0xFF12679a),
                          ))
                        :*/ devicesList.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: devicesList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    BluetoothDevice device = devicesList[index];
                                    return ListTile(
                                      title: Text(device.name),
                                      subtitle: Text(device.id.toString()),
                                      onTap: () {
                                        // Connect to the selected device
                                      },
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'There is no device yet',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'press "scan" to add one',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    onTap: () {
                      Scan();
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Scan',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
