import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c10_sun/core/failure/failures.dart';
import 'package:e_commerce_app_c10_sun/data/model/registration_request_data.dart';

abstract class RegistrationRepository {
  Future<Either<Failure, bool>> signUp(RegistrationRequestData data);
}
