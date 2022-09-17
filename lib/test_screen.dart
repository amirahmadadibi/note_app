import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  ValueNotifier mobser = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: mobser,
                  builder: (context, value, child) {
                    return Text(
                      '$value',
                      style: TextStyle(fontSize: 40),
                    );
                  }),
              ElevatedButton(
                  onPressed: () {
                    mobser.value = mobser.value + 1;
                  },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
