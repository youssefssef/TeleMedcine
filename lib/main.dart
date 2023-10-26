// ignore_for_file: prefer_const_constructors, unused_label, unused_local_variable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liya_health_care/l10n/l10.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:liya_health_care/locale_provider.dart';
import 'package:liya_health_care/start.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
            supportedLocales: L10n.all,
            locale: provider
                .locale, // ignore: prefer_const_literals_to_create_immutables
            // ignore: prefer_const_literals_to_create_immutables
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: const //LoginPage());
               SplashScreen());
      });
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                Color(0xFF14689b),
                Color.fromARGB(255, 104, 191, 246),
                Color.fromARGB(255, 38, 130, 188),
              ]),
        ),
      ),
      AnimatedSplashScreen(
          splashIconSize: 400,
          backgroundColor: Colors.transparent,
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
          curve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 1500),
          splash: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset('assets/_logo.png', width: 300),
              ),
              SizedBox(height: 40),
              SpinKitFoldingCube(
                size: 40,
                color: Colors.white54,
              )
            ],
          ),
          nextScreen: StartPage()
          
          ),
    ]);
  }
}
