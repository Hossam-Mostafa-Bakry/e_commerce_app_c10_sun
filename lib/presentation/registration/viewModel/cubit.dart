import 'package:e_commerce_app_c10_sun/core/failure/failures.dart';
import 'package:e_commerce_app_c10_sun/core/services/snack_bar_service.dart';
import 'package:e_commerce_app_c10_sun/core/services/web_serivces.dart';
import 'package:e_commerce_app_c10_sun/data/data_source/registration/registration_data_source.dart';
import 'package:e_commerce_app_c10_sun/data/data_source/registration/registration_data_source_imp.dart';
import 'package:e_commerce_app_c10_sun/data/model/registration_request_data.dart';
import 'package:e_commerce_app_c10_sun/data/repository_imp/registration_repository_imp.dart';
import 'package:e_commerce_app_c10_sun/domain/repository/registration_repository.dart';
import 'package:e_commerce_app_c10_sun/domain/use_cases/registration_use_case.dart';
import 'package:e_commerce_app_c10_sun/presentation/registration/viewModel/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegistrationViewModel extends Cubit<RegistrationStates> {
  RegistrationViewModel() : super(LoadingRegistrationState());

  late RegistrationDataSource registrationDataSource;
  late RegistrationUseCaSe registrationUseCaSe;
  late RegistrationRepository registrationRepository;

  final WebServices _services = WebServices();

  Future<bool> singUp(RegistrationRequestData data) async {

    EasyLoading.show();
    emit(LoadingRegistrationState());
    registrationDataSource = RegistrationDataSourceImp(_services.freeDio);
    registrationRepository = RegistrationRepositoryImp(registrationDataSource);
    registrationUseCaSe = RegistrationUseCaSe(registrationRepository);

    final result = await registrationUseCaSe.execute(data);


    EasyLoading.dismiss();
    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        SnackBarService.showErrorMessage(error.message ?? "Fail to register");
        emit(ErrorRegistrationState());
        return Future.value(false);
      },
      (data) {

        emit(SuccessRegistrationState());
        return Future.value(true);
      },
    );
  }
}
