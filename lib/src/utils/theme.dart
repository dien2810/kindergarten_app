import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/utils/widget_theme/elevated_button_theme.dart';
import 'package:kindergarten_app/src/utils/widget_theme/outlined_button_theme.dart';
import 'package:kindergarten_app/src/utils/widget_theme/text_field_theme.dart';
import 'package:kindergarten_app/src/utils/widget_theme/text_theme.dart';

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      textTheme: TTextTheme.lightTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme
  );

}