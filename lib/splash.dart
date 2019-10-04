import 'dart:async';

import 'package:example_onboarding_animation/fade_route.dart';
import 'package:example_onboarding_animation/home.dart';
import 'package:example_onboarding_animation/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('userLogado') ?? false);
    print(_seen);
    if (_seen) {
      Navigator.of(context).pushReplacement(
          new FadeRoute(page: new MyHomePage()));
    } else {
      Navigator.of(context).pushReplacement(
          new FadeRoute(page: new OnboardingPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 1), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hello'),
      ),
      body: new Center(
        child: new Text('This is the second page'),
      ),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text('This is the intro page'),
            new MaterialButton(
              child: new Text('Gogo Home Page'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (context) => new Home()));
              },
            )
          ],
        ),
      ),
    );
  }
}