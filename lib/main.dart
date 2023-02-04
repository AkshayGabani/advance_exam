import 'package:advance_exam/screens/homePage.dart';
import 'package:advance_exam/screens/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: true,
    routes: {
       '/':   (context)=> const HomePage(),
      'profile':(context)=> const Profile(),
    },
  ));
}
