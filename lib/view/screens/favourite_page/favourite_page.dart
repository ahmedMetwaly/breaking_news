import "package:breaking_news/bloc/authentication/authentication_bloc.dart";
import "package:breaking_news/generated/l10n.dart";
import "package:breaking_news/resources/values_manager.dart";
import "package:breaking_news/view/screens/home/widgets/article.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../bloc/firestore/firestore_bloc.dart";
import "../../../../bloc/firestore/firestore_event.dart";
import "../../../../bloc/firestore/firestore_state.dart";

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const SizedBox(),
            leadingWidth: 0,
            title: Text(S.current.favorite,
                style: Theme.of(context).textTheme.headlineMedium)),
        body: Padding(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          child: BlocConsumer<FirestoreBloc, FirestoreState>(
            builder: (context, state) {
              if (state is UpdatingFavoriteState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return AuthenticationBloc.user.favouriteTopics!.isEmpty
                  ? Center(
                      child: Text(S.current.noFavorite),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              AuthenticationBloc.user.favouriteTopics = [];
                              context
                                  .read<FirestoreBloc>()
                                  .add(UpdateUserFavouriteTopicsEvent());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                                const SizedBox(width: SizeManager.sSpace),
                                Text(
                                  S.current.clear,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: SizeManager.sSpace
                        ),
                        Expanded(
                          child: ListView.separated(
                              key: UniqueKey(),
                              itemBuilder: (context, index) => Dismissible(
                                    key: Key(index.toString()),
                                    background: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      padding: const EdgeInsets.all(
                                          PaddingManager.pInternalPadding),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius: BorderRadius.circular(
                                              SizeManager
                                                  .borderRadiusOfInputField)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            S.current.delete,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background),
                                          ),
                                          const SizedBox(
                                            width: SizeManager.sSpace,
                                          ),
                                          Icon(
                                            Icons.delete,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                          )
                                        ],
                                      ),
                                    ),
                                    direction: DismissDirection.endToStart,
                                    confirmDismiss: (direction) {
                                      return showDialog<bool>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                Text(S.current.confirmDelete),
                                            content:
                                                Text(S.current.deleteContent),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, true),
                                                  child: Text(S.current.ok)),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, false),
                                                child: Text(S.current.cancel),
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    onDismissed: (direction) {
                                      AuthenticationBloc.user.favouriteTopics
                                          ?.removeAt(index);
                                      context.read<FirestoreBloc>().add(
                                          UpdateUserFavouriteTopicsEvent());
                                    },
                                    child: Article(
                                      articleModel: AuthenticationBloc
                                          .user.favouriteTopics![index],
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: SizeManager.sSpace,
                                  ),
                              itemCount: AuthenticationBloc
                                  .user.favouriteTopics!.length),
                        ),
                      ],
                    );
            },
            listener: (BuildContext context, FirestoreState state) {
              if (state is UpdateFailedDataState) {
                showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.current.error),
                      content: Text(state.errorMessage),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text(S.current.retry)),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
