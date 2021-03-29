import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quitter/quitter.dart';
import 'package:to_do_list/MyAddPage.dart';
import 'package:to_do_list/Task.dart';

class MyHomeBody extends StatefulWidget {
  @override
  State createState() {
    return MyHomeBodyState();
  }
}

class MyHomeBodyState extends State<MyHomeBody>{
  final List<Task> tasks = [];

  void onTaskCreated(String name){
    setState(() {
      tasks.add(Task(name));
    });
  }

  void onTaskToggled(Task task){
    setState(() {
      task.setCompleted(!task.isCompleted());
    });
  }

  void onTaskRemove(Task task){
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeBody(
          tasks: tasks,
          onToggle: onTaskToggled,
          onRemove: onTaskRemove,
        ),
        '/create': (context) => MyAddPage(onCreate: onTaskCreated),
      },
    );
  }
}

class HomeBody extends StatelessWidget {

  final List<Task> tasks;
  final onToggle;
  final onRemove;

  HomeBody({
    @required this.tasks,
    @required this.onToggle,
    @required this.onRemove
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => Quitter.quitApplication(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length != null ? tasks.length : 0,
        itemBuilder: (context, index) => Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Card(
            elevation: 7.0,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(7.0)
            ),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CheckboxListTile(
                    activeColor: Colors.cyan.shade200,
                    value: tasks[index].isCompleted(),
                    title: Text(tasks[index].getName()),
                    onChanged: (_) => onToggle(tasks[index]),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconSlideAction(
              icon: Icons.delete_forever,
              color: Colors.red.shade700,
              onTap: () => onRemove(tasks[index]),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add_box),
        elevation: 15.0,
        backgroundColor: Colors.cyan.shade900,
      ),
    );
  }
}