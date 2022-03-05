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
      final args = routeData.argsAs<PassGenRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: PassGenView(key: args.key, username: args.username));
    },
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    CreateFolderRoute.name: (routeData) {
      final args = routeData.argsAs<CreateFolderRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: CreateFolderView(
              key: args.key, folder: args.folder, path: args.path));
    },
    CreateFileRoute.name: (routeData) {
      final args = routeData.argsAs<CreateFileRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: CreateFileView(key: args.key, path: args.path));
    },
    FolderRoute.name: (routeData) {
      final args = routeData.argsAs<FolderRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: FolderView(
              key: args.key,
              folder: args.folder,
              color: args.color,
              path: args.path));
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
class PassGenRoute extends PageRouteInfo<PassGenRouteArgs> {
  PassGenRoute({Key? key, required String username})
      : super(PassGenRoute.name,
            path: '/pass-gen',
            args: PassGenRouteArgs(key: key, username: username));

  static const String name = 'PassGenRoute';
}

class PassGenRouteArgs {
  const PassGenRouteArgs({this.key, required this.username});

  final Key? key;

  final String username;

  @override
  String toString() {
    return 'PassGenRouteArgs{key: $key, username: $username}';
  }
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
  CreateFolderRoute(
      {Key? key, Map<String, dynamic>? folder, required String path})
      : super(CreateFolderRoute.name,
            path: '/create-folder',
            args: CreateFolderRouteArgs(key: key, folder: folder, path: path));

  static const String name = 'CreateFolderRoute';
}

class CreateFolderRouteArgs {
  const CreateFolderRouteArgs({this.key, this.folder, required this.path});

  final Key? key;

  final Map<String, dynamic>? folder;

  final String path;

  @override
  String toString() {
    return 'CreateFolderRouteArgs{key: $key, folder: $folder, path: $path}';
  }
}

/// generated route for
/// [CreateFileView]
class CreateFileRoute extends PageRouteInfo<CreateFileRouteArgs> {
  CreateFileRoute({Key? key, required String path})
      : super(CreateFileRoute.name,
            path: '/create-File',
            args: CreateFileRouteArgs(key: key, path: path));

  static const String name = 'CreateFileRoute';
}

class CreateFileRouteArgs {
  const CreateFileRouteArgs({this.key, required this.path});

  final Key? key;

  final String path;

  @override
  String toString() {
    return 'CreateFileRouteArgs{key: $key, path: $path}';
  }
}

/// generated route for
/// [FolderView]
class FolderRoute extends PageRouteInfo<FolderRouteArgs> {
  FolderRoute(
      {Key? key,
      required Map<String, dynamic> folder,
      required Color color,
      required String path})
      : super(FolderRoute.name,
            path: '/folder',
            args: FolderRouteArgs(
                key: key, folder: folder, color: color, path: path));

  static const String name = 'FolderRoute';
}

class FolderRouteArgs {
  const FolderRouteArgs(
      {this.key,
      required this.folder,
      required this.color,
      required this.path});

  final Key? key;

  final Map<String, dynamic> folder;

  final Color color;

  final String path;

  @override
  String toString() {
    return 'FolderRouteArgs{key: $key, folder: $folder, color: $color, path: $path}';
  }
}
