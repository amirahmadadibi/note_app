import 'package:note_application/task.dart';
import 'package:note_application/task_type.dart';
import 'package:note_application/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        taskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/social_frends.png',
        title: 'میتینگ',
        taskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کارزیاد',
        taskTypeEnum: TaskTypeEnum.working),
  ];

  return list;
}
