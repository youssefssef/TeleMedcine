// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:liya_health_care/l10n/l10.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class LocaleProvider extends ChangeNotifier{
  Locale? _locale = Locale('en');


  Locale? get locale => _locale;



  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
  /*void setLocale(Locale locale){
    if( L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();

  }*/
  /*void clearLocale(){
    _locale = null;
    notifyListeners();
  }*/

}