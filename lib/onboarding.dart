import 'package:example_onboarding_animation/fade_route.dart';
import 'package:example_onboarding_animation/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  _setUser() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('userLogado', true).then((user)=>{
      Navigator.of(context).pushReplacement(
        new FadeRoute(page: MyHomePage()))
    }).catchError((onError)=>{
      print(onError)
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Page onboarding'),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to log IN and back to splash'),
              onPressed: _setUser,
            )
          ],
        ),
      )
    );
  }
}
