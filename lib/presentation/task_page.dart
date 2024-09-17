/*

Task page is for providing cubit data for view (UI)

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_task_list/domain/repository/task_repo.dart';
import 'package:multiplatform_task_list/presentation/task_cubit.dart';
import 'package:multiplatform_task_list/presentation/task_view.dart';

class TaskPage extends StatelessWidget {
  final TaskRepo taskRepo;

  const TaskPage({super.key, required this.taskRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(taskRepo),
      child: const TaskView(),
    );
  }
}
