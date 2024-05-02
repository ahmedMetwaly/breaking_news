abstract class AuthenticationEvent {}

class UserAuthenticationSuccessEvent extends AuthenticationEvent {}

class UserAuthenticationFailedEvent extends AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class AuthSignUpEvent extends AuthenticationEvent {}

class AuthLogInEvent extends AuthenticationEvent {}

class AuthLogInWithGoogle extends AuthenticationEvent {}

class AuthLogInWithFacebook extends AuthenticationEvent {}

class AuthForgetPassword extends AuthenticationEvent {}

class AuthSendEmailVerfication extends AuthenticationEvent {}

class AuthLogOutEvent extends AuthenticationEvent {}
