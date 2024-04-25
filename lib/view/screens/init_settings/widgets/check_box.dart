import "package:breaking_news/bloc/init_settings/init_settings_bloc.dart";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../bloc/init_settings/init_settings_states.dart";

class ListOfCheckBoxs extends StatelessWidget {
  const ListOfCheckBoxs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitSettingsBloc, InitializeState>(
      builder: (BuildContext context, InitializeState state) =>
          ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: context.read<InitSettingsBloc>().topics.length,
        itemBuilder: (context, index) => CheckboxListTile(
          value: context.read<InitSettingsBloc>().topicsValue[index],
          onChanged: (value) => context
              .read<InitSettingsBloc>()
              .chooseInterstedTopics(value!, index),
          title: Text(context.read<InitSettingsBloc>().topics.values.toList()[index]),
        ),
      ),
    );
  }
}
