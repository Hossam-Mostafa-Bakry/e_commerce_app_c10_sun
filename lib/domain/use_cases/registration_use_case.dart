import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c10_sun/data/model/registration_request_data.dart';
import 'package:e_commerce_app_c10_sun/domain/repository/registration_repository.dart';

import '../../core/failure/failure.dart';

class RegistrationUseCaSe {


  final RegistrationRepository repository;
  RegistrationUseCaSe(this.repository);

  Future<Either<Failure, bool>> execute(RegistrationRequestData data) async {
    return await repository.signUp(data);
  }
}