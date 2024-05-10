import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/bloc/firestore/firestore_bloc.dart';
import 'package:breaking_news/bloc/sharedprefrences/sharedpref_bloc.dart';
import 'package:breaking_news/bloc/sharedprefrences/sharedpref_state.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../bloc/firestore/firestore_event.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/values_manager.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SharedPrefBloc, SettingsStates>(
        builder: (context, state) => ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  useSafeArea: true,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.all(PaddingManager.pInternalPadding),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                          topLeft:
                              Radius.circular(SizeManager.bottomSheetRadius),
                          topRight:
                              Radius.circular(SizeManager.bottomSheetRadius)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: SizeManager.sSpace,
                        ),
                        Text(
                          S.current.selectLanguage,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        ListTile(
                          onTap: () {
                            BlocListener<AuthenticationBloc,
                                AuthenticationState>(
                              listener: (BuildContext context,
                                  AuthenticationState state) {
                                if (state is AuthenticationSuccessState) {
                                  AuthenticationBloc.user.language = "en";
                                  context
                                      .read<FirestoreBloc>()
                                      .add(ChangeLanguageOnFirestore());
                                }
                              },
                            );

                            context.read<SharedPrefBloc>().changeLang("en");
                            Navigator.pop(context);
                          },
                          title: Text(S.current.enLang),
                        ),
                        ListTile(
                          onTap: () {
                            BlocListener<AuthenticationBloc,
                                AuthenticationState>(
                              listener: (BuildContext context,
                                  AuthenticationState state) {
                                if (state is AuthenticationSuccessState) {
                                  AuthenticationBloc.user.language = "ar";
                                  context
                                      .read<FirestoreBloc>()
                                      .add(ChangeLanguageOnFirestore());
                                }
                              },
                            );

                            context.read<SharedPrefBloc>().changeLang("ar");
                            Navigator.pop(context);
                          },
                          title: Text(S.current.arLang),
                        ),
                      ],
                    ),
                  ),
                );
              },
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                S.current.language,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                Intl.getCurrentLocale() == "en"
                    ? S.current.enLang
                    : S.current.arLang,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
        listener: (context, state) {
          if (state is LoadingSettings) {
            showDialog(
              context: context,
              barrierDismissible:
                  false, // Prevent user from dismissing the dialog
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is SettingsLoadedSuccessfully) {
            Navigator.of(context).pop();
          }
        });
  }
}
