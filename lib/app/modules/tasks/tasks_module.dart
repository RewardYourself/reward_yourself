import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/create_task_controller.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/create_task_page.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/edit_task_page.dart';
import 'package:reward_yourself/app/modules/tasks/presenter/edit_task_controller.dart';

class TasksModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateTaskController()),
    Bind.lazySingleton((i) => EditTaskController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/create",
        child: (context, args) => CreateTaskPage(
              createTaskController: context.read(),
            )),
    ChildRoute("/edit/:id",
        child: (context, args) => EditTaskPage(
            editTaskController: context.read(), id: args.params['id'])),
  ];
}
