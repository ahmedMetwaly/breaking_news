import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/model/user_model.dart';
import 'package:breaking_news/view/screens/signup/widgets/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/resources/routes.dart';
import '../../../bloc/authentication/authentication_event.dart';
import '../../../bloc/init_settings/init_settings_bloc.dart';
import '../../../generated/l10n.dart';
import '../../../resources/values_manager.dart';
import '../../widgets/elevated_button.dart';
import '../init_settings/widgets/check_box.dart';
import '../init_settings/widgets/select_countries.dart';
import '../login/widgets/email.dart';
import '../login/widgets/password.dart';
import 'widgets/name.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneNumberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.signup,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: SizeManager.s80,
                    ),
                    Column(
                      children: [
                        Name(nameController: nameController),
                        const SizedBox(height: SizeManager.sSpace),
                        Email(inputController: emailController),
                        const SizedBox(height: SizeManager.sSpace),
                        Passsword(
                            label: S.current.password,
                            inputController: passwordController,
                            insideSignInPage: false),
                        const SizedBox(height: SizeManager.sSpace),
                        Phone(
                          controller: phoneNumberController,
                        ),
                        const SizedBox(height: 16),
                        const SelectCountry(),
                        //   const InitSettings(),
                        const SizedBox(height: 16),
                        Text(S.current.topicsCare),
                        const ListOfCheckBoxs(),
                        const SizedBox(height: SizeManager.sSpace16),
                        MyElevatedButton(
                          key: const Key("goHome"),
                          title: S.current.signup.toUpperCase(),
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              AuthenticationBloc.user = UserModel(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  imageUrl: "",
                                  history: [],
                                  favouriteTopics: [],
                                  country: context
                                      .read<InitSettingsBloc>()
                                      .interstedCountry,
                                  interstedTopics: context
                                          .read<InitSettingsBloc>()
                                          .interstedTopics
                                          .isEmpty
                                      ? ["general"]
                                      : context
                                          .read<InitSettingsBloc>()
                                          .interstedTopics,
                                  language: context
                                      .read<InitSettingsBloc>()
                                      .selectedLanguage,
                                  phoneNumber: phoneNumberController.text,
                                  emailVerfied: false);

                              context
                                  .read<AuthenticationBloc>()
                                  .add(AuthSignUpEvent());
                              
                            } 
                          },
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        }, listener: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationSuccessState &&
              FirebaseAuth.instance.currentUser!.emailVerified == true) {
            Navigator.of(context).pushReplacementNamed(
              Routes.homeScreen,
            );
          } else if (state is AuthenticationSuccessState &&
              FirebaseAuth.instance.currentUser!.emailVerified == false) {
            Navigator.of(context).pushReplacementNamed(
              Routes.verifyEmail,
            );
          }
        }),
      )),
    );
  }
}
