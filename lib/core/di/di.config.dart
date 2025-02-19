// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:exam/core/api_manager/api_manager.dart' as _i402;
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/api_remote_data_source.dart'
    as _i735;
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/remote_data_sources.dart'
    as _i892;
import 'package:exam/features/auth/forgetPassword/data/repositories/forget_password_repo_impl.dart'
    as _i897;
import 'package:exam/features/auth/forgetPassword/domain/repositories/forget_password_repo.dart'
    as _i271;
import 'package:exam/features/auth/forgetPassword/domain/usecases/forget_password.dart'
    as _i24;
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/cubits/forget_password_cubit.dart'
    as _i326;
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
    gh.singleton<_i892.RemoteDataSources>(
        () => _i735.ApiRemoteDataSource(gh<_i402.ApiManager>()));
    gh.singleton<_i271.ForgetPasswordRepo>(
        () => _i897.ForgetPasswordRepoImpl(gh<_i892.RemoteDataSources>()));
    gh.singleton<_i24.ForgetPassword>(
        () => _i24.ForgetPassword(gh<_i271.ForgetPasswordRepo>()));
    gh.singleton<_i326.ForgetPasswordCubit>(
        () => _i326.ForgetPasswordCubit(gh<_i24.ForgetPassword>()));
    return this;
  }
}
