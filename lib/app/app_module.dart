import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/authentication/auth_service.dart';
import 'package:reward_yourself/app/modules/rewards/rewards_module.dart';
import 'package:reward_yourself/app/modules/tasks/tasks_module.dart';
import 'package:reward_yourself/app/modules/home/home_module.dart';
import 'package:reward_yourself/app/modules/authentication/authentication_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AuthService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthenticationModule()),
    ModuleRoute("/home/", module: HomeModule()),
    ModuleRoute("/tasks/", module: TasksModule()),
    ModuleRoute("/rewards/", module: RewardsModule()),
  ];
}
