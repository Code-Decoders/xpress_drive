import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/ui/home/home_view.dart';

part 'app.router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Dialog|View,Route',
  routes: <AutoRoute>[
    CustomRoute(
      path: '/',
      initial: true,
      page: HomeView,
      name: 'AppRoute',
      durationInMilliseconds: 0,
      maintainState: true,
      children: [
      ],
    ),
  ],
)
@singleton
class AppRouter extends _$AppRouter {
  AppRouter() : super(StackedService.navigatorKey);
}
