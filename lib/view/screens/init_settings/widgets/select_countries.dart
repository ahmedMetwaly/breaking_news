import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/init_settings/init_settings_bloc.dart';
import 'package:breaking_news/bloc/init_settings/init_settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/firestore/firestore_bloc.dart';
import '../../../../bloc/firestore/firestore_event.dart';
import '../../../../bloc/intersted_topics/intersted_topics_bloc.dart';
import '../../../../bloc/intersted_topics/intersted_topicss_event.dart';
import '../../../../bloc/news/news_bloc.dart';
import '../../../../bloc/news/news_event.dart';
import '../../../../generated/l10n.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key, this.fromProfile});
  final bool? fromProfile;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitSettingsBloc, InitializeState>(
      builder: (BuildContext context, InitializeState state) => Column(
        children: [
          Text(
            S.current.selectInterestedCountry,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Divider(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5)),
          DropdownButton(
            value: context.read<InitSettingsBloc>().interstedCountry,
            items: context
                .read<InitSettingsBloc>()
                .countries
                .keys
                .map((country) => DropdownMenuItem(
                    value: country,
                    child: Text(
                      context.read<InitSettingsBloc>().countries[country] ??
                          "us",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )))
                .toList(),
            onChanged: (value) {
              context.read<InitSettingsBloc>().chooseCountries(value ?? "us");
              if (fromProfile != null && fromProfile == true) {
                context.read<InterstedTopicsBloc>().country = value ?? "us";
                AuthenticationBloc.user.country = value ?? "us";
                context.read<NewsBloc>().country = value ?? "us";
                context.read<FirestoreBloc>().add(UpdateUserCountry());
                context.read<InterstedTopicsBloc>().add(GetInterstedTopics());

                context.read<NewsBloc>().add(GetTopHeadline());
              }
            },
          ),
        ],
      ),
    );
  }
}
