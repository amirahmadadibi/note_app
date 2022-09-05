import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/home_screen.dart';

import 'car.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
