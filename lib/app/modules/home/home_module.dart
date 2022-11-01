import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/home/presenter/home_controller.dart';
import 'package:reward_yourself/app/modules/home/presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => HomePage(
        homeController: context.read(),
      ),
    ),
  ];
}
