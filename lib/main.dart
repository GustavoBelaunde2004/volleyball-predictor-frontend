import 'package:flutter/material.dart';
import 'team_selection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volleyball Match Predictor',
theme: ThemeData(
  primarySwatch: Colors.blueGrey, // Set a primary swatch
  scaffoldBackgroundColor: Colors.grey[100],
  textTheme: TextTheme(
    headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueGrey),
    titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[800]),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.blueGrey),
    ),
    labelStyle: TextStyle(color: Colors.blueGrey),
  ),
),

      home: TeamSelectionPage(),
    );
  }
}
