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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'data/user.dart' as _i6;
import 'pages/apiaries_page.dart' as _i3;
import 'pages/hives_page.dart' as _i2;
import 'pages/login_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    HivesPageRoute.name: (routeData) {
      final args = routeData.argsAs<HivesPageRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HivesPage(
          key: args.key,
          apiariesId: args.apiariesId,
          user: args.user,
        ),
      );
    },
    ApiariesPageRoute.name: (routeData) {
      final args = routeData.argsAs<ApiariesPageRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ApiariesPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          LoginPageRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          HivesPageRoute.name,
          path: '/hives-page',
        ),
        _i4.RouteConfig(
          ApiariesPageRoute.name,
          path: '/apiaries-page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i4.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: '/',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i2.HivesPage]
class HivesPageRoute extends _i4.PageRouteInfo<HivesPageRouteArgs> {
  HivesPageRoute({
    _i5.Key? key,
    required String apiariesId,
    required _i6.User user,
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

  final _i5.Key? key;

  final String apiariesId;

  final _i6.User user;

  @override
  String toString() {
    return 'HivesPageRouteArgs{key: $key, apiariesId: $apiariesId, user: $user}';
  }
}

/// generated route for
/// [_i3.ApiariesPage]
class ApiariesPageRoute extends _i4.PageRouteInfo<ApiariesPageRouteArgs> {
  ApiariesPageRoute({
    _i5.Key? key,
    required _i6.User user,
  }) : super(
          ApiariesPageRoute.name,
          path: '/apiaries-page',
          args: ApiariesPageRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'ApiariesPageRoute';
}

class ApiariesPageRouteArgs {
  const ApiariesPageRouteArgs({
    this.key,
    required this.user,
  });

  final _i5.Key? key;

  final _i6.User user;

  @override
  String toString() {
    return 'ApiariesPageRouteArgs{key: $key, user: $user}';
  }
}
