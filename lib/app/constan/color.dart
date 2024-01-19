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

ThemeData ThemeLight = ThemeData(
  brightness: Brightness.light,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: black,
  ),
  primaryColor: Darkblue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(elevation: 4, backgroundColor: blue),
  textTheme: TextTheme(
/*     bodyText1: TextStyle(color: DarkPurple),
    bodyText2: TextStyle(color: DarkPurple), */
      ),
  listTileTheme: ListTileThemeData(
    textColor: DarkPurple,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: DarkPurple,
    unselectedLabelColor: Colors.grey,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: DarkPurple,
        ),
      ),
    ),
  ),
);

ThemeData ThemeDark = ThemeData(
  brightness: Brightness.dark,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: crm,
  ),
  primaryColor: black,
  scaffoldBackgroundColor: black,
  appBarTheme: AppBarTheme(backgroundColor: black),
  textTheme: TextTheme(
/*     bodyText1: TextStyle(color: crm),
    bodyText2: TextStyle(color: crm), */
      ),
  listTileTheme: ListTileThemeData(textColor: crm),
  tabBarTheme: TabBarTheme(
    labelColor: DarkPurple,
    unselectedLabelColor: Colors.grey,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
  ),
);
