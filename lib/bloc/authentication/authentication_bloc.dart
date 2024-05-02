import 'dart:async';
import 'package:breaking_news/bloc/authentication/authentication_event.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import '../../services/firebase/authentication_service.dart';
import '../../services/firebase/firestore_service.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthSignUpEvent>(_signUp);
    on<AuthLogInEvent>(_logIn);
    on<AuthLogInWithGoogle>(_loginWithGoogle);
    on<AuthLogInWithFacebook>(_loginWithFacebook);
    on<AuthForgetPassword>(_forgetPassword);
    on<AuthSendEmailVerfication>(_sendEmailVerfication);
    on<AuthLogOutEvent>(_logOut);
    on<AppStarted>(_checkTheUserLogged);
  }

  static UserModel user = UserModel(
      uid: "0",
      name: S.current.guest,
      email: "",
      password: "",
      imageUrl: "",
      country: "us",
      favouriteTopics: [],
      history: [],
      interstedTopics: ["general"],
      phoneNumber: "",
      language: "en",
      emailVerfied: false);

  FutureOr<void> _checkTheUserLogged(
      AppStarted event, Emitter<AuthenticationState> emit) async {
    final userFireBase = FirebaseAuth.instance.currentUser;
    print("checking if the user is null or not");
    if (userFireBase != null) {
      user = await FirestoreService().getUserData(userFireBase.uid);
      print("user found loggedIn");
      emit(AuthenticationSuccessState(user: user));
    } else {
      print("No user");
      emit(AuthLogOutState());
    }
  }

  FutureOr<void> _signUp(
      AuthSignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuthService.signUp(
              emailAddress: user.email ?? "", password: user.password ?? "")
          .then((value) async {
        if (value is UserModel) {
          user = UserModel(
              uid: value.uid,
              name: user.name,
              email: user.email,
              imageUrl: user.imageUrl,
              password: user.password,
              country: user.country,
              favouriteTopics: user.favouriteTopics,
              interstedTopics: user.interstedTopics,
              history: user.history,
              language: user.language,
              phoneNumber: user.phoneNumber,
              emailVerfied: false);
//          await FirebaseAuthService.sendEmailVerfication();
          await FirestoreService()
              .saveUserData(user)
              .then((userData) => emit(AuthenticationSuccessState(user: user)));
        } else {
          emit(AuthenticationFailureState(errorMessage: value.toString()));
        }
      });
    } catch (e) {
      emit(AuthenticationFailureState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _logIn(
      AuthLogInEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuthService.signIn(
              emailAddress: user.email ?? "", password: user.password ?? "")
          .then((value) async {
        if (value is UserModel) {
          user = await FirestoreService().getUserData(value.uid ?? "0");
          emit(AuthenticationSuccessState(user: user));
        } else {
          emit(AuthenticationFailureState(errorMessage: value.toString()));
        }
      });
    } catch (e) {
      emit(AuthenticationFailureState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _loginWithGoogle(
      AuthLogInWithGoogle event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuthService.signInWithGoogle().then((userFormGoogle) async {
        print(userFormGoogle.uid);
        if (userFormGoogle is UserModel) {
          await FirestoreService()
              .getUserData(userFormGoogle.uid ?? "0")
              .then((value) async {
            if (value is UserModel) {
              user = value;
              emit(AuthenticationSuccessState(
                  user: user, initializedSettings: true));
            } else {
              user = UserModel(
                  uid: userFormGoogle.uid,
                  name: userFormGoogle.name,
                  email: userFormGoogle.email,
                  imageUrl: userFormGoogle.imageUrl,
                  password: userFormGoogle.password,
                  country: user.country,
                  favouriteTopics: user.favouriteTopics,
                  interstedTopics: user.interstedTopics,
                  history: user.history,
                  language: user.language,
                  phoneNumber: user.phoneNumber,
                  emailVerfied: userFormGoogle.emailVerfied);
              await FirestoreService().saveUserData(user).then((userData) =>
                  emit(AuthenticationSuccessState(
                      user: user, initializedSettings: false)));
            }
          });
        } else {
          emit(AuthenticationFailureState(
              errorMessage: userFormGoogle.toString()));
        }
      });
    } catch (error) {
      emit(AuthenticationFailureState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _loginWithFacebook(
      event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuthService.signInWithFacebook()
          .then((userFormFacebook) async {
        print(userFormFacebook.uid);
        if (userFormFacebook is UserModel) {
          await FirestoreService()
              .getUserData(userFormFacebook.uid ?? "0")
              .then((value) async {
            if (value is UserModel) {
              user = value;
              emit(AuthenticationSuccessState(
                  user: user, initializedSettings: true));
            } else {
              user = UserModel(
                  uid: userFormFacebook.uid,
                  name: userFormFacebook.name,
                  email: userFormFacebook.email,
                  imageUrl: userFormFacebook.imageUrl,
                  password: userFormFacebook.password,
                  country: user.country,
                  favouriteTopics: user.favouriteTopics,
                  interstedTopics: user.interstedTopics,
                  history: user.history,
                  language: user.language,
                  phoneNumber: user.phoneNumber,
                  emailVerfied: userFormFacebook.emailVerfied);
              await FirestoreService().saveUserData(user).then((userData) =>
                  emit(AuthenticationSuccessState(
                      user: user, initializedSettings: false)));
            }
          });
        } else {
          emit(AuthenticationFailureState(
              errorMessage: userFormFacebook.toString()));
        }
      });
    } catch (error) {
      print(error.toString());
      emit(AuthenticationFailureState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _forgetPassword(
      AuthForgetPassword event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthLoadingState());
      await FirebaseAuthService.forgotPassword(user.email ?? "").then((value) {
        if (value == true) {
          emit(ForgetPasswordEmailSent(
              email: AuthenticationBloc.user.email ?? ""));
        } else {
          emit(AuthenticationFailureState(errorMessage: value));
        }
      });
    } catch (error) {
      emit(AuthenticationFailureState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _logOut(
      AuthLogOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoadingState());
    await FirebaseAuthService.logOut();
    emit(AuthLogOutState());
  }

  FutureOr<void> _sendEmailVerfication(
      AuthSendEmailVerfication event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthLoadingState());
      await FirebaseAuthService.sendEmailVerfication().then((value) {
        if (value == true) {
          emit(
              EmailVerficationSent(email: AuthenticationBloc.user.email ?? ""));
        } 
      });
    } catch (error) {
      emit(AuthenticationFailureState(errorMessage: error.toString()));
    }
  }
}
