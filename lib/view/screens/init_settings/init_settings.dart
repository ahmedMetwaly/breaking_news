import 'package:breaking_news/bloc/firestore/firestore_bloc.dart';
import 'package:breaking_news/bloc/sharedprefrences/sharedpref_bloc.dart';
import 'package:breaking_news/generated/l10n.dart';
import 'package:breaking_news/resources/values_manager.dart';
import 'package:breaking_news/view/screens/init_settings/widgets/check_box.dart';
import 'package:breaking_news/view/screens/init_settings/widgets/select_countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/authentication/authentication_bloc.dart';
import '../../../bloc/firestore/firestore_event.dart';
import '../../../bloc/init_settings/init_settings_bloc.dart';
import '../../../bloc/init_settings/init_settings_states.dart';
import '../../../resources/routes.dart';

class InitSettings extends StatelessWidget {
  const InitSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          child: BlocBuilder<InitSettingsBloc, InitializeState>(
            builder: (BuildContext context, InitializeState state) => ListView(
              children: [
                SwitchListTile(
                  value: context.read<InitSettingsBloc>().isDark,
                  contentPadding:
                      Localizations.localeOf(context).languageCode == "en"
                          ? const EdgeInsets.only(left: 0)
                          : const EdgeInsets.only(right: 0),
                  onChanged: (value) {
                    context.read<SharedPrefBloc>().changeTheme(value);

                    context.read<InitSettingsBloc>().toggleTheme();
                  },
                  title: Text(S.current.darkMode),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SelectCountry(),
                Divider(
                  color: Theme.of(context).colorScheme.outline,
                ),
                Text(S.current.topicsCare),
                const ListOfCheckBoxs(),
                const SizedBox(height: SizeManager.sSpace16),
                ElevatedButton(
                    onPressed: () {
                      AuthenticationBloc.user.interstedTopics =
                          context.read<InitSettingsBloc>().interstedTopics;
                      AuthenticationBloc.user.country =
                          context.read<InitSettingsBloc>().interstedCountry;
                      context
                          .read<FirestoreBloc>()
                          .add(UpdateUserInterstedTopics());
                      context.read<FirestoreBloc>().add(UpdateUserCountry());
                      Navigator.pushReplacementNamed(
                          context, Routes.homeScreen);
                    },
                    child: Text(
                      S.current.submit,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    )),
                // const Countries(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
