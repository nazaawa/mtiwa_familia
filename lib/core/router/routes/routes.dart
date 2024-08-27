import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtiwa_familia/welcome_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<WelcomeRoute>(path: '/')
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomeScreen();
  }
}
