import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/profile/presenter/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => ProfilePage(),
    ),
  ];
}