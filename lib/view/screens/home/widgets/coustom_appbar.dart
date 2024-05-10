import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({
    super.key,
  });
  String welcomeWord() {
    var now = DateTime.now();
    if (now.hour < 12) {
      return S.current.goodMorning;
    } else if (now.hour < 17) {
      return S.current.goodAfternoon;
    } else {
      return S.current.goodEvening;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              welcomeWord(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
            const SizedBox(
              width: SizeManager.sSpace,
            ),
            Expanded(
              child: Text(
                state is AuthenticationSuccessState
                    ? state.user.name ?? ""
                    : S.current.guest,
                style:
                    Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 24),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}
