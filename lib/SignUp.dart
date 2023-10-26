// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_element, unused_field, unnecessary_null_comparison, unused_local_variable, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:liya_health_care/questions.dart';
import 'package:liya_health_care/sqlDb.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String initialCountry = 'MA';
  PhoneNumber number = PhoneNumber(isoCode: 'MA');
  bool _obscureText = true;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _RpasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _RpasswordController.dispose();
    super.dispose();
  }

  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
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
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(height: 35),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(
                              AppLocalizations.of(context)!.signUp,
                              style: GoogleFonts.merienda(
                                  textStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width * 0.09,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Text(
                                AppLocalizations.of(context)!.createYourAccountToProceed,
                                style: GoogleFonts.kreon(
                                    textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, color: Colors.white)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Color(0xFF41a747),
                                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                                child: _imageFile == null ? Icon(Icons.person, size: 40, color: Colors.white) : null,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _showSelectionSheet(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.addProfilePicture,
                                style: TextStyle(fontSize: 15, color: Color(0xFF41a747)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: TextFormField(
                                controller: _nameController,
                                validator: (value) => value!.isEmpty ? 'please enter your name' : null,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF12679a)), borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.person_2,
                                  ),
                                  hintText: AppLocalizations.of(context)!.entreYourName,
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) => value!.isEmpty ? 'please enter valide email' : null,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF41a747)), borderRadius: BorderRadius.circular(20)),
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                  ),
                                  hintText: AppLocalizations.of(context)!.entreYourEmail,
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                height: 60,
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: TextStyle(color: Colors.black),
                                  initialValue: number,
                                  hintText: AppLocalizations.of(context)!.entreYourPhone,
                                  formatInput: true,
                                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                  inputBorder: InputBorder.none,
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (value) => value!.isEmpty ? 'please enter valide password' : null,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF41a747)), borderRadius: BorderRadius.circular(20)),
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
                                      _obscureText ? Icons.visibility : Icons.visibility_off,
                                    ),
                                  ),
                                  hintText: AppLocalizations.of(context)!.entreYourPassword,
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.0),
                              child: TextFormField(
                                controller: _RpasswordController,
                                validator: (value) => value!.isEmpty ? 'please enter again the password' : null,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF41a747)), borderRadius: BorderRadius.circular(20)),
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
                                      _obscureText ? Icons.visibility : Icons.visibility_off,
                                    ),
                                  ),
                                  hintText: AppLocalizations.of(context)!.entreTheSamePassword,
                                  filled: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                              child: Container(
                                height: 65,
                                width: MediaQuery.of(context).size.width / 2.3,
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionsScreen()));
                                      /*if (_formKey.currentState!.validate()) {
                                              saveUsers();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const QuestionsScreen()),
                                              );
                                            }*/
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.signUp,
                                      style: TextStyle(color: Colors.white, fontSize: 25),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  void _showSelectionSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text(AppLocalizations.of(context)!.camera),
              onTap: () {
                openCamera();
                // Handle camera selection here
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text(AppLocalizations.of(context)!.gallery),
              onTap: () {
                _openGallery();
                // Handle gallery selection here
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future _openGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null && pickedFile.path != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<Uint8List?> openCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null && pickedFile.path != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      final bytes = await pickedFile.readAsBytes();
      return bytes;
    }
    return null;
  }

  //creaation compte offline
  void saveUsers() async {
    final sqlDb = SqlDb();
    if (_passwordController.text == _RpasswordController.text) {
      await sqlDb.addUser(_nameController.text, _emailController.text, _passwordController.text);
    }
    final users = await sqlDb.getUsers();
    for (final user in users) {
      print('Name: ${user['name']}, Email: ${user['email']},password: ${user['password']}');
    }
  }
}

//to create acconte
Future<void> register(String email, String password) async {
  final url = Uri.parse('http://localhost/api/register');
  final response = await http.post(
    url,
    body: {
      'email': email,
      'password': password,
    },
  );
  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    // Do something with the response data
  } else {
    throw Exception('Failed to register: ${response.reasonPhrase}');
  }
}
