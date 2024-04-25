import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/bloc/firestore/firestore_bloc.dart';
import 'package:breaking_news/bloc/firestore/firestore_event.dart';
import 'package:breaking_news/model/article_model.dart';
import 'package:breaking_news/resources/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';

class FavBtn extends StatelessWidget {
  const FavBtn({
    super.key,
    required this.article,
  });
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) =>
          IconButton.outlined(
        icon: AuthenticationBloc.user.favouriteTopics!
                .any((element) => element.url == article.url)
            ? const Icon(Icons.bookmark)
            : const Icon(Icons.bookmark_border_rounded),
        onPressed: () {
          if (state is AuthenticationSuccessState) {
            if (AuthenticationBloc.user.favouriteTopics!
                .any((element) => element.url == article.url)) {
              AuthenticationBloc.user.favouriteTopics?.removeWhere(
                (element) => element.url == article.url,
              );
              debugPrint(AuthenticationBloc.user.favouriteTopics.toString());
              context
                  .read<FirestoreBloc>()
                  .add(UpdateUserFavouriteTopicsEvent());
            } else {
              AuthenticationBloc.user.favouriteTopics?.insert(0, article);
              debugPrint(AuthenticationBloc.user.favouriteTopics.toString());
              context
                  .read<FirestoreBloc>()
                  .add(UpdateUserFavouriteTopicsEvent());
            }
          } else {
            showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(S.current.loginAlertTitle),
                  content: Text(S.current.loginAlertText),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                          Navigator.pushNamed(context, Routes.logIn);
                        },
                        child: Text(S.current.ok)),
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(S.current.cancel),
                    )
                  ],
                );
              },
            );
          }
        },
        constraints: const BoxConstraints.expand(height: 50, width: 40),
        selectedIcon: const Icon(Icons.bookmark),
        color: Theme.of(context).colorScheme.primary,
        tooltip: S.current.addToFav,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.inversePrimary)),
        isSelected: false,
      ),
    );
  }
}
