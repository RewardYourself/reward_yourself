import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/create_tasks/create_task_controller.dart';
import 'package:reward_yourself/app/modules/create_tasks/create_task_page.dart';

class CreateTasksModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => CreateTaskController())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/",
        child: (context, args) => CreateTaskPage(
              createTaskController: context.read(),
            ))
  ];
}
