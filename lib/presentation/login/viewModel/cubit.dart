import 'package:e_commerce_app_c10_sun/core/failure/failures.dart';
import 'package:e_commerce_app_c10_sun/core/services/snack_bar_service.dart';
import 'package:e_commerce_app_c10_sun/core/services/web_serivces.dart';
import 'package:e_commerce_app_c10_sun/data/data_source/login/login_data_source.dart';
import 'package:e_commerce_app_c10_sun/data/data_source/login/login_data_source_imp.dart';
import 'package:e_commerce_app_c10_sun/data/repository_imp/login_repository_imp.dart';
import 'package:e_commerce_app_c10_sun/domain/repository/login_repository.dart';
import 'package:e_commerce_app_c10_sun/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app_c10_sun/presentation/login/viewModel/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel() : super(LoadingLoginState());

  WebServices _services = WebServices();
  late LoginUseCase loginUseCase;
  late LoginRepository loginRepository;
  late LoginDataSource loginDataSource;

  Future<bool> login(String email, String password) async {
    loginDataSource = LoginDataSourceImp(_services.freeDio);
    loginRepository = LoginRepositoryImp(loginDataSource);
    loginUseCase = LoginUseCase(loginRepository);

    EasyLoading.show();
    final result = await loginUseCase.execute(email, password);

    return result.fold(
      (fail) {
        var failure = fail as ServerFailure;
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage(failure.message ?? "Error on login");
        return Future.value(false);
      },
      (data) {
        EasyLoading.dismiss();
        return Future.value(true);
      },
    );
  }
}
