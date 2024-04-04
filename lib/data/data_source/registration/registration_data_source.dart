import 'package:dio/dio.dart';

import '../../model/registration_request_data.dart';

abstract class RegistrationDataSource {

  Future<Response> registration(RegistrationRequestData data);

}