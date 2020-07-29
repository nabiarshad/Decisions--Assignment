import 'package:decisions_assignment/constants/stringConstants.dart';
import 'package:decisions_assignment/dashboard.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: stringConstants.strAppTitle,
      theme: ThemeData(primarySwatch: Colors.blue),
      home:dashboard(),
    );
  }
}



