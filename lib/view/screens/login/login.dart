import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:breaking_news/resources/image_manager.dart";
import "package:breaking_news/resources/values_manager.dart";
import 'package:breaking_news/view/screens/login/widgets/email.dart';
import 'package:breaking_news/view/screens/login/widgets/password.dart';
import 'package:breaking_news/view/screens/login/widgets/socialmedia_btn.dart';

import '../../../bloc/authentication/authentication_event.dart';
import '../../../generated/l10n.dart';
import '../../../model/user_model.dart';
import '../../../resources/routes.dart';
import '../../widgets/elevated_button.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, AuthenticationState state) {
            //print(state);
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(ImageManager.splash,
                            width: MediaQuery.of(context).size.width * 0.35)),
                    Text(
                      S.current.logIn,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Column(
                      children: [
                        Email(inputController: emailController),
                        const SizedBox(height: SizeManager.sSpace),
                        Passsword(
                            label: S.current.password,
                            inputController: passwordController,
                            insideSignInPage: true),
                        const SizedBox(height: SizeManager.sSpace),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.forgetPassword);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(S.current.forgotPassword),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: SizeManager.sIconSize,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                        MyElevatedButton(
                          title: S.current.logIn.toUpperCase(),
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              AuthenticationBloc.user = UserModel(
                                  name: "",
                                  email: emailController.text,
                                  password: passwordController.text,
                                  imageUrl: "",
                                  favouriteTopics: [],
                                  history: [],
                                  interstedTopics: [],
                                  language: "en",
                                  country: "us",
                                  emailVerfied: false);
                              context
                                  .read<AuthenticationBloc>()
                                  .add(AuthLogInEvent());
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    Column(
                      children: [
                        Center(
                            child: Text(
                          S.current.loginWithSocialMedia,
                          textAlign: TextAlign.center,
                        )),
                        const SizedBox(height: SizeManager.sSpace16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SocialMediaButton(
                                onPressed: () {
                                  context
                                      .read<AuthenticationBloc>()
                                      .add(AuthLogInWithGoogle());
                                },
                                svgImagePath: ImageManager.google),
                            const SizedBox(
                              width: SizeManager.sSpace16,
                            ),
                            SocialMediaButton(
                                onPressed: () => context
                                    .read<AuthenticationBloc>()
                                    .add(AuthLogInWithFacebook()),
                                svgImagePath: ImageManager.facebook),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(S.current.dontHaveAccount),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.signUp);
                            },
                            child: Text(
                              S.current.signup,
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(S.current.continueAsGuest),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.homeScreen);
                            },
                            child: Text(
                              S.current.guest,
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.fontSize),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, AuthenticationState state) {
            if (state is AuthLoadingState) {
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Prevent user from dismissing the dialog
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is AuthenticationFailureState) {
              Navigator.pop(context);
              showDialog<bool>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(S.current.error),
                    content: Text(state.errorMessage),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(S.current.ok)),
                    ],
                  );
                },
              );
            }
            if (state is AuthenticationSuccessState &&
                FirebaseAuth.instance.currentUser!.emailVerified == true) {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
            }
            if (state is AuthenticationSuccessState &&
                FirebaseAuth.instance.currentUser!.emailVerified == false) {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(Routes.verifyEmail);
            }
          },
        ),
      )),
    );
  }
}
