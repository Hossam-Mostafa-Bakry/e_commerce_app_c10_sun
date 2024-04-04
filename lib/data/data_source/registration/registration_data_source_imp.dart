import 'package:dio/dio.dart';
import 'package:e_commerce_app_c10_sun/data/model/registration_request_data.dart';

import 'registration_data_source.dart';

class RegistrationDataSourceImp implements RegistrationDataSource {
  final Dio dio;

  RegistrationDataSourceImp(this.dio);

  @override
  Future<Response> registration(RegistrationRequestData data) async {
    return await dio.post("/api/v1/auth/signup", data: {
      "name": data.name,
      "email": data.email,
      "password": data.password,
      "rePassword": data.rePassword,
      "phone": data.phone,
    });
  }
}
