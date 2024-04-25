import 'package:flutter/material.dart';
import 'package:breaking_news/view/screens/topics_page/screens/display_article.dart';
import 'package:breaking_news/view/widgets/fav_btn.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/authentication/authentication_bloc.dart';
import '../../../../bloc/authentication/authentication_state.dart';
import '../../../../bloc/firestore/firestore_bloc.dart';
import '../../../../bloc/firestore/firestore_event.dart';
import '../../../../model/article_model.dart';
import '../../../../resources/values_manager.dart';
import '../../../widgets/image_from_network.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) => GestureDetector(
              onTap: () {
                if (state is AuthenticationSuccessState) {
                  AuthenticationBloc.user.history!.insert(0, article);
                  print(AuthenticationBloc.user.history);
                  context.read<FirestoreBloc>().add(UserUpdateDataEvent());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DisplayArticle(article: article),
                  ));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DisplayArticle(article: article),
                  ));
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeManager.borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.outline,
                        offset: const Offset(0, 0),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ]),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(SizeManager.borderRadius),
                      child: ImageFromNetwork(
                        imagePath: article.imageUrl ?? "",
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FavBtn(article: article),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: PaddingManager.pInternalPadding,
                          vertical: PaddingManager.p10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom:
                                  Radius.circular(SizeManager.borderRadius)),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary,
                              //offset: const Offset(0, 0),
                              spreadRadius: 0.5,
                              blurRadius: 8,
                            ),
                          ]),
                      child: Text(
                        article.title ?? "",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
