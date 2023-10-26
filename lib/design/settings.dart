// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names



import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quickalert/quickalert.dart';
import '../locale_provider.dart';
import '../menuPage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  bool isExpanded = true;
  bool _obscureText = true;
  // ignore: non_constant_identifier_names
  TextEditingController current_password = TextEditingController();
  TextEditingController new_password = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  

  //method the update the password
  Future<void> updatePassword(String currentPassword, String newPassword) async {
  final url = Uri.parse('http://localhost/api/password/update');
  final response = await http.post(
    url,
    body: {
      'current_password': currentPassword,
      'new_password': newPassword,
    },
  );
  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      barrierDismissible: true,
      title: 'Update...',
      text: 'The password had been successfully apdate it',
      confirmBtnText: 'Okey',
      onConfirmBtnTap: () {
        Navigator.of(context).pop();
      },
      showCancelBtn: true,
    );
  } else {
    throw Exception('Failed to update password');
  }
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
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
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
                              'Settings',
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
                  SizedBox(height: MediaQuery.of(context).size.width * 0.07),
                  Stack(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:  AssetImage('assets/luffy.png'),
                        ),
                        SizedBox(height: 10),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            child: IconButton(
                              onPressed: (){
                                _showSelectionSheet(context);
                              }, icon: Icon(Icons.edit)
                              ),
                          ),
                        ),
                      ]),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                  ExpansionTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Change your name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    leading: Icon(Icons.person_2),
                    trailing: isExpanded
                        ? Icon(Icons.arrow_drop_down_circle)
                        : Icon(Icons.arrow_circle_right),
                    onExpansionChanged: (isExpanded) {
                      setState(() {
                        this.isExpanded = !isExpanded;
                      });
                    },
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF2575FC)),
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.account_circle,
                            ),
                            hintText: 'youssef',
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.check_circle, size: 35),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Change your password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    leading: Icon(Icons.lock_reset, size: 25),
                    trailing: isExpanded
                        ? Icon(Icons.arrow_drop_down_circle)
                        : Icon(Icons.arrow_circle_right),
                    onExpansionChanged: (isExpanded) {
                      setState(() {
                        this.isExpanded = !isExpanded;
                      });
                    },
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: TextFormField(
                          obscureText: _obscureText,
                          controller: current_password,
                          validator: (value) => value!.isEmpty
                                    ? 'please enter password'
                                    : null,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF2575FC),
                                ),
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
                            hintText: 'current password',
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: TextFormField(
                          obscureText: _obscureText,
                          controller: new_password,
                          validator: (value) => value!.isEmpty
                                    ? 'please enter the new password'
                                    : null,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF2575FC),
                                ),
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
                            hintText: 'new password',
                            filled: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            updatePassword(current_password.text, new_password.text);
                          },
                          icon: Icon(Icons.check_circle, size: 35),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Change language',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    leading: Icon(Icons.language),
                    trailing: isExpanded
                        ? Icon(Icons.arrow_drop_down_circle)
                        : Icon(Icons.arrow_circle_right),
                    onExpansionChanged: (isExpanded) {
                      setState(() {
                        this.isExpanded = !isExpanded;
                      });
                    },
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      ListTile(
                        title: Text('Arabic'),
                        leading: Container(
                            height: 30,
                            child: Image.asset('lib/icons/morocco.png')),
                        onTap: () {
                          Provider.of<LocaleProvider>(context, listen: false).setLocale(Locale('ar'));
                        },
                      ),
                      ListTile(
                        title: Text('English'),
                        leading: Container(
                            height: 30,
                            child: Image.asset('lib/icons/usa.png')),
                        onTap: () {
                          Provider.of<LocaleProvider>(context, listen: false).setLocale(Locale('en'));
                        },
                      ),
                      ListTile(
                        title: Text('Françai'),
                        leading: Container(
                            height: 30,
                            child: Image.asset('lib/icons/france.png')),
                        onTap: () {
                          Provider.of<LocaleProvider>(context, listen: false).setLocale(Locale('fr'));
                        },
                      ),
                      
                    ],
                  ),
                ],
              ),
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
              title: Text(
                AppLocalizations.of(context)!.camera
                ),
              onTap: () {
                openCamera();
                // Handle camera selection here
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text(
                AppLocalizations.of(context)!.gallery
              ),
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
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null && pickedFile.path != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      final bytes = await pickedFile.readAsBytes();
      return bytes;
    }
    return null;
  }
}
