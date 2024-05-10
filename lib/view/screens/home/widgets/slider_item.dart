import "package:flutter/material.dart";
import "package:breaking_news/model/article_model.dart";
import "package:breaking_news/view/screens/topics_page/screens/display_article.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../bloc/authentication/authentication_bloc.dart";
import "../../../../bloc/authentication/authentication_state.dart";
import "../../../../bloc/firestore/firestore_bloc.dart";
import "../../../../bloc/firestore/firestore_event.dart";
import "../../../../resources/values_manager.dart";
import "../../../widgets/image_from_network.dart";

class SliderItem extends StatelessWidget {
  const SliderItem({
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
          //print(AuthenticationBloc.user.history);
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeManager.radiusOfBNB),
        ),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(SizeManager.radiusOfBNB),
            child: ImageFromNetwork(
              imagePath: article.imageUrl ?? "",
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Theme.of(context).colorScheme.surface,
                              blurRadius: 8,
                              offset: SizeManager.boxShadowOffset)
                        ],
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  article.author ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ]),
      ),
        ));
  }
}
