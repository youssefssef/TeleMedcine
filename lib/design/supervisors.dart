// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../menuPage.dart';

class SupervisorsScreen extends StatefulWidget {
  const SupervisorsScreen({super.key});

  @override
  State<SupervisorsScreen> createState() => _SupervisorsScreenState();
}

class _SupervisorsScreenState extends State<SupervisorsScreen> {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  List<Color> colors = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.deepOrange,
    Colors.orange
  ];
  List<String> name = [
    'Name 1',
    'Name 2',
    'Name 3',
    'Name 4',
    'Name 5'
  ];

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
                        'Supervisors',
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
              padding:  EdgeInsets.only(left: 20.0, 
              top: MediaQuery.of(context).size.width  *0.05 ),
              child: SizedBox(
                width : MediaQuery.of(context).size.width /1.3,
                child: Align(
                  alignment : Alignment.centerLeft,
                  child: FittedBox(
                    fit : BoxFit.scaleDown,
                    child: Text(
                      'List of supervisors :',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 35.0, bottom: 10),
                          child: GestureDetector(
                            onLongPress: () async {
                              await QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  barrierDismissible: true,
                                  title: 'Delete...',
                                  text:
                                      'Are you sure you want to remove doctor as your supervisor',
                                  confirmBtnText: 'Yes',
                                  onConfirmBtnTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  showCancelBtn: true,
                                  cancelBtnText: 'Non');
                            },
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50)),
                                color: colors[index],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 70.0, top: 7),
                                    child: SizedBox(
                                      width : MediaQuery.of(context).size.width /1.5,
                                      child: Align(
                                        alignment : Alignment.centerLeft,
                                        child: FittedBox(
                                          fit : BoxFit.scaleDown,
                                          child: Text(
                                            name[index],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 70.0, top: 7),
                                    child: Text(
                                      'Doctor field',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('assets/doctor${index + 1}.jpg'),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.add, color: Colors.white, size: 30)),
                ),
              ),
            )
          ],
        )),
      ),
    ));
  }
}
