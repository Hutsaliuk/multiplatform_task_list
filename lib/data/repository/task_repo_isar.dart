/*

Database repository

It handles storing, retrieving, updating, deleting items in the isar database

*/

import 'package:isar/isar.dart';
import 'package:multiplatform_task_list/data/models/task_isar.dart';
import 'package:multiplatform_task_list/domain/models/task.dart';
import 'package:multiplatform_task_list/domain/repository/task_repo.dart';

class TaskRepoIsar implements TaskRepo {
  
  final Isar db;

  TaskRepoIsar(this.db);

  @override
  Future<void> addTask(Task task) async {
    final taskIsar = TaskIsar.fromDomain(task);

    await db.writeTxn(() => db.taskIsars.put(taskIsar));
  }

  @override
  Future<void> deleteTask(Task task) async {
    await db.writeTxn(() => db.taskIsars.delete(task.id));
  }

  @override
  Future<List<Task>> getTasks() async {
    final tasks = await db.taskIsars.where().findAll();

    return tasks.map((task) => task.toDomain()).toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    final taskIsar = TaskIsar.fromDomain(task);

    await db.writeTxn(() => db.taskIsars.put(taskIsar));
  }
}
