
import 'package:example_onboarding_animation/fade_route.dart';
import 'package:example_onboarding_animation/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _removeUser() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userLogado').then((user)=>{
      Navigator.of(context).pushReplacement(
        new FadeRoute(page: Splash()))
    }).catchError((onError)=>{
      print(onError)
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to log OUT and back to splash'),
              onPressed: _removeUser,
            )
          ],
        ),
      ),
    );
  }
}
