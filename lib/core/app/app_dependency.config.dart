// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:test_tik/core/app/app_dependency.dart' as _i856;
import 'package:test_tik/core/app/app_preference.dart' as _i1073;
import 'package:test_tik/data/network/api_client.dart' as _i968;
import 'package:test_tik/data/network/api_request.dart' as _i493;
import 'package:test_tik/data/network/demo_api_client.dart' as _i271;
import 'package:test_tik/features/home/cubit/home_cubit.dart' as _i137;
import 'package:test_tik/features/home/repository/home_repo.dart' as _i445;
import 'package:test_tik/features/home/repository/home_repo_imp.dart' as _i171;
import 'package:test_tik/features/no_internet/cubit/internet_cubit.dart'
    as _i84;
import 'package:test_tik/features/theme/cubit/theme_cubit.dart' as _i389;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i1073.AppPreferences>(() => _i1073.AppPreferences());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i361.Dio>(() => appModule.dio);
  gh.factory<_i389.ThemeCubit>(() => _i389.ThemeCubit());
  gh.factory<_i84.InternetCubit>(() => _i84.InternetCubit());
  gh.factory<_i493.ApiRequest>(() => _i493.ApiRequest());
  gh.factory<_i271.ApiClient>(() => _i271.ApiClient(gh<_i361.Dio>()));
  gh.factory<_i968.ApiClient>(() => _i968.ApiClient(gh<_i361.Dio>()));
  gh.factory<_i445.HomeRepository>(
      () => _i171.HomeRepositoryImp(apiRequest: gh<_i493.ApiRequest>()));
  gh.factory<_i137.HomeCubit>(
      () => _i137.HomeCubit(gh<_i445.HomeRepository>()));
  return getIt;
}

class _$AppModule extends _i856.AppModule {}
