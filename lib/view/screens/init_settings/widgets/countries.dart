/* import 'package:breaking_news/bloc/init_settings/init_settings_bloc.dart';
import 'package:breaking_news/bloc/init_settings/init_settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Countries extends StatelessWidget {
  const Countries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitSettingsBloc, InitializeState>(
      builder: (context, state) => ListView.builder(
        itemCount: context.read<InitSettingsBloc>().countries.length,
        itemBuilder: (context, index) => CheckboxListTile(
          value: context.read<InitSettingsBloc>().countriesValues[index],
          onChanged: (value) => context
              .read<InitSettingsBloc>()
              .chooseCountries(value!, index),
          title: Text(context
              .read<InitSettingsBloc>()
              .countries
              .values
              .toList()[index]),
        ),
      ),
    );
  }
}
 */