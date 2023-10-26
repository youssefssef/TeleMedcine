// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:liya_health_care/design/devices.dart';

import 'package:liya_health_care/design/supervisors.dart';
import 'package:liya_health_care/home.dart';
import 'package:liya_health_care/tests/blood/blood.dart';
import 'package:liya_health_care/tests/heart/heartTest.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: [
                Color.fromARGB(255, 12, 196, 24),
                Color.fromARGB(255, 7, 126, 200),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 80),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/luffy.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 18),
                child: Flexible(
                  child: Text(
                    'youssef',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text('Home',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.bluetooth,
                  color: Colors.white,
                ),
                title: Text('Devices',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DevicesScreen()));
                  // Navigate to home screen
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.groups,
                  color: Colors.white,
                ),
                title: Flexible(
                  child: Text('Supervisors',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SupervisorsScreen()));
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.monitor_heart_sharp,
                  color: Colors.white,
                ),
                title: Text('Heart Test',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HeartScreen()));
                },
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  child: Image.asset('lib/icons/blood-pressure.png',
                      color: Colors.white),
                ),
                title: Text('Blood Test',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BloodScreen()));
                },
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  child: Image.asset('lib/icons/temperature.png',
                      color: Colors.white),
                ),
                title: Text('Temparute Test',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  // Navigate to home screen
                },
              ),
              Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                   
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Log Out',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onTap: () {
                  // Navigate to home screen
                },
              ),
            ],
          )),
    );
  }
}
