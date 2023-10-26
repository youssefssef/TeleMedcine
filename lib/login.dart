// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, sort_child_properties_last, unused_local_variable, no_leading_underscores_for_local_identifiers, unnecessary_cast, non_constant_identifier_names, use_build_context_synchronously, avoid_print, sized_box_for_whitespace, sized_box_for_whitespace

import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liya_health_care/home.dart';
import 'package:liya_health_care/locale_provider.dart';
import 'package:liya_health_care/sqlDb.dart';
import 'package:quickalert/quickalert.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'design/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dropdownValue = 'EN';
  bool _obscureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //check bluetooth if its on or off
  Future<void> checkBluetooth(BuildContext context) async {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    // Check if Bluetooth is already enabled
    bool isEnabled = await flutterBlue.isOn;
    if (isEnabled) {
      print('Bluetooth is already enabled');
      return;
    }
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      barrierDismissible: true,
      title: 'Activation...',
      text: 'For better experience please enable bluethooth',
      confirmBtnText: 'Settings',
      onConfirmBtnTap: () {
        AppSettings.openBluetoothSettings();
        Navigator.of(context).pop();
      },
      showCancelBtn: true,
    );
  }

  // login
  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('http://localhost/api/login'),
      headers: <String, String>{
        'content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );
    if (response.statusCode == 200) {
      final token = jsonDecode(response.body)['token'];
      print('Token: $token');
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email or password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  Color.fromARGB(255, 6, 90, 143),
                  Color.fromARGB(255, 4, 71, 113),
                  // Color(0xFF14689b),
                  // Color.fromARGB(255, 38, 130, 188),
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                SizedBox(height: 40),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                            AppLocalizations.of(context)!.login,
                                            style: GoogleFonts.merienda(
                                              textStyle: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.09,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .signInToYourAccount,
                                          style: GoogleFonts.kreon(
                                              textStyle: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(60),
                                                topRight: Radius.circular(60))),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20),
                                            Center(
                                              child: Text(
                                                'Choose your language!',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.grey[800]),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            ListTile(
                                              title: Text('English'),
                                              leading: Container(
                                                  height: 30,
                                                  child: Image.asset(
                                                      'lib/icons/usa.png')),
                                              onTap: () {
                                                Provider.of<LocaleProvider>(
                                                        context,
                                                        listen: false)
                                                    .setLocale(Locale('en'));
                                                setState(() {
                                                  dropdownValue = 'EN';
                                                });

                                                Navigator.of(context)
                                                    .pop(); // dismiss the bottom sheet
                                              },
                                            ),
                                            ListTile(
                                              title: Text('Francai'),
                                              leading: Container(
                                                  height: 30,
                                                  child: Image.asset(
                                                      'lib/icons/france.png')),
                                              onTap: () {
                                                Provider.of<LocaleProvider>(
                                                        context,
                                                        listen: false)
                                                    .setLocale(Locale('fr'));
                                                setState(() {
                                                  dropdownValue = 'FR';
                                                });
                                                Navigator.of(context)
                                                    .pop(); // dismiss the bottom sheet
                                              },
                                            ),
                                            ListTile(
                                              title: Text('Arabic'),
                                              leading: Container(
                                                  height: 30,
                                                  child: Image.asset(
                                                      'lib/icons/morocco.png')),
                                              onTap: () {
                                                Provider.of<LocaleProvider>(
                                                        context,
                                                        listen: false)
                                                    .setLocale(Locale('ar'));

                                                setState(() {
                                                  dropdownValue = 'AR';
                                                });
                                                Navigator.of(context)
                                                    .pop(); // dismiss the bottom sheet
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 20, left: 20),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Text(
                                      dropdownValue,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        ),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08),
                            Center(
                              child: Image.asset(
                                "assets/_logo.png",
                                width: MediaQuery.of(context).size.width / 1.8,
                              ),
                            ),
                            //emailfield
                            SizedBox(height: 50),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  if (!RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF41a747)),
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                  ),
                                  hintText: '@example.com',
                                  hintStyle: GoogleFonts.kreon(),
                                  filled: true,
                                ),
                              ),
                            ),
                            //passwordField
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (value) => value!.isEmpty
                                    ? 'please enter password'
                                    : null,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF41a747)),
                                      borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.lock_clock_rounded,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  hintText: AppLocalizations.of(context)!
                                      .entreYourPassword,
                                  hintStyle: GoogleFonts.kreon(),
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                      Color.fromARGB(255, 6, 90, 143),
                                      Color.fromARGB(255, 4, 71, 113),
                                      // Color(0xFF14689b),
                                      // Color.fromARGB(255, 38, 130, 188),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                  onPressed: () {
                                    checkBluetooth(context);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Scanner'),
                                            content: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.3,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const HomeScreen()));
                                                      },
                                                      child: Text(
                                                        'Design 1',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0),
                                                    child: Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const HomePage()));
                                                        },
                                                        child: Text(
                                                          'Design 2',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });

                                    //signIn();
                                  },
                                  child: Flexible(
                                    child: Text(
                                      AppLocalizations.of(context)!.signIn,
                                      style: GoogleFonts.merienda(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.055,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .youDoNotHaveAccount,
                                    style: GoogleFonts.kreon(
                                        textStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            color: Colors.grey[600])),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                      onPressed: () {
                                        // ignore: use_build_context_synchronously

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpScreen()));
                                      },
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          AppLocalizations.of(context)!.create,
                                          style: GoogleFonts.merienda(
                                            textStyle: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 52, 122, 167)),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

//offline login
  void signIn() async {
    final sqlDb = SqlDb();
    final users = await sqlDb.getUsers();
    bool isUserFound = false;

    for (final user in users) {
      print(
          'Name: ${user['name']}, Email: ${user['email']},password: ${user['password']}');
      if (_emailController.text == user['email'] &&
          _passwordController.text == user['password']) {
        isUserFound = true;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      }
    }

    if (!isUserFound) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The email or password is incorrect')));
    }
  }
}
