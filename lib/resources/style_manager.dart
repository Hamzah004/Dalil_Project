import 'package:dalil_project/resources/fonts_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
  String fontFamily = FontConstants.englishFontFamily,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// Regular style
TextStyle getRegularStyle({
  double? fontSize,
  required Color color,
  String fontFamily = FontConstants.englishFontFamily,
}) {
  fontSize ??= FontSize.defaultValue;
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
    fontFamily: fontFamily,
  );
}

// Medium style
TextStyle getMediumStyle({
  double? fontSize,
  required Color color,
  String fontFamily = FontConstants.englishFontFamily,
}) {
  fontSize ??= FontSize.defaultValue;
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
    fontFamily: fontFamily,
  );
}

// Light style
TextStyle getLightStyle({
  double? fontSize,
  required Color color,
  String fontFamily = FontConstants.englishFontFamily,
}) {
  fontSize ??= FontSize.defaultValue;
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
    fontFamily: fontFamily,
  );
}

// Bold style
TextStyle getBoldStyle({
  double? fontSize,
  required Color color,
  String fontFamily = FontConstants.englishFontFamily,
}) {
  fontSize ??= FontSize.defaultValue;
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
    fontFamily: fontFamily,
  );
}

// SemiBold style
TextStyle getSemiBoldStyle({
  double? fontSize,
  required Color color,
  String fontFamily = FontConstants.englishFontFamily,
}) {
  fontSize ??= FontSize.defaultValue;

  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
    fontFamily: fontFamily,
  );
}
