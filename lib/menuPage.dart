// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liya_health_care/design/devices.dart';
import 'package:liya_health_care/design/homeScreen.dart';
import 'package:liya_health_care/design/supervisors.dart';
import 'package:liya_health_care/design/tests/heart/heartPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'design/settings.dart';
import 'design/tests/blood/bloodPressure.dart';
import 'login.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isExpanded = true;
 
 // to log out
 Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.post(
      Uri.parse('http://localhost/api/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Logged out successfully');
      }
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        ModalRoute.withName('/'),
      );
    } else {
      throw Exception('Failed to log out');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
            Color(0xFF6A11CB),
            Color(0xFF2575FC),
          ])),
      child: SingleChildScrollView(
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
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'youssef',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title:  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
              title: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Devices ',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
              ),
              
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
              title: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Supervisors ',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
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
            ExpansionTile(
              leading: Icon(Icons.play_arrow, color: Colors.white),
              title: Text(
                'Tests',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: isExpanded
                  ? Icon(Icons.arrow_circle_right)
                  : Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.white,
                    ),
              onExpansionChanged: (isExpanded) {
                setState(() {
                  this.isExpanded = !isExpanded;
                });
              },
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.monitor_heart_sharp,
                    color: Colors.white,
                  ),
                  title: Text('Heart Beat',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HeartPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    height: 30,
                    child: Image.asset('lib/icons/blood-pressure.png',
                        color: Colors.white),
                  ),
                  title: Text('Blood Pressure',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BloodPressure()),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    height: 30,
                    child: Image.asset('lib/icons/blood-test.png',
                        color: Colors.white),
                  ),
                  title: Text('Blood Glucose',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onTap: () {
                    // Navigate to home screen
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
              ],
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title:Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Settings ',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
              ),
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Log Out ',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
              ),
              onTap: () {
                // Navigate to home screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
