import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

//first screen that lauche when the app is started for the first time
class FirstSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<FirstSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 17);
    return new Timer(duration, route);
  }

  route() async {
    //create a user when launch then go to the Home page
    final ref =
        await FirebaseFirestore.instance.collection('Users').add({'uid': '1'});
    String idUsers = ref.id;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  idUsers: idUsers,
                )));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 43, 127),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Periopic',
              style: TextStyle(fontSize: 50.0, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: 100,
              appearance: CircularSliderAppearance(
                infoProperties: InfoProperties(
                    mainLabelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                )),
                customColors: CustomSliderColors(
                    dotColor: Colors.white,
                    progressBarColor: Colors.black,
                    shadowColor: Colors.white,
                    trackColor: Colors.white),
                spinnerDuration: 10,
                animDurationMultiplier: 10,
                animationEnabled: true,
                startAngle: 0.0,
                angleRange: 360,
              ),
            ),
            Text(
              'Initializing app...',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
