import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'home_screen.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

//very similar to the first splash screen but it run everytime the app is launch after the second time
class SecondSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SecondSplashScreen> {
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
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() async {
    final ref =
        await FirebaseFirestore.instance.collection('Users').add({'uid': '1'});
    String idUsers = ref.id;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          idUsers: idUsers,
        ),
      ),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 165, 47, 186),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Welcome back to Periopic',
                style: TextStyle(fontSize: 50.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SleekCircularSlider(
              appearance: CircularSliderAppearance(
                customColors: CustomSliderColors(
                    dotColor: Colors.white,
                    progressBarColor: Colors.black,
                    shadowColor: Colors.white,
                    trackColor: Colors.white),
                spinnerMode: true,
                animationEnabled: true,
                size: 50.0,
                customWidths:
                    CustomSliderWidths(trackWidth: 10.0, shadowWidth: 5.0),
              ),
              initialValue: 90,
              onChange: (double value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
