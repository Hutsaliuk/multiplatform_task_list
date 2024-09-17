import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:multiplatform_task_list/data/models/task_isar.dart';
import 'package:multiplatform_task_list/data/repository/task_repo_isar.dart';
import 'package:multiplatform_task_list/domain/repository/task_repo.dart';
import 'package:multiplatform_task_list/presentation/task_page.dart';
import 'package:path_provider/path_provider.dart';

//always change to async when works with async data
Future<void> main() async {
  //use this to wait widget initialization
  WidgetsFlutterBinding.ensureInitialized();

  //get directory path for storing the data
  final workDir = await getApplicationDocumentsDirectory();

  //open isar database
  final db = await Isar.open([TaskIsarSchema], directory: workDir.path);

  //initialize the repo with isar database
  final isarTaskRepo = TaskRepoIsar(db);

  runApp(MyApp(taskRepo: isarTaskRepo));
}

class MyApp extends StatelessWidget {
  final TaskRepo taskRepo;

  const MyApp({super.key, required this.taskRepo});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TaskPage(taskRepo: taskRepo),
    );
  }
}
