import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF4C4F5E),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => InputPage(),
        '/calculate': (context) => ResultPage()
      },
    );
  }
}
