// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:exam/core/api_manager/api_manager.dart' as _i402;
import 'package:exam/features/auth/core/data/data_source/local_data_source/local_data_source.dart'
    as _i564;
import 'package:exam/features/auth/core/data/data_source/local_data_source/secure_storage_local_data_source.dart'
    as _i218;
import 'package:exam/features/auth/core/data/repositories/token_repository_impl.dart'
    as _i976;
import 'package:exam/features/auth/core/domain/repositories.dart/token_repository.dart'
    as _i119;
import 'package:exam/features/auth/core/domain/use_cases/delete_token.dart'
    as _i132;
import 'package:exam/features/auth/core/domain/use_cases/get_token.dart'
    as _i827;
import 'package:exam/features/auth/core/domain/use_cases/save_token.dart'
    as _i289;
import 'package:exam/features/auth/core/presentation/cubit/token_cubit.dart'
    as _i667;
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/api_remote_data_source.dart'
    as _i735;
import 'package:exam/features/auth/forgetPassword/data/datasources/remote/remote_data_sources.dart'
    as _i892;
import 'package:exam/features/auth/forgetPassword/data/repositories/forget_password_repo_impl.dart'
    as _i897;
import 'package:exam/features/auth/forgetPassword/domain/repositories/forget_password_repo.dart'
    as _i271;
import 'package:exam/features/auth/forgetPassword/domain/usecases/enter_email.dart'
    as _i203;
import 'package:exam/features/auth/forgetPassword/domain/usecases/reset_password.dart'
    as _i2;
import 'package:exam/features/auth/forgetPassword/domain/usecases/verfiy_reset_code.dart'
    as _i126;
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/cubits/forget_password_cubit.dart'
    as _i326;
import 'package:exam/features/auth/login/data/datasources/api_remote_datasource.dart'
    as _i57;
import 'package:exam/features/auth/login/data/datasources/remote_datasource.dart'
    as _i1069;
import 'package:exam/features/auth/login/data/ropositories/login_repo_impl.dart'
    as _i968;
import 'package:exam/features/auth/login/domain/ropositories/login_repo.dart'
    as _i690;
import 'package:exam/features/auth/login/domain/usecases/login_usecase.dart'
    as _i1067;
import 'package:exam/features/auth/login/presentation/viewModel/cubits/login_cubit.dart'
    as _i623;
import 'package:exam/features/auth/register/data/data_source/remote/register_api_data_source.dart'
    as _i40;
import 'package:exam/features/auth/register/data/data_source/remote/register_remote_data_source.dart'
    as _i1058;
import 'package:exam/features/auth/register/data/repositories/register_repo_impl.dart'
    as _i849;
import 'package:exam/features/auth/register/domain/contract/register_repo.dart'
    as _i676;
import 'package:exam/features/auth/register/domain/usecase/register_usecase.dart'
    as _i473;
import 'package:exam/features/auth/register/presentation/cubit/register_view_model.dart'
    as _i499;
import 'package:exam/features/exams/data/datasources/remote/exam_api_remote_data_source.dart'
    as _i705;
import 'package:exam/features/exams/data/datasources/remote/exam_remote_data_source.dart'
    as _i50;
import 'package:exam/features/exams/data/repositories/exam_repository_impl.dart'
    as _i300;
import 'package:exam/features/exams/domain/repositories/exam_repository.dart'
    as _i1057;
import 'package:exam/features/exams/domain/usecases/exam_use_case.dart'
    as _i413;
import 'package:exam/features/exams/presentation/view_model/exam_cubit.dart'
    as _i370;
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
    gh.factory<_i564.LocalDataSource>(
        () => _i218.SecureStorageLocalDataSource());
    gh.singleton<_i50.ExamRemoteDataSource>(() =>
        _i705.ExamApiRemoteDataSource(apiManager: gh<_i402.ApiManager>()));
    gh.factory<_i1058.RegisterRemoteDataSource>(
        () => _i40.RegisterApiDataSource(gh<_i402.ApiManager>()));
    gh.factory<_i892.RemoteDataSources>(() => _i735.ApiRemoteDataSource(
          gh<_i402.ApiManager>(),
          gh<_i564.LocalDataSource>(),
        ));
    gh.factory<_i1069.RemoteDatasource>(() => _i57.ApiRemoteDatasource(
          gh<_i402.ApiManager>(),
          gh<_i564.LocalDataSource>(),
        ));
    gh.singleton<_i1057.ExamRepository>(
        () => _i300.ExamRepositoryImpl(gh<_i50.ExamRemoteDataSource>()));
    gh.singleton<_i119.TokenRepository>(
        () => _i976.TokenRepositoryImpl(gh<_i564.LocalDataSource>()));
    gh.factory<_i271.ForgetPasswordRepo>(
        () => _i897.ForgetPasswordRepoImpl(gh<_i892.RemoteDataSources>()));
    gh.factory<_i690.LoginRepo>(
        () => _i968.LoginRepoImpl(gh<_i1069.RemoteDatasource>()));
    gh.singleton<_i413.ExamUseCase>(
        () => _i413.ExamUseCase(gh<_i1057.ExamRepository>()));
    gh.factory<_i676.RegisterRepo>(() => _i849.RegisterRepoImpl(
          gh<_i1058.RegisterRemoteDataSource>(),
          gh<_i564.LocalDataSource>(),
        ));
    gh.factory<_i203.EnterEmail>(
        () => _i203.EnterEmail(gh<_i271.ForgetPasswordRepo>()));
    gh.factory<_i2.ResetPassword>(
        () => _i2.ResetPassword(gh<_i271.ForgetPasswordRepo>()));
    gh.factory<_i126.VerfiyResetCode>(
        () => _i126.VerfiyResetCode(gh<_i271.ForgetPasswordRepo>()));
    gh.factory<_i1067.LoginUsecase>(
        () => _i1067.LoginUsecase(gh<_i690.LoginRepo>()));
    gh.factory<_i132.DeleteToken>(
        () => _i132.DeleteToken(gh<_i119.TokenRepository>()));
    gh.factory<_i827.GetToken>(
        () => _i827.GetToken(gh<_i119.TokenRepository>()));
    gh.factory<_i289.SaveToken>(
        () => _i289.SaveToken(gh<_i119.TokenRepository>()));
    gh.factory<_i326.ForgetPasswordCubit>(() => _i326.ForgetPasswordCubit(
          gh<_i203.EnterEmail>(),
          gh<_i126.VerfiyResetCode>(),
          gh<_i2.ResetPassword>(),
        ));
    gh.singleton<_i370.ExamCubit>(
        () => _i370.ExamCubit(gh<_i413.ExamUseCase>()));
    gh.factory<_i473.RegisterUseCase>(
        () => _i473.RegisterUseCase(gh<_i676.RegisterRepo>()));
    gh.factory<_i667.TokenCubit>(() => _i667.TokenCubit(
          gh<_i827.GetToken>(),
          gh<_i289.SaveToken>(),
          gh<_i132.DeleteToken>(),
        ));
    gh.singleton<_i623.LoginCubit>(
        () => _i623.LoginCubit(gh<_i1067.LoginUsecase>()));
    gh.factory<_i499.RegisterViewModel>(
        () => _i499.RegisterViewModel(gh<_i473.RegisterUseCase>()));
    return this;
  }
}
