import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_story/config/config.dart';
import 'package:read_story/constant/constants.dart';

class AppStyles{
  AppStyles._();

  static TextStyle textLexend({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
    TextDecoration? decoration}){
    return GoogleFonts.lexendDeca(
      fontSize: fontSize ?? AppConstants.textSizeDefault,
      color: textColor ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: decoration ?? TextDecoration.none,
      letterSpacing: AppConstants.letterSpacingDefault,
    );
  }

  static TextStyle textNotoSans({
    double? fontSize,
    Color? textColor,
    FontWeight? fontWeight,
    TextDecoration? decoration}){
    return GoogleFonts.notoSans(
      fontSize: fontSize ?? AppConstants.textSizeDefault,
      color: textColor ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: decoration ?? TextDecoration.none,
      letterSpacing: AppConstants.letterSpacingDefault,
    );
  }
}