sealed class LoginStates {}

class LoadingLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class ErrorLoginState extends LoginStates {
  final String errorMessage;

  ErrorLoginState(this.errorMessage);
}
