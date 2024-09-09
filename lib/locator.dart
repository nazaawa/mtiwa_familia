import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mtiwa_familia/core/data/remote/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'locator.config.dart';

final getIt = GetIt.instance;
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio get dio => DioClient.create();
}

@InjectableInit()
void configureDependencies() => getIt.init();
