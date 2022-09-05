import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
                carBox.put(
                    1, Car(name: 'tesla', topSpeed: 300, price: 12.1212));
              },
              child: Text('create'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                // var text = box.get(1);
                // print(text);
                if (carBox.get(1) == null) {
                  return;
                }
                print(carBox.get(1)!.name);
                print(carBox.get(1)!.topSpeed);
                print(carBox.get(1)!.price);
              },
              child: Text('read'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                carBox.put(1, Car(name: 'teslaY', topSpeed: 250, price: 10000));
              },
              child: Text('update'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, textStyle: TextStyle(fontSize: 26)),
              onPressed: () {
                carBox.delete(1);
              },
              child: Text('delete'),
            )
          ],
        ),
      ),
    );
  }
}
