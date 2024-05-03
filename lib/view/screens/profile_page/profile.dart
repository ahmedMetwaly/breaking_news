// ignore_for_file: invalid_use_of_visible_for_testing_membe
import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/bloc/intersted_topics/intersted_topics_bloc.dart';
import 'package:breaking_news/bloc/intersted_topics/intersted_topicss_event.dart';
import 'package:breaking_news/model/user_model.dart';
import 'package:breaking_news/view/screens/profile_page/widgets/change_lang.dart';
import 'package:breaking_news/view/screens/profile_page/widgets/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/generated/l10n.dart';
import 'package:breaking_news/resources/values_manager.dart';
import 'package:breaking_news/view/widgets/image_from_network.dart';
import 'package:intl/intl.dart';
import '../../../bloc/authentication/authentication_event.dart';
import '../../../resources/routes.dart';
import 'widgets/change_intersted_country.dart';
import 'widgets/change_profile_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Intl.getCurrentLocale() == "en"
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Text(
                  S.current.myProfile,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              state is AuthenticationSuccessState
                  ? const ChangeProfileImageWidget()
                  : ImageFromNetwork(
                      imagePath: AuthenticationBloc.user.imageUrl ?? "",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: SizeManager.sSpace),
                    Text(
                      state is AuthenticationSuccessState
                          ? state.user.name ?? S.current.userError
                          : S.current.guest,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      state is AuthenticationSuccessState
                          ? state.user.email ?? S.current.emailErrorSignUp
                          : "",
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              const ChangeTheme(),
              const ChangeLanguageWidget(),
              const SizedBox(height: SizeManager.sSpace),
              const ChangeInterstedCountry(),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.history);
                },
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  S.current.history,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    if (state is AuthenticationSuccessState) {
                      showDialog<bool>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(S.current.confirmLogout),
                            content: Text(S.current.logoutDescription),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<InterstedTopicsBloc>()
                                        .interstedTopics = ["general"];
                                    context
                                        .read<InterstedTopicsBloc>()
                                        .country = "us";
                                    context
                                        .read<InterstedTopicsBloc>()
                                        .add(GetInterstedTopics());
                                    context
                                        .read<AuthenticationBloc>()
                                        .add(AuthLogOutEvent());

                                    Navigator.pop(context, true);
                                  },
                                  child: Text(S.current.ok)),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text(S.current.cancel),
                              )
                            ],
                          );
                        },
                      );
                    }
                    if (state is AuthLogOutState) {
                      Navigator.of(context).pushNamed(Routes.logIn);
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      state is AuthenticationSuccessState
                          ? S.current.logOut
                          : S.current.logIn,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background),
                    ),
                  )),
            ],
          ),
        ),
      ),
      listener: (BuildContext context, AuthenticationState state) {
        if (state is AuthLogOutState) {
          AuthenticationBloc.user = UserModel(
            uid: "0",
            name: S.current.guest,
            email: "",
            imageUrl: "",
            password: "",
            emailVerfied: false,
            country: "us",
            favouriteTopics: [],
            history: [],
            interstedTopics: ["general"],
            language: "en",
          );
        }
      },
    ));
  }
}
