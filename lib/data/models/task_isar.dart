/*

ISAR task model

Converts Domain task to Isar tast and vice versa

*/

import 'package:isar/isar.dart';
import 'package:multiplatform_task_list/domain/models/task.dart';

//to generate isar task object, run: dart run build_runner build
part 'task_isar.g.dart';

@collection
class TaskIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // Convert Isar model object to Domain model object
  Task toDomain() {
    return Task(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  // Convert Domain model object to Isar model object
  static TaskIsar fromDomain(Task task) {
    return TaskIsar()
      ..id = task.id
      ..text = task.text
      ..isCompleted = task.isCompleted;
  }
}
