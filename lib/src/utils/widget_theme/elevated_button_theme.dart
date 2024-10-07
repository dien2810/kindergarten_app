import 'package:flutter/material.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._(); //To avoid creating instance
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        // backgroundColor: tSecondaryColor,
        // foregroundColor: tWhiteColor,
        // side: const BorderSide(color: tSecondaryColor),
        // padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        // backgroundColor: tWhiteColor,
        // foregroundColor: tSecondaryColor,
        // side: const BorderSide(color: tWhiteColor),
        // padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
    ),
  );

}