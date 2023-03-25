// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_base_architecture/data/repository/local/preference/app_preferences.dart'
    as _i5;
import 'package:flutter_base_architecture/di/local_module.dart' as _i6;
import 'package:flutter_base_architecture/ui/home/home_bloc.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.AppPreferences>(
        () => _i5.AppPreferences(gh<_i4.SharedPreferences>()));
    return this;
  }
}

class _$InjectableModule extends _i6.InjectableModule {}
