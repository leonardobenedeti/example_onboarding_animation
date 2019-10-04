import 'package:example_onboarding_animation/home.dart';
import 'package:example_onboarding_animation/onboarding.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  bool onboarding = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: 
        onboarding ? 
          MyHomePage(title: 'Flutter Demo Home Page') :
          OnboardingPage()
    );
  }
}