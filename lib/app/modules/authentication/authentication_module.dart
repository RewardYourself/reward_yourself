import 'package:flutter_modular/flutter_modular.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/forgetPassword_page.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/login_controller.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/login_page.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/register_page.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/register_controller.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/splash_page.dart';
import 'package:reward_yourself/app/modules/authentication/presenter/sucess_page.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
    Bind.lazySingleton((i) => RegisterController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => SplashPage(),
    ),
    ChildRoute(
      '/login',
      child: (context, args) => LoginPage(
        loginController: context.read(),
      )),
    ChildRoute(
      '/register',
      child: (context, args) => RegisterPage(
        registerController: context.read(),
      ),
    ),
    ChildRoute(
      '/success',
      child: (context, args) => SuccessPage(),
    ),
    ChildRoute(
      '/forgetPassword',
      child: (context, args) => ForgetPasswordPage(),
    ),
  ];
}
