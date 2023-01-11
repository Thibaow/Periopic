import 'package:flutter/material.dart';
import 'shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

//Main page that will launch the app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPref(),
      debugShowCheckedModeBanner: false,
    );
  }
}
