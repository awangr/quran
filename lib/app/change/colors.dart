import 'package:flutter/material.dart';

const Appurple = Color(0xFF943DF4);
const DarkPurple = Color(0xff6523BB);
const black = Color(0xFF011341);
const Darkblue = Color(0xFF1E0771);
const blue = Color(0xFF2B0C8B);
const crm = Color(0xFFD2BEE8);
const Darkbrown = Color(0xFF52415B);
const brown = Color(0xFFD5724A);
const bluebl = Color(0xFF111E4E);
const fteks = Color(0xff241245);
ThemeData light = ThemeData(
    scaffoldBackgroundColor: crm,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: crm),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(blue))),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(fteks))));
ThemeData dark = ThemeData(
    scaffoldBackgroundColor: DarkPurple,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: black),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Appurple))),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(crm))));
