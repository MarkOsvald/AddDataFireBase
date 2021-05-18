import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCalculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PowerCalculationScreen(),
    );
  }
}

class PowerCalculationScreen extends StatelessWidget {
  CollectionReference calculations = FirebaseFirestore.instance.collection('Calculations');
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple calculator"),
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) {
                result = value;
              },
              decoration: InputDecoration(hintText: 'Enter number'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await calculations.add({'result': result }).then(
                      (value) => print('User added'));
                },
                child: Text('Submit Data'))
          ],
        ));
  }
}
