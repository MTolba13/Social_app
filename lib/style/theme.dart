import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontFamily: 'Brandon',
          color: Colors.black,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: HexColor('E1095B'),
        )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: HexColor('E1095B'),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      // selectedItemColor: ,
      unselectedItemColor: Colors.grey,
      elevation: 20,
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: HexColor('#000000'),
          height: 1.4,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: HexColor('#000000'),
        )),
    fontFamily: 'Brandon',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: HexColor('E1095B'),
      ),
    ));
