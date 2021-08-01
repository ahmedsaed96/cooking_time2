import 'package:cocking_time/cubit/settins_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle googleStyle(BuildContext context) => GoogleFonts.comfortaa(
    fontSize: 20.0,
    fontWeight: FontWeight.w900,
    color:
        SettingsCubit.get(context).switchValue ? Colors.black : Colors.white);
TextStyle googleStyleSmall(BuildContext? context) => GoogleFonts.comfortaa(
    fontSize: 15.0,
    fontWeight: FontWeight.w900,
    color:
        SettingsCubit.get(context!).switchValue ? Colors.black : Colors.white);
TextStyle googleStyleSmaller(BuildContext context) => GoogleFonts.comfortaa(
    fontSize: 12.0,
    color:
        SettingsCubit.get(context).switchValue ? Colors.black : Colors.white);
Size phoneSize(BuildContext context) => MediaQuery.of(context).size;
Color mainColor = Colors.orange[400]!;
ThemeData lightTheme = ThemeData(
  primaryColor: Colors.lightBlue,
  accentColor: Colors.lightBlueAccent,
);
ThemeData darkTheme = ThemeData(
  canvasColor: Colors.grey.shade900,
  primaryColor: Colors.blueGrey,
  accentColor: Colors.green,
);
