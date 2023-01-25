import 'package:flutter/material.dart';
import 'package:pokeapi_fernando_avila_bloc/ui/style/custom_styles.dart';

enum Pokemontype {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
  shadow
}

class Themetype {
  Color primary;
  Color onPrimary;
  Color surface;
  Color onSurface;
  Themetype(
      {required this.primary,
      required this.onPrimary,
      required this.surface,
      required this.onSurface});
}

Themetype design(var type) {
  var map = {
    'fire': Themetype(
        primary: Color(0xffDC143C),
        onPrimary: Color(0xff000000),
        surface: Color(0xffB22222),
        onSurface: Color(0xff000000)),
    'poison': Themetype(
        primary: Color(0xff9370DB),
        onPrimary: Color(0xff000000),
        surface: Color(0xff8A2BE2),
        onSurface: Color(0xff000000)),
    'ice': Themetype(
        primary: Color(0xff66CDAA),
        onPrimary: Color(0xff000000),
        surface: Color(0xffAFEEEE),
        onSurface: Color(0xff000000)),
    'normal': Themetype(
      primary: Color(0xffE6E6FA),
      onPrimary: Color(0xff000000),
      surface: Color(0xffDCDCDC),
      onSurface: Color(0xff000000),
    ),
    'psychic': Themetype(
        primary: Color(0xffEE82EE),
        onPrimary: Color(0xff000000),
        surface: Color(0xffDDA0DD),
        onSurface: Color(0xff000000)),
    'electric': Themetype(
        primary: Color(0xffFFFF00),
        onPrimary: Color(0xff000000),
        surface: Color(0xffFFD700),
        onSurface: Color(0xff000000)),
    'ghost': Themetype(
        primary: Color(0xff800080),
        onPrimary: Color(0xff000000),
        surface: Color(0xff4B0082),
        onSurface: Color(0xff000000)),
    'water': Themetype(
        primary: Color(0xff4169E1),
        onPrimary: Color(0xff000000),
        surface: Color(0xff7B68EE),
        onSurface: Color(0xff000000)),
    'bug': Themetype(
        primary: Color(0xff9ACD32),
        onPrimary: Color(0xff000000),
        surface: Color(0xff6B8E23),
        onSurface: Color(0xff000000)),
    'grass': Themetype(
        primary: Color(0xff00FF00),
        onPrimary: Color(0xff000000),
        surface: Color(0xff32CD32),
        onSurface: Color(0xff000000)),
    'dragon': Themetype(
        primary: Color(0xff7B68EE),
        onPrimary: Color(0xff000000),
        surface: Color(0xff6A5ACD),
        onSurface: Color(0xff000000)),
    'rock': Themetype(
        primary: Color(0xffCD853F),
        onPrimary: Color(0xff000000),
        surface: Color(0xffD2691E),
        onSurface: Color(0xff000000)),
    'dark': Themetype(
        primary: Color(0xff),
        onPrimary: Color(0xff000000),
        surface: Color(0xff),
        onSurface: Color(0xff000000)),
    'fighting': Themetype(
        primary: Color(0xffB22222),
        onPrimary: Color(0xff000000),
        surface: Color(0xff8B0000),
        onSurface: Color(0xff000000)),
    'fairy': Themetype(
        primary: Color.fromARGB(255, 255, 136, 238),
        onPrimary: Color(0xff000000),
        surface: Color.fromARGB(255, 255, 187, 238),
        onSurface: Color(0xff000000)),
    'steel': Themetype(
        primary: Color(0xffD3D3D3),
        onPrimary: Color(0xff000000),
        surface: Color(0xffC0C0C0),
        onSurface: Color(0xff000000)),
    'dark': Themetype(
        primary: Color.fromARGB(255, 21, 21, 27),
        onPrimary: Color.fromARGB(255, 255, 255, 255),
        surface: Color.fromARGB(0, 43, 43, 44),
        onSurface: Color.fromARGB(255, 248, 247, 247)),
  };
  return map[type] ??
      Themetype(
          primary: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0),
          surface: EstiloApp.colorwhite,
          onSurface: Colors.black);
}
