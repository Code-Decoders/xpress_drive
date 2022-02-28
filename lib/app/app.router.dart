import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/datamodels/folder.dart';
import 'package:xpress_drive/ui/create_folder/create_folder_view.dart';
import 'package:xpress_drive/ui/folder/folder_view.dart';
import 'package:xpress_drive/ui/home/home_view.dart';

part 'app.router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Dialog|View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      initial: true,
      page: HomeView,
    ),
    AutoRoute(
      path: '/create-folder',
      page: CreateFolderView,
    ),
    AutoRoute(
      path: '/folder',
      page: FolderView,
    ),
  ],
)
@singleton
class AppRouter extends _$AppRouter {
  AppRouter() : super(StackedService.navigatorKey);
}
