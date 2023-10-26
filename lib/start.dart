// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:liya_health_care/login.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'locale_provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final PageController _pageController = PageController(initialPage: 0);
  String dropdownValue = 'EN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
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
                                  child: Image.asset('lib/icons/usa.png')),
                              onTap: () {
                                final provider = Provider.of<LocaleProvider>(
                                    context,
                                    listen: false);
                                provider.setLocale(Locale('en'));
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
                                  child: Image.asset('lib/icons/france.png')),
                              onTap: () {
                                final provider = Provider.of<LocaleProvider>(
                                    context,
                                    listen: false);
                                provider.setLocale(Locale('fr'));
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
                                  child: Image.asset('lib/icons/morocco.png')),
                              onTap: () {
                                final provider = Provider.of<LocaleProvider>(
                                    context,
                                    listen: false);
                                provider.setLocale(Locale('ar'));
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
                  padding: const EdgeInsets.only(right: 20.0, top: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20,
                    child: Text(
                      dropdownValue,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      Color(0xFF14689b),
                      Color.fromARGB(255, 38, 130, 188),
                    ],
                  ),
                ),
                child: PageView(
                  controller: _pageController,
                  children: [
                    Center(child: Lottie.asset('assets/d_animation1.json')),
                    Center(
                        child: Lottie.asset('assets/tests.json',
                            width: MediaQuery.of(context).size.width / 1.5)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                  activeDotColor: Color.fromARGB(255, 1, 125, 226)),
            ),
            SizedBox(height: 30),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SizedBox(
                  width: constraints.maxWidth / 1.4,
                  child: Text(
                    'Take care of your health with us!!',
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SizedBox(
                  width: constraints.maxWidth / 1.1,
                  child: Text(
                    'we offer you the perfect healtcare solution that will help you manage your health and well-being in a simple and convenient way.',
                    style: TextStyle(
                        fontSize: constraints.maxWidth * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Color(0xFF14689b),
                        Color.fromARGB(255, 38, 130, 188),
                      ])),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: FittedBox(
                  child: Text(
                    'Get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
