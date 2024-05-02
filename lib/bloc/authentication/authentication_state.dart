import 'package:breaking_news/model/user_model.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  final UserModel user;
  final bool? initializedSettings;
  AuthenticationSuccessState({required this.user, this.initializedSettings});
}

class ForgetPasswordEmailSent extends AuthenticationState {
  final String email;
  ForgetPasswordEmailSent({required this.email});
}

class EmailVerficationSent extends AuthenticationState {
  final String email;
  EmailVerficationSent({required this.email});
}

class AuthenticationFailureState extends AuthenticationState {
  final String errorMessage;

  AuthenticationFailureState({required this.errorMessage});
}

class AuthLogOutState extends AuthenticationState {}
