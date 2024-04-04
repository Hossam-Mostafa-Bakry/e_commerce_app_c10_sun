import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_c10_sun/core/services/snack_bar_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/failure/failures.dart';
import '../../data/data_source/registration/registration_data_source.dart';

import '../../data/model/registration_request_data.dart';
import '../../domain/entities/user.dart';

import '../../core/services/web_serivces.dart';
import '../../domain/repository/registration_repository.dart';

class RegistrationRepositoryImp implements RegistrationRepository {
  final RegistrationDataSource dataSource;

  RegistrationRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, bool>> signUp(RegistrationRequestData data) async {
    try {
      final response = await dataSource.registration(data);

      if (response.statusCode == 201) {
        User.fromJson(response.data["user"]);
        print("--------------------------------");
        User.printUser();
        WebServices().setMobileToken(response.data["token"]);
        return const Right(true);
      } else if (response.statusCode == 409) {
        print("################################§");
        return Left(
          ServerFailure(
              statusCode: response.statusCode.toString(),
              message: response.data["message"]),
        );
        
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioExceptionType catch (error) {
      // EasyLoading.dismiss();
      print("################################");
      // SnackBarService.showErrorMessage(error.response?.data["message"]);
      return Left(
        ServerFailure(
          statusCode: error.name ?? "",
        ),
      );
    }
  }
}
