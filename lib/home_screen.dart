import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/student.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            Text(
              box.get(2) ?? 'empty',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                box.put(2, controller.text);
                setState(() {});
              },
              child: Text('read from textfiled'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                // box.put(1, 'amirahmad');
                studnetBox.put(
                    1,
                    Student(
                        name: 'amirahamd',
                        family: 'adibi',
                        grade: 12.1,
                        age: 25));
              },
              child: Text('create'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                // var text = box.get(1);
                // print(text);
                if (studnetBox.get(1) == null) {
                  return;
                }
                print(studnetBox.get(1)!.name);
                print(studnetBox.get(1)!.family);
                print(studnetBox.get(1)!.age);
                print(studnetBox.get(1)!.grade);
              },
              child: Text('read'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                studnetBox.put(
                    1,
                    Student(
                        name: 'ariana', family: 'adibi', grade: 12.1, age: 25));
              },
              child: Text('update'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                studnetBox.delete(1);
              },
              child: Text('delete'),
            )
          ],
        ),
      ),
    );
  }
}
