// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:exam/core/api_manager/api_manager.dart' as _i402;
import 'package:exam/features/auth/register/data/data_source/local/register_local_data_source.dart'
    as _i608;
import 'package:exam/features/auth/register/data/data_source/local/register_shared_prf_data_source.dart'
    as _i1005;
import 'package:exam/features/auth/register/data/data_source/remote/register_api_data_source.dart'
    as _i40;
import 'package:exam/features/auth/register/data/data_source/remote/register_remote_data_source.dart'
    as _i1058;
import 'package:exam/features/auth/register/data/repositories/register_repo_impl.dart'
    as _i849;
import 'package:exam/features/auth/register/domain/contract/register_repo.dart'
    as _i676;
import 'package:exam/features/auth/register/domain/usecases/register_usecase.dart'
    as _i50;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i402.ApiManager>(() => _i402.ApiManager());
    gh.factory<_i608.RegisterLocalDataSource>(
        () => _i1005.RegisterSharedPrfDataSource());
    gh.factory<_i1058.RegisterRemoteDataSource>(
        () => _i40.RegisterApiDataSource(gh<_i402.ApiManager>()));
    gh.factory<_i676.RegisterRepo>(() => _i849.RegisterRepoImpl(
          gh<_i1058.RegisterRemoteDataSource>(),
          gh<_i608.RegisterLocalDataSource>(),
        ));
    gh.factory<_i50.RegisterUseCase>(
        () => _i50.RegisterUseCase(gh<_i676.RegisterRepo>()));
    return this;
  }
}
