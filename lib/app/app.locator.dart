import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:xpress_drive/app/app.locator.config.dart';

final locator = GetIt.instance;  
  
@InjectableInit(  
  initializerName: r'$initGetIt',   
  preferRelativeImports: true,  
  ignoreUnregisteredTypes: [],
  asExtension: false,  
)  
void configureDependencies() => $initGetIt(locator);  