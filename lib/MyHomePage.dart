import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/MyAddPage.dart';
import 'package:to_do_list/MyHomeBody.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomeBody(),
      },
    );
  }
}