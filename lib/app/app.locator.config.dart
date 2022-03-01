// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i6;

import '../services/auth_service.dart' as _i4;
import '../services/biometric_service.dart' as _i5;
import '../services/encryption_service.dart' as _i7;
import '../services/ipfs_service.dart' as _i8;
import '../services/third_party_module_service.dart' as _i9;
import 'app.router.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.AuthService>(_i4.AuthService());
  gh.singleton<_i5.BiometricService>(_i5.BiometricService());
  gh.lazySingleton<_i6.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.lazySingleton<_i6.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.singleton<_i7.EncryptionService>(_i7.EncryptionService());
  gh.singleton<_i8.IpfsService>(_i8.IpfsService());
  gh.lazySingleton<_i6.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i6.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  return get;
}

class _$ThirdPartyServicesModule extends _i9.ThirdPartyServicesModule {
  @override
  _i6.BottomSheetService get bottomSheetService => _i6.BottomSheetService();
  @override
  _i6.DialogService get dialogService => _i6.DialogService();
  @override
  _i6.NavigationService get navigationService => _i6.NavigationService();
  @override
  _i6.SnackbarService get snackBarService => _i6.SnackbarService();
}
