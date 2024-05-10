import "package:breaking_news/bloc/sharedprefrences/sharedpref_bloc.dart";
import "package:breaking_news/resources/image_manager.dart";
import "package:breaking_news/resources/values_manager.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../bloc/sharedprefrences/sharedpref_state.dart";
import "../../../generated/l10n.dart";
import "../../../resources/routes.dart";
import "../init_settings/widgets/my_toggle_buttons.dart";

class AppStarts extends StatelessWidget {
  const AppStarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SharedPrefBloc, SettingsStates>(
        builder: (BuildContext context, SettingsStates state) => Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ImageManager.onboarding1,
                ),
              ),
            ),
            child: Container(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.35),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.current.selectLanguage,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                shadows: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.surface,
                                  offset: const Offset(1, 3),
                                  blurRadius: 10,
                                  spreadRadius: 20)
                            ]),
                      ),
                      const SizedBox(
                        height: SizeManager.sSpace,
                      ),
                      const SizedBox(width: 190, child: MyToggleButtons()),
                    ]))),
        listener: (BuildContext context, SettingsStates state) {
          if (state is SettingsLoadedSuccessfully) {
            Navigator.of(context).pushReplacementNamed(Routes.onBoarding);
          }
        },
      ),
    );
  }
}
