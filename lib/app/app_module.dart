import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/authentication/auth_service.dart';
import 'package:reward_yourself/app/modules/create_tasks/create_tasks_module.dart';
import 'package:reward_yourself/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AuthService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CreateTasksModule()),
    ModuleRoute("/home", module: HomeModule())
  ];
}
