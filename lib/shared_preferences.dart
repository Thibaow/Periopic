import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'first_splash_screen.dart';
import 'second_splash_screen.dart';

//Page to keep in memory if it's the first time or not that the user open the app
class SharedPref extends StatefulWidget {
  const SharedPref({Key? key}) : super(key: key);

  @override
  _SharedPrefState createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  bool isFirstLaunch = false;

  SharedState() {
    MySharedPreferences.instance
        .getBooleanValue("isfirstRun")
        .then((value) => setState(() {
              isFirstLaunch = value;
            }));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to Periopic',
        //if true return intro screen for first time Else go to login Screen
        home: isFirstLaunch ? FirstSplashScreen() : SecondSplashScreen());
  }
}

class MySharedPreferences {
  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();

  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }
}
