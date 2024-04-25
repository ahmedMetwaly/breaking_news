import 'package:breaking_news/bloc/init_settings/init_settings_states.dart';
import 'package:breaking_news/bloc/sharedprefrences/sharedpref_bloc.dart';
import 'package:breaking_news/bloc/sharedprefrences/sharedpref_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/init_settings/init_settings_bloc.dart';
import '../../../../resources/values_manager.dart';

class MyToggleButtons extends StatelessWidget {
  const MyToggleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: PaddingManager.pInternalPadding),
        child: SizedBox(
          height: 50,
          child: BlocBuilder<InitSettingsBloc, InitializeState>(
            builder: (BuildContext context, InitializeState state) =>
                ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: context.read<InitSettingsBloc>().languages.length,
              itemBuilder: (context, index) => ElevatedButton(
                  onPressed: () {
                    context.read<InitSettingsBloc>().chooseLanguage(index);

                    // context.read<SharedPrefBloc>().lang =
                    //     context.read<InitSettingsBloc>().selectedLanguage;
                    context.read<SharedPrefBloc>().changeLang(context.read<InitSettingsBloc>().selectedLanguage);

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          context.read<InitSettingsBloc>().languageValues[index]
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context).colorScheme.background),

                      shadowColor:const MaterialStatePropertyAll<Color>(
                        Colors.black,
                      ) ,
                      side: MaterialStatePropertyAll(BorderSide(
                          color: context
                                  .read<InitSettingsBloc>()
                                  .languageValues[index]
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context).colorScheme.onPrimary))),
                  child: Text(
                      context
                          .read<InitSettingsBloc>()
                          .languages
                          .values
                          .toList()[index],
                      style: TextStyle(
                        color: context
                                .read<InitSettingsBloc>()
                                .languageValues[index]
                            ? Theme.of(context).colorScheme.inversePrimary
                            : Theme.of(context).colorScheme.primary,
                      ))),
              separatorBuilder: (context, index) => const SizedBox(
                width: SizeManager.sSpace,
              ),
            ),
          ),
        ));
  }
}
