import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_application/student.dart';
import 'package:note_application/task.dart';
import 'package:note_application/task_widget.dart';

import 'car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');
  var carBox = Hive.box<Car>('carBox');
  var studnetBox = Hive.box<Student>('studentBox');
  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: ListView.builder(
            itemCount: taskBox.values.length,
            itemBuilder: ((context, index) {
              var task = taskBox.values.toList()[index];
              return TaskWidget(task: task);
            })),
      ),
    );
  }
}
