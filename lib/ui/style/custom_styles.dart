import 'package:flutter/material.dart';

class EstiloApp {
  static MaterialColor primaryblue =
      MaterialColor(_primarioPrimaryValue, <int, Color>{
    1000: Color(_primarioPrimaryValue),
  });
  static int _primarioPrimaryValue = 0xFF005db4;
  static MaterialColor primaryred =
      MaterialColor(_primaryredValue, <int, Color>{
    1000: Color(_primaryredValue),
  });
  static int _primaryredValue = 0xffee1515;

  static MaterialColor primarygreen =
      MaterialColor(_primarygreenValue, <int, Color>{
    1000: Color(_primarygreenValue),
  });
  static int _primarygreenValue = 0xff00FF00;

  static MaterialColor colorwhite =
      MaterialColor(_colorwhiteValue, <int, Color>{
    1000: Color(_colorwhiteValue),
  });
  static int _colorwhiteValue = 0xFFFFFFFF;

  static MaterialColor colorblack =
      MaterialColor(_colorblackValue, <int, Color>{
    1000: Color(_colorblackValue),
  });
  static int _colorblackValue = 0xFF000000;
}

ColorScheme design(var type) {
  var map = {
    'fire': ColorScheme.light(
        primary: Color(0xffDC143C),
        onPrimary: Color(0xff000000),
        surface: Color(0xffB22222),
        onSurface: Color(0xff000000)),
    'poison': ColorScheme.light(
        primary: Color(0xff9370DB),
        onPrimary: Color(0xff000000),
        surface: Color(0xff8A2BE2),
        onSurface: Color(0xff000000)),
    'ice': ColorScheme.light(
        primary: Color(0xff66CDAA),
        onPrimary: Color(0xff000000),
        surface: Color(0xffAFEEEE),
        onSurface: Color(0xff000000)),
    'normal': ColorScheme.light(
      primary: Color(0xffE6E6FA),
      onPrimary: Color(0xff000000),
      surface: Color(0xffDCDCDC),
      onSurface: Color(0xff000000),
    ),
    'psychic': ColorScheme.light(
        primary: Color(0xffEE82EE),
        onPrimary: Color(0xff000000),
        surface: Color(0xffDDA0DD),
        onSurface: Color(0xff000000)),
    'electric': ColorScheme.light(
        primary: Color(0xffFFFF00),
        onPrimary: Color(0xff000000),
        surface: Color(0xffFFD700),
        onSurface: Color(0xff000000)),
    'ghost': ColorScheme.light(
        primary: Color(0xff800080),
        onPrimary: Color(0xff000000),
        surface: Color(0xff4B0082),
        onSurface: Color(0xff000000)),
    'water': ColorScheme.light(
        primary: Color(0xff4169E1),
        onPrimary: Color(0xff000000),
        surface: Color(0xff7B68EE),
        onSurface: Color(0xff000000)),
    'bug': ColorScheme.light(
        primary: Color(0xff9ACD32),
        onPrimary: Color(0xff000000),
        surface: Color(0xff6B8E23),
        onSurface: Color(0xff000000)),
    'grass': ColorScheme.light(
        primary: Color(0xff00FF00),
        onPrimary: Color(0xff000000),
        surface: Color(0xff32CD32),
        onSurface: Color(0xff000000)),
    'dragon': ColorScheme.light(
        primary: Color(0xff7B68EE),
        onPrimary: Color(0xff000000),
        surface: Color(0xff6A5ACD),
        onSurface: Color(0xff000000)),
    'rock': ColorScheme.light(
        primary: Color(0xffCD853F),
        onPrimary: Color(0xff000000),
        surface: Color(0xffD2691E),
        onSurface: Color(0xff000000)),
    'dark': ColorScheme.light(
        primary: Color(0xff),
        onPrimary: Color(0xff000000),
        surface: Color(0xff),
        onSurface: Color(0xff000000)),
    'fighting': ColorScheme.light(
        primary: Color(0xffB22222),
        onPrimary: Color(0xff000000),
        surface: Color(0xff8B0000),
        onSurface: Color(0xff000000)),
    'fairy': ColorScheme.light(
        primary: Color.fromARGB(255, 255, 136, 238),
        onPrimary: Color(0xff000000),
        surface: Color.fromARGB(255, 255, 187, 238),
        onSurface: Color(0xff000000)),
    'steel': ColorScheme.light(
        primary: Color(0xffD3D3D3),
        onPrimary: Color(0xff000000),
        surface: Color(0xffC0C0C0),
        onSurface: Color(0xff000000)),
    'dark': ColorScheme.light(
        primary: Color.fromARGB(255, 21, 21, 27),
        onPrimary: Color.fromARGB(255, 255, 255, 255),
        surface: Color.fromARGB(0, 43, 43, 44),
        onSurface: Color.fromARGB(255, 248, 247, 247)),
  };
  return map[type] ??
      ColorScheme.light(
          primary: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0),
          surface: EstiloApp.colorwhite,
          onSurface: Colors.black);
}
