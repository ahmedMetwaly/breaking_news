import 'package:breaking_news/bloc/init_settings/init_settings_bloc.dart';
import 'package:breaking_news/bloc/init_settings/init_settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitSettingsBloc,InitializeState>(
      builder: (BuildContext context, InitializeState state) => Row(
        children: [
           Expanded(flex: 3, child: Text(S.current.selectCountry)),
          Expanded(
              flex: 4,
              child: DropdownButton(
                value: context.read<InitSettingsBloc>().interstedCountry,
                items: context
                    .read<InitSettingsBloc>()
                    .countries
                    .keys
                    .map((country) => DropdownMenuItem(
                        value: country,
                        child: Text(
                            context.read<InitSettingsBloc>().countries[country] ??
                                "us")))
                    .toList(),
                onChanged: (value) {
                  context.read<InitSettingsBloc>().chooseCountries(value ?? "us");
                },
              )),
        ],
      ),
    );
  }
}
