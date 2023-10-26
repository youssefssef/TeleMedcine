// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
               Padding(
                 padding: const EdgeInsets.only(left : 20.0),
                 child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width/1.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage("assets/_logo.png"),
                          )),
                             ),
               ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40),
                child: Text(AppLocalizations.of(context)!.login,
                    style: GoogleFonts.merienda(
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.075,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 90, 143),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(AppLocalizations.of(context)!.signInToYourAccount,
                    style: GoogleFonts.kreon(
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        color: Color.fromARGB(255, 4, 71, 113),
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.entreYourEmail,
                      labelText: AppLocalizations.of(context)!.entreYourEmail,
                      suffixIcon: Icon(
                        Icons.email_rounded,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.entreYourPassword,
                      labelText:
                          AppLocalizations.of(context)!.entreYourPassword,
                      suffixIcon: Icon(Icons.visibility)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 1.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
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
                      ),
                      child: Flexible(
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: GoogleFonts.merienda(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.width * 0.06,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(height: 40),
                  Text('Create Account', style: TextStyle(
                    color: Color.fromARGB(255, 117, 115, 115), 
                    fontSize: 15, 
                    fontWeight: FontWeight.bold
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(left :8.0),
                    child: Text('--', style: TextStyle(
                      color: Color.fromARGB(255, 117, 115, 115), 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left :8.0),
                    child: Text('Language', style: TextStyle(
                      color: Color.fromARGB(255, 117, 115, 115), 
                      fontSize: 15, 
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
