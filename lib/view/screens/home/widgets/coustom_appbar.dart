import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({
    super.key,
  });
  String welcomeWord (){
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   welcomeWord(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    state is AuthenticationSuccessState
                        ? state.user.name??""
                        : S.current.guest,
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton.outlined(
                onPressed: () {
                  //TODO::// make a notification when the news updated
                },
                icon: Icon(
                  Icons.notification_important_outlined,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ],
        );
      },
    );
  }
}
