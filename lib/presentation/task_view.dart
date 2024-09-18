/*

This is responsible for UI

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_task_list/domain/models/task.dart';
import 'package:multiplatform_task_list/presentation/task_cubit.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  _showAddTaskBox(BuildContext context) {
    final textController = TextEditingController();
    final taskCubit = context.read<TaskCubit>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              taskCubit.addTask(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text("Add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskView'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskBox(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return ListTile(
                  //text
                  title: Text(task.text),

                  //checkbox
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) => taskCubit.toggleCompletion(task),
                  ),

                  //delete
                  trailing: IconButton(
                    onPressed: () => taskCubit.deleteTask(task),
                    icon: const Icon(Icons.delete),
                  ),
                );
              });
        },
      ),
    );
  }
}
