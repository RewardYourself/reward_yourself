import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/rewards/presenter/create_reward_controller.dart';
import 'package:reward_yourself/app/modules/rewards/presenter/create_reward_page.dart';
import 'package:reward_yourself/app/modules/rewards/presenter/edit_reward_page.dart';
import 'package:reward_yourself/app/modules/rewards/presenter/edit_reward_controller.dart';

class RewardsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateRewardController()),
    Bind.lazySingleton((i) => EditRewardController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/create",
        child: (context, args) => CreateRewardPage(
              createRewardController: context.read(),
            )),
    ChildRoute("/edit/:id",
        child: (context, args) => EditRewardPage(
            editRewardController: context.read(), id: args.params['id'])),
  ];
}
