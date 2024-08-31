import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtiwa_familia/features/authentification/presentation/screens/login_screen.dart';
import 'package:mtiwa_familia/features/authentification/presentation/screens/sign_up_scrreen.dart';
import 'package:mtiwa_familia/welcome_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<WelcomeRoute>(path: '/', routes: [
  TypedGoRoute<LoginRoute>(
    path: 'login',
  ),
])
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomeScreen();
  }
}

class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

class SignUpSRoute extends GoRouteData {
  const SignUpSRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}
