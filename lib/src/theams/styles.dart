import 'package:flutter/material.dart';
import 'package:rajkumar_portfolio/src/src.dart';

abstract class Styles {
  static TextStyle mediumWhite16 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: Dimens().sixteen,
  );
  static TextStyle mediumWhite20 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: Dimens().eighteen,
  );

  static TextStyle mediumWhite25 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: Dimens().twentyFive,
  );

   static TextStyle mediumSecondary25 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: ColorsValue.color00ffda,
    fontSize: Dimens().twentyFive,
  );

  static TextStyle mediumBlue20 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: ColorsValue.color00ffda,
    fontSize: Dimens().eighteen,
  );

  static TextStyle mediumSecondryPrimary20 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: ColorsValue.color00ffda,
    fontSize: Dimens().eighteen,
  );

  static TextStyle mediumWhite52 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: Dimens().fiftyTwo,
  );

  static TextStyle mediumWhite35 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: Dimens().thirtyFive,
  );

  static TextStyle boldSecodry35 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.bold,
    color: ColorsValue.color00ffda,
    fontSize: Dimens().thirtyFive,
  );

  static TextStyle boldSecodry25 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.bold,
    color: ColorsValue.color00ffda,
    fontSize: Dimens().twentyFive,
  );

   static TextStyle boldSecodry16 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.bold,
    color: ColorsValue.color00ffda,
    fontSize: Dimens().sixteen,
  );

  static TextStyle mediumGrey52 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: const Color(0xffabacd3),
    fontSize: Dimens().fiftyTwo,
  );

  static TextStyle mediumGrey35 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: const Color(0xffabacd3),
    fontSize: Dimens().thirtyFive,
  );

  static TextStyle mediumGrey20 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: const Color(0xffabacd3),
    fontSize: Dimens().twenty,
  );

  static TextStyle mediumGrey15 = TextStyle(
    fontFamily: 'Playfair Display',
    fontWeight: FontWeight.w500,
    color: const Color(0xffabacd3),
    fontSize: Dimens().fifteen,
  );
}
