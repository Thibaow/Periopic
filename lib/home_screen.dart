import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'first_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'groups_screen.dart';

//The principal screen. You can add groups to the cloud firestore by clicking on the cross at the bottom
//This page should have include the choice between the different groups
class HomeScreen extends StatefulWidget {
  String idUsers;
  HomeScreen({required this.idUsers});
  @override
  _HomeScreenState createState() => _HomeScreenState(idUsers);
}

class _HomeScreenState extends State<HomeScreen> {
  String idUsers;
  _HomeScreenState(this.idUsers);
  List groups = [];
//that's the method that add the groups in firestore
  void _createNewGroup() {
    setState(() async {
      final ref = await FirebaseFirestore.instance
          .collection('Groups')
          .add({'IdUsers': idUsers});
      String idGroups = ref.id;
      groups.add(ref.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 135, 255),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //This button in the middle is for going to the upload page to upload pics to the firebase storage
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 148, 125, 149)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroupScreen()));
                },
                child: const Text('TextButton'),
              )
            ]),
      ),
      appBar: AppBar(
        title: Text('Periopic'),
        //this show the id of the user in the collection users
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 40.0, top: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(idUsers),
              )),
        ],
      ),
      //the cross to add new groups in the collection groups
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewGroup,
        tooltip: 'Create new groupe',
        child: const Icon(Icons.add),
      ),
    );
  }
}
