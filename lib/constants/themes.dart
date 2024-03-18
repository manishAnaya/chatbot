import 'package:finva_tech_task/constants/exports.dart';

abstract class MyTheme {
  static final theme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    canvasColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
    ),
  );
}
