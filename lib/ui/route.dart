import 'package:flutter/material.dart';

import 'home/define.dart';
import 'splash/define.dart';

enum AppRoute { splash, home }

extension AppRouteExt on AppRoute {
  get name {
    switch (this) {
      case AppRoute.splash:
        "/splash";
        break;
      case AppRoute.home:
        "/home";
        break;
    }
  }

  get page {
    switch (this) {
      case AppRoute.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoute.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}

class RouteConfig {
  String routeString;
  AppRoute route;

  static RouteConfig? _instance;

  factory RouteConfig({
    required String routeString,
  }) {
    // Value default
    AppRoute route = AppRoute.splash;

    if (routeString == AppRoute.splash.name) {
      route = AppRoute.splash;
    } else if (routeString == AppRoute.home.name) {
      route = AppRoute.home;
    }

    _instance ??= RouteConfig._internal(routeString, route);

    return _instance!;
  }

  RouteConfig._internal(this.routeString, this.route);

  static RouteConfig? get instance => _instance;
}
