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
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    CreateFolderRoute.name: (routeData) {
      final args = routeData.argsAs<CreateFolderRouteArgs>(
          orElse: () => const CreateFolderRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: CreateFolderView(key: args.key, folder: args.folder));
    },
    FolderRoute.name: (routeData) {
      final args = routeData.argsAs<FolderRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: FolderView(
              key: args.key, folder: args.folder, color: args.color));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(CreateFolderRoute.name, path: '/create-folder'),
        RouteConfig(FolderRoute.name, path: '/folder')
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CreateFolderView]
class CreateFolderRoute extends PageRouteInfo<CreateFolderRouteArgs> {
  CreateFolderRoute({Key? key, Folder? folder})
      : super(CreateFolderRoute.name,
            path: '/create-folder',
            args: CreateFolderRouteArgs(key: key, folder: folder));

  static const String name = 'CreateFolderRoute';
}

class CreateFolderRouteArgs {
  const CreateFolderRouteArgs({this.key, this.folder});

  final Key? key;

  final Folder? folder;

  @override
  String toString() {
    return 'CreateFolderRouteArgs{key: $key, folder: $folder}';
  }
}

/// generated route for
/// [FolderView]
class FolderRoute extends PageRouteInfo<FolderRouteArgs> {
  FolderRoute({Key? key, required Folder folder, required Color color})
      : super(FolderRoute.name,
            path: '/folder',
            args: FolderRouteArgs(key: key, folder: folder, color: color));

  static const String name = 'FolderRoute';
}

class FolderRouteArgs {
  const FolderRouteArgs({this.key, required this.folder, required this.color});

  final Key? key;

  final Folder folder;

  final Color color;

  @override
  String toString() {
    return 'FolderRouteArgs{key: $key, folder: $folder, color: $color}';
  }
}
