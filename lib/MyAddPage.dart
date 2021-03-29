import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAddPage extends StatefulWidget {

  final onCreate;

  MyAddPage({@required this.onCreate});

  @override
  State createState() {
    return MyAddPageState();
  }
}

class MyAddPageState extends State<MyAddPage>{

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CREATE A TASK'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Enter name of your task',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(Icons.done),
        onPressed: () {
          widget.onCreate(controller.text);
          Navigator.pop(context);
        },
      ),
    );
  }
}