import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/add_task_screen.dart';
import 'package:note_application/home_screen.dart';
import 'package:note_application/student.dart';

import 'car.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Car>('carBox');
  await Hive.openBox<Student>('studentBox');
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headline4: TextStyle(
            fontFamily: 'GB',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      home: AddTaskScreen(),
    );
  }
}
