/*

Task repository description

Here defines what we going to do with tasks

*/

import 'package:multiplatform_task_list/domain/models/task.dart';

abstract class TaskRepo {
  // get a list of tasks
  Future<List<Task>> getTasks();

  // add a new task
  Future<void> addTask(Task task);

  // update existing task
  Future<void> updateTask(Task task);

  // delete existing task
  Future<void> deleteTask(Task task);
}
