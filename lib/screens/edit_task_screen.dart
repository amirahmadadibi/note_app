import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_application/widget/task_type_item.dart';
import 'package:note_application/utility/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

import '../data/task.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({Key? key, required this.task}) : super(key: key);
  Task task;
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskSubTitle;
  DateTime? _time;
  final box = Hive.box<Task>('taskBox');

  int _selectedTaskTypeitem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controllerTaskTitle = TextEditingController(text: widget.task.title);
    controllerTaskSubTitle = TextEditingController(text: widget.task.subTitle);

    negahban1.addListener(() {
      setState(() {});
    });

    negahban2.addListener(() {
      setState(() {});
    });

    var index = getTaskTypeList().indexWhere((element) {
      return element.taskTypeEnum == widget.task.taskType.taskTypeEnum;
    });

    _selectedTaskTypeitem = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskTitle,
                  focusNode: negahban1,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: negahban1.hasFocus
                          ? Color(0xff18DAA3)
                          : Color(0xffC5C5C5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff18DAA3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskSubTitle,
                  maxLines: 2,
                  focusNode: negahban2,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    labelText: 'توضییحات تسک',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: negahban2.hasFocus
                          ? Color(0xff18DAA3)
                          : Color(0xffC5C5C5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xff18DAA3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomHourPicker(
                title: 'زمان تسک رو انتخاب کن',
                negativeButtonText: 'حذف کن',
                positiveButtonText: 'انتخاب زمان',
                elevation: 2,
                titleStyle: TextStyle(
                    color: Color(0xff18DAA3),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                negativeButtonStyle: TextStyle(
                    color: Color.fromARGB(255, 218, 66, 24),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                positiveButtonStyle: TextStyle(
                    color: Color(0xff18DAA3),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                onPositivePressed: (context, time) {
                  _time = time;
                },
                onNegativePressed: (context) {},
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: getTaskTypeList().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTaskTypeitem = index;
                      });
                    },
                    child: TaskTypeItemList(
                      taskType: getTaskTypeList()[index],
                      index: index,
                      selectedItemList: _selectedTaskTypeitem,
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                String taskTitle = controllerTaskTitle!.text;
                String taskSubTitle = controllerTaskSubTitle!.text;
                editTask(taskTitle, taskSubTitle);
                Navigator.of(context).pop();
              },
              child: Text(
                'ویرایش کردن تسک',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff18DAA3),
                minimumSize: Size(200, 48),
              ),
            )
          ],
        )),
      ),
    );
  }

  editTask(String taskTitle, String taskSubTitle) {
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[_selectedTaskTypeitem];
    widget.task.save();
  }
}
