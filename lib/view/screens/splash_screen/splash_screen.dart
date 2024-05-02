import "package:breaking_news/bloc/sharedprefrences/sharedpref_bloc.dart";
import "package:breaking_news/bloc/sharedprefrences/sharedpref_state.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:breaking_news/resources/image_manager.dart";
import "package:breaking_news/resources/values_manager.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../bloc/authentication/authentication_bloc.dart";
import "../../../bloc/authentication/authentication_state.dart";
import "../../../resources/routes.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState authState) {
        return BlocListener<SharedPrefBloc, SettingsStates>(
            listener: (context, state) {
              print("in shared");
              if (state is SettingsLoadedSuccessfully) {
                print("isOpenedBefore : ${state.isOpenedBefore}");
                if (state.isOpenedBefore! && authState is AuthLogOutState) {
                  Navigator.of(context).pushReplacementNamed(Routes.logIn);
                } else if (state.isOpenedBefore! &&
                    authState is AuthenticationSuccessState) {
                  Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
                } else if (!state.isOpenedBefore!) {
                  Navigator.of(context).pushReplacementNamed(Routes.appStarts);
                }
              }
            },
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageManager.splash,
                      height: SizeManager.splashIconSize,
                      width: SizeManager.splashIconSize,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: SizeManager.sSpace,
                    ),
                    const CircularProgressIndicator(),
                  ],
                ),
              ),
            ));
      },
      listener: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationSuccessState &&
            FirebaseAuth.instance.currentUser!.emailVerified == true) {
          print("the email verified");

          Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
        } else if (state is AuthenticationSuccessState &&
            FirebaseAuth.instance.currentUser!.emailVerified == false) {
                        print("the email not verified");

          Navigator.of(context).pushReplacementNamed(Routes.verifyEmail);
        }
      },
    );
  }
}
