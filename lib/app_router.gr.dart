// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'data/user.dart' as _i5;
import 'pages/hives_page.dart' as _i2;
import 'pages/login_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    HivesPageRoute.name: (routeData) {
      final args = routeData.argsAs<HivesPageRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HivesPage(
          key: args.key,
          apiariesId: args.apiariesId,
          user: args.user,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          LoginPageRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          HivesPageRoute.name,
          path: '/hives-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i3.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: '/',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i2.HivesPage]
class HivesPageRoute extends _i3.PageRouteInfo<HivesPageRouteArgs> {
  HivesPageRoute({
    _i4.Key? key,
    required String apiariesId,
    required _i5.User user,
  }) : super(
          HivesPageRoute.name,
          path: '/hives-page',
          args: HivesPageRouteArgs(
            key: key,
            apiariesId: apiariesId,
            user: user,
          ),
        );

  static const String name = 'HivesPageRoute';
}

class HivesPageRouteArgs {
  const HivesPageRouteArgs({
    this.key,
    required this.apiariesId,
    required this.user,
  });

  final _i4.Key? key;

  final String apiariesId;

  final _i5.User user;

  @override
  String toString() {
    return 'HivesPageRouteArgs{key: $key, apiariesId: $apiariesId, user: $user}';
  }
}
