import 'package:dio/dio.dart';
import 'login_data_source.dart';

class LoginDataSourceImp implements LoginDataSource {

  final Dio dio;
  LoginDataSourceImp(this.dio);

  @override
  Future<Response> login(String email, String password) async {
    return await dio.post(
      "/api/v1/auth/signin",
      data: {
        "email":"hossambakry.route@gmail.com",
        "password":"Asdf1234@"
      }
    );
  }
}