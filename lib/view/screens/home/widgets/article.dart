import "package:breaking_news/bloc/authentication/authentication_bloc.dart";
import "package:breaking_news/bloc/authentication/authentication_state.dart";
import "package:breaking_news/view/screens/topics_page/screens/display_article.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../bloc/firestore/firestore_bloc.dart";
import "../../../../bloc/firestore/firestore_event.dart";
import "../../../../model/article_model.dart";
import "../../../../resources/values_manager.dart";
import "../../../widgets/image_from_network.dart";

class Article extends StatelessWidget {
  const Article({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc,AuthenticationState>(
      builder: (BuildContext context, state) => GestureDetector(
        onTap: () {
          if (state is AuthenticationSuccessState) {
            AuthenticationBloc.user.history!.insert(0, articleModel);
            print(AuthenticationBloc.user.history);
            context.read<FirestoreBloc>().add(UserUpdateDataEvent());
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DisplayArticle(article: articleModel),
            ));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DisplayArticle(article: articleModel),
            ));
          }
        },
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeManager.radiusOfBNB),
                  child: ImageFromNetwork(
                    imagePath: articleModel.imageUrl ?? "",
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: SizeManager.sSpace,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleModel.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 19, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      articleModel.author ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
