/*

Simple state managment

Each cubit is a state that contains a list of tasks

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_task_list/domain/models/task.dart';
import 'package:multiplatform_task_list/domain/repository/task_repo.dart';

class TaskCubit extends Cubit<List<Task>> {
  final TaskRepo taskRepo;

  TaskCubit(this.taskRepo) : super([]) {
    loadTasks();
  }

  // load
  Future<void> loadTasks() async {
    final taskList = await taskRepo.getTasks();

    emit(taskList);
  }

  // add
  Future<void> addTask(String text) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    await taskRepo.addTask(task);

    //re-load
    loadTasks();
  }

  // delete
  Future<void> deleteTask(Task task) async {
    await taskRepo.deleteTask(task);

    //re-load
    loadTasks();
  }

  // toggle
  Future<void> toggleCompletion(Task task) async {
    final updatedTask = task.toggleCompletion();

    await taskRepo.updateTask(updatedTask);

    //re-load
    loadTasks();
  }
}
