import 'package:flutter/material.dart';
import 'package:mvvm_example/app/my_app.dart';
import 'package:mvvm_example/core/injections/setup_injection.dart';

void main() async{

  await setupInjection();

  runApp(const MyApp());
}