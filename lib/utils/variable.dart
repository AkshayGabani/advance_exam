import 'package:flutter/material.dart';

class Variable
{
  static TextEditingController userName = TextEditingController();
  static String user_name = '';
  static TextEditingController password = TextEditingController();
  static String pswd = '';
  static TextEditingController confirmPassword = TextEditingController();
  static String cnfrmPswd = '';
  static GlobalKey<FormState> register = GlobalKey<FormState>();
  static bool isValid=false;

}