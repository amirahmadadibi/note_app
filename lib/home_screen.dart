import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');

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
            Text(inputText),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  inputText = controller.text;
                });
              },
              child: Text('read from textfiled'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                box.put(1, 'amirahmad');
              },
              child: Text('create'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                var text = box.get(1);
                print(text);
              },
              child: Text('read'),
            )
          ],
        ),
      ),
    );
  }
}
