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
    LandingRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const LandingView());
    },
    LoginRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const LoginView());
    },
    CreateAccountRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const CreateAccountView());
    },
    PassGenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PassGenView());
    },
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
    CreateFileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const CreateFileView());
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
        RouteConfig(LandingRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(CreateAccountRoute.name, path: '/create-account'),
        RouteConfig(PassGenRoute.name, path: '/pass-gen'),
        RouteConfig(HomeRoute.name, path: '/home'),
        RouteConfig(CreateFolderRoute.name, path: '/create-folder'),
        RouteConfig(CreateFileRoute.name, path: '/create-File'),
        RouteConfig(FolderRoute.name, path: '/folder')
      ];
}

/// generated route for
/// [LandingView]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [CreateAccountView]
class CreateAccountRoute extends PageRouteInfo<void> {
  const CreateAccountRoute()
      : super(CreateAccountRoute.name, path: '/create-account');

  static const String name = 'CreateAccountRoute';
}

/// generated route for
/// [PassGenView]
class PassGenRoute extends PageRouteInfo<void> {
  const PassGenRoute() : super(PassGenRoute.name, path: '/pass-gen');

  static const String name = 'PassGenRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

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
/// [CreateFileView]
class CreateFileRoute extends PageRouteInfo<void> {
  const CreateFileRoute() : super(CreateFileRoute.name, path: '/create-File');

  static const String name = 'CreateFileRoute';
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
