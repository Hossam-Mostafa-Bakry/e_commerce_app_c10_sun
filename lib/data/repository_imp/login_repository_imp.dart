import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_c10_sun/core/failure/failures.dart';
import 'package:e_commerce_app_c10_sun/core/services/web_serivces.dart';
import 'package:e_commerce_app_c10_sun/data/data_source/login/login_data_source.dart';

import '../../domain/repository/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImp(this.loginDataSource);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      final response = await loginDataSource.login(email, password);

      if (response.statusCode == 200) {
        WebServices().setMobileToken(response.data["token"]);

        return const Right(true);
      } else if (response.statusCode == 401) {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data["message"],
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.response?.data["message"] ?? "",
        ),
      );
    }
  }
}
