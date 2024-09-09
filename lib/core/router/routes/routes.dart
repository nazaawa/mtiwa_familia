import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtiwa_familia/features/authentification/presentation/screens/signup/ui/sign_up_sceen.dart';
import 'package:mtiwa_familia/features/home/presentation/main_screen.dart';
import 'package:mtiwa_familia/welcome_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<WelcomeRoute>(path: '/', routes: [
  // TypedGoRoute<LoginRoute>(
  //   path: 'login',
  // ),
  TypedGoRoute<SignUpSRoute>(
    path: 'signup',
  ),

])
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomeScreen();
  }
}



class SignUpSRoute extends GoRouteData {
  const SignUpSRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }
}





@TypedGoRoute<FamilyTreeRoute>(path: '/family-tree')
class FamilyTreeRoute extends GoRouteData {
  const FamilyTreeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Container();
  }
}

@TypedGoRoute<MainRoute>(
  path: '/main',
  routes: [
    TypedGoRoute<SettingsRoute>(
      path: 'settings',
    ),
  ],
)
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainScreen();
  }
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold();
  }
}
