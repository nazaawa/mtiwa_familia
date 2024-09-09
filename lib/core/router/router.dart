import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtiwa_familia/core/router/routes/routes.dart';



final routerKey = GlobalKey<NavigatorState>();


final GoRouter router = GoRouter(
    navigatorKey: routerKey,
  observers: [
    NavigatorObservers(),
  ],
  initialLocation: const WelcomeRoute().location,
    routes: $appRoutes,
    redirect: (context, state) {
      return null;
    },
  );

class NavigatorObservers extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
  }
}

