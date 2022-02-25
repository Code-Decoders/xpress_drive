// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomeView(),
          durationInMilliseconds: 0,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [RouteConfig(AppRoute.name, path: '/')];
}

/// generated route for
/// [HomeView]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute() : super(AppRoute.name, path: '/');

  static const String name = 'AppRoute';
}
