import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c10_sun/domain/repository/login_repository.dart';

import '../../core/failure/failure.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure, bool>> execute(String email, String password) async {
    return await loginRepository.login(email, password);
  }
}
