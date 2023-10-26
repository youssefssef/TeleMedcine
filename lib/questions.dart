// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_field, non_constant_identifier_names, prefer_final_fields, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liya_health_care/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:select_card/select_card.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:selectable_list/selectable_list.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<String> items = ['Yes, I currently smoke', 'No, but I am a former smoker', 'No'];
  List<String> items1 = [
    'I spend more than 4 hours a day at my desk and/or looking at a computer screen',
    'My job required heavy lifting or other types of physical work',
    'Neither applies'
  ];

  static const _icon1 = <Icon>[Icon(Icons.computer), Icon(Icons.work), Icon(Icons.block)];

  //savequestion to database
  List<String> qs = [
    'Please choose your gander',
    'Please choose your birth',
    'Please choose your Weight and height',
    'Do you smoke?',
    'How many years have you been smoking?',
    'How many cigarettes do you smoke per day?',
    'Do any of the following medicale conditions apply to your immediate relatives(parennts, siblings, grandparents)?'
  ];

  List<String> rps = [];

  String? _selecteditems;
  String? _selecteditems1;

  bool selecteGender1 = false;
  bool selecteGender2 = false;

  DateTime dateTime = DateTime.now();

  int _WeighttValue = 50;
  int _HeighttValue = 50;

  int _selectedContainerIndex = 0;

  void _onContainerTap(int index) {
    setState(() {
      _selectedContainerIndex = index;
    });
  }

  List<bool> _isSelectedList = List.generate(6, (_) => false);
  List<Color> _containerColorList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> _iconColorList = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  List<Color> _textColorList = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  void _toggleSelection(int index) {
    setState(() {
      _isSelectedList[index] = !_isSelectedList[index];
      if (_isSelectedList[index]) {
        _containerColorList[index] = Colors.green;
        _iconColorList[index] = Colors.white;
        _textColorList[index] = Colors.white;
      } else {
        _containerColorList[index] = Colors.white;
        _iconColorList[index] = Colors.black;
        _textColorList[index] = Colors.black;
      }
    });
  }

  final PageController _controller = PageController();

  /* @override
  void initState() {
    super.initState();
    // lock screen orientation to portrait mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                Color.fromARGB(255, 6, 90, 143),
                Color.fromARGB(255, 4, 71, 113),
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
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, top: MediaQuery.of(context).size.height * 0.05, right: 20),
                            child: Text(AppLocalizations.of(context)!.welcome,
                                style: GoogleFonts.merienda(
                                  textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(
                              AppLocalizations.of(context)!.weAlmostThere,
                              style: TextStyle(fontSize: 18, color: Colors.white),
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
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 9,
                          effect: ExpandingDotsEffect(activeDotColor: Colors.blue),
                        ),
                        Expanded(
                          child: PageView(
                            controller: _controller,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.2,
                                        child: Text(
                                          AppLocalizations.of(context)!.pleaseChooseYourGender,
                                          style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () => _onContainerTap(0),
                                          child: Container(
                                            height: 130,
                                            width: MediaQuery.of(context).size.width / 2.8,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: _selectedContainerIndex == 0 ? Colors.blue : Colors.white,
                                              border: Border.all(
                                                color: _selectedContainerIndex == 0 ? Colors.blue : Colors.grey,
                                              ),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.male,
                                                    size: 40,
                                                    color: _selectedContainerIndex == 0 ? Colors.white : Colors.black,
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context)!.male,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: _selectedContainerIndex == 0 ? Colors.white : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => _onContainerTap(1),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15.0, right: 15),
                                            child: Container(
                                              height: 130,
                                              width: MediaQuery.of(context).size.width / 2.8,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: _selectedContainerIndex == 1 ? Colors.pink : Colors.white,
                                                border: Border.all(
                                                  color: _selectedContainerIndex == 1 ? Colors.pink : Colors.grey,
                                                ),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.female,
                                                      size: 45,
                                                      color: _selectedContainerIndex == 1 ? Colors.white : Colors.black,
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(context)!.female,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: _selectedContainerIndex == 1 ? Colors.white : Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 80),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width / 2,
                                          child: Text(
                                            AppLocalizations.of(context)!.swapLeft,
                                            style: TextStyle(fontSize: 20, color: Colors.grey),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            radius: 30,
                                            child: Icon(Icons.arrow_circle_left, color: Colors.white, size: 40),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.2,
                                        child: Text(
                                          AppLocalizations.of(context)!.pleaseChooseYourBirth,
                                          style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                      child: Text(
                                        '${dateTime.day}-${dateTime.month}-${dateTime.year}',
                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        backgroundColor: Colors.white,
                                        initialDateTime: dateTime,
                                        onDateTimeChanged: (DateTime newTime) {
                                          setState(() {
                                            dateTime = newTime;
                                          });
                                        },
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.2,
                                        child: Text(
                                          AppLocalizations.of(context)!.pleaseChooseYourWeightAndHeight,
                                          style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                                              child: Text(
                                                '${AppLocalizations.of(context)!.weight}:  $_WeighttValue Kg',
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                                              child: Text(
                                                '${AppLocalizations.of(context)!.height} :  $_HeighttValue cm',
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20, right: 20.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width / 5,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
                                            child: NumberPicker(
                                                itemHeight: 45,
                                                itemWidth: 45,
                                                itemCount: 7,
                                                maxValue: 300,
                                                minValue: 0,
                                                value: _HeighttValue,
                                                onChanged: (v) {
                                                  setState(() {
                                                    _HeighttValue = v;
                                                  });
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width / 1.1,
                                        decoration:
                                            BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
                                        child: NumberPicker(
                                            axis: Axis.horizontal,
                                            itemHeight: 45,
                                            itemWidth: 45,
                                            itemCount: 7,
                                            minValue: 0,
                                            maxValue: 300,
                                            value: _WeighttValue,
                                            onChanged: (v) {
                                              setState(() {
                                                _WeighttValue = v;
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.2,
                                        child: Text(
                                          AppLocalizations.of(context)!.whatIsYouBloddType,
                                          style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Center(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width / 1.2,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                          child: ListView(children: [
                                            SizedBox(height: 15),
                                            DropdownSearch<String>(
                                              popupProps: PopupProps.menu(
                                                showSelectedItems: true,
                                              ),
                                              items: ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"],
                                              dropdownDecoratorProps: DropDownDecoratorProps(
                                                dropdownSearchDecoration: InputDecoration(
                                                  labelText: AppLocalizations.of(context)!.bloodType,
                                                ),
                                              ),
                                              onChanged: print,
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                      child: Text(
                                        AppLocalizations.of(context)!.doYouSmoke,
                                        style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, top: 8, right: 20),
                                      child: Text(
                                        AppLocalizations.of(context)!.ifYouSmokeOccasionnally,
                                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: items.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selecteditems = items[index];
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                                child: Container(
                                                  height: 60,
                                                  width: MediaQuery.of(context).size.width / 1.1,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: items[index] == _selecteditems ? Color(0xFF41a747) : Colors.white,
                                                      border: Border.all(
                                                          color: items[index] == _selecteditems ? Color(0xFF41a747) : Colors.black)),
                                                  child: Center(
                                                    child: Flexible(
                                                      child: Text(
                                                        items[index],
                                                        style: TextStyle(
                                                            color: items[index] == _selecteditems ? Colors.white : Colors.black,
                                                            fontWeight:
                                                                items[index] == _selecteditems ? FontWeight.bold : FontWeight.normal,
                                                            fontSize: 17),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                      child: Text(
                                        AppLocalizations.of(context)!.howManyYearsSmoking,
                                        style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 60),
                                    Center(
                                      child: Container(
                                        height: 70,
                                        width: MediaQuery.of(context).size.width / 1.1,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: AppLocalizations.of(context)!.years,
                                            border: OutlineInputBorder(),
                                            labelText: AppLocalizations.of(context)!.years,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20, left: 20.0, top: 20),
                                      child: Text(
                                        AppLocalizations.of(context)!.howManyCigarettes,
                                        style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20, left: 20.0, top: 8),
                                      child: Text(
                                        AppLocalizations.of(context)!.ifYouDoNotSmokejustWrite,
                                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Center(
                                      child: Container(
                                        height: 70,
                                        width: MediaQuery.of(context).size.width / 1.1,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: AppLocalizations.of(context)!.amountsOfCigarettes,
                                            border: OutlineInputBorder(),
                                            labelText: AppLocalizations.of(context)!.amountsOfCigarettes,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20, left: 20.0, top: 20),
                                      child: Text(
                                        AppLocalizations.of(context)!.applyToYouWorkLife,
                                        style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: items1.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selecteditems1 = items1[index];
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    minHeight: 80,
                                                    maxHeight: double.infinity,
                                                  ),
                                                  width: MediaQuery.of(context).size.width / 1.2,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: items1[index] == _selecteditems1 ? Color(0xFF41a747) : Colors.white,
                                                      border: Border.all(
                                                          color: items1[index] == _selecteditems1 ? Color(0xFF41a747) : Colors.black)),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                                                        child: _icon1[index],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 15.0),
                                                        child: SizedBox(
                                                          width: MediaQuery.of(context).size.width / 1.4,
                                                          child: Text(
                                                            items1[index],
                                                            style: TextStyle(
                                                                color: items1[index] == _selecteditems1 ? Colors.white : Colors.black,
                                                                fontWeight:
                                                                    items1[index] == _selecteditems1 ? FontWeight.bold : FontWeight.normal,
                                                                fontSize: 17),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20, left: 20.0, top: 20),
                                      child: Text(
                                        AppLocalizations.of(context)!.medicaleConditions,
                                        style: TextStyle(fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Expanded(
                                      child: GridView.count(
                                        primary: false,
                                        padding: const EdgeInsets.symmetric(horizontal: 8),
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 2,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                _toggleSelection(0);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: _containerColorList[0],
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: Image.asset('lib/icons/heartbeat.png', color: _iconColorList[0]),
                                                      ),
                                                      Text(
                                                        AppLocalizations.of(context)!.hearthProblems,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: _textColorList[0],
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                _toggleSelection(1);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: _containerColorList[1],
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: Image.asset('lib/icons/diabetes-test.png', color: _iconColorList[1]),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        AppLocalizations.of(context)!.diabetes,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: _textColorList[1],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                _toggleSelection(2);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: _containerColorList[2],
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: Image.asset('lib/icons/blood-pressure.png', color: _iconColorList[2]),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        AppLocalizations.of(context)!.highBloodPressure,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: _textColorList[2],
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                _toggleSelection(3);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: _containerColorList[3],
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: Image.asset('lib/icons/psychology.png', color: _iconColorList[3]),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        AppLocalizations.of(context)!.psychologicalDiffculties,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: _textColorList[3],
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                _toggleSelection(4);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: _containerColorList[4],
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        child: Image.asset('lib/icons/lungs.png', color: _iconColorList[4]),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        AppLocalizations.of(context)!.lungProblems,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: _textColorList[4],
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: GestureDetector(
                                              onTap: () {
                                                _toggleSelection(5);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: _containerColorList[5],
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.block_sharp,
                                                        size: 45,
                                                        color: _iconColorList[5],
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        AppLocalizations.of(context)!.none,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: _textColorList[5],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Container(
                                          height: 55,
                                          width: MediaQuery.of(context).size.width / 2,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                colors: [
                                                  Color.fromARGB(255, 6, 90, 143),
                                                  Color.fromARGB(255, 4, 71, 113),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!.save,
                                                style: TextStyle(fontSize: 23, color: Colors.white),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
