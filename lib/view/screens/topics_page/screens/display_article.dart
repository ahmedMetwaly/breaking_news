import 'package:breaking_news/bloc/firestore/firestore_state.dart';
import 'package:breaking_news/view/screens/topics_page/screens/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:breaking_news/generated/l10n.dart';
import 'package:breaking_news/model/article_model.dart';
import 'package:breaking_news/view/widgets/fav_btn.dart';
import 'package:breaking_news/view/widgets/image_from_network.dart';
import '../../../../bloc/firestore/firestore_bloc.dart';
import '../../../../resources/values_manager.dart';

class DisplayArticle extends StatelessWidget {
  const DisplayArticle({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FirestoreBloc, FirestoreState>(
        builder: (BuildContext context, FirestoreState state) {
          if (state is UpdatindDataState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UpdateFailedDataState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(S.current.error),
                      content: Text(state.errorMessage),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(S.current.ok)),
                      ],
                    ));
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                leading: IconButton.outlined(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).colorScheme.background,
                    )),
                flexibleSpace: FlexibleSpaceBar(
                  background: ImageFromNetwork(
                    imagePath: article.imageUrl ??
                        "https://s3-alpha-sig.figma.com/img/29f6/dff6/14280599de65722cd9b68a1f7d67995b?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=myxeZQztmJ8IvJ9Q2N~y9WjR6wRoln11W1R~xNGW0qRH-7Ett6g46R5chG-UwAvSHlBO1yps2FSK9~F9Ko188rkt0xbgzUBItU~ZDAHZk5MsaDlDCz5pNNdtOdNL61UF9rWcHp7nE99pGZulbbLDKrvNYV7BG38Xt3zTSPg8ERYgWrURh1x6BSIRkR-8VMZ7NarTXiA3cL0aVewXreTreypDXp1aki6V9W9iZh9YJrFGtPUUqKzJmFtaAXpjeTcjs4nkpCVFK8LLONDPZfRtRQNf1Ee2eWf2YpdQjteB6sc~zAQ8Ud4iYOfDH7Jp6SzPjYXBlCsrs4cc61rOKn0KoA__",
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  titlePadding: const EdgeInsets.symmetric(
                      horizontal: PaddingManager.pInternalPadding,
                      vertical: PaddingManager.pInternalPadding),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                article.title ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      shadows: [
                                        Shadow(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            blurRadius: 10,
                                            offset: SizeManager.boxShadowOffset)
                                      ],
                                      fontWeight: FontWeight.w600,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                article.author ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: Colors.white60,
                                  shadows: [
                                    Shadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        blurRadius: 10,
                                        offset: SizeManager.boxShadowOffset)
                                  ],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )),
                      FavBtn(article: article),
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(PaddingManager.pMainPadding),
                  child: Column(
                    children: [
                      Text(
                        article.title ?? "",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: SizeManager.sSpace,
                          ),
                          Expanded(child: Text(article.author ?? "")),
                          const Text(" | "),
                          Expanded(
                            child: Text(
                              convertDateFormat(
                                  article.time ?? DateTime.now().toString()),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingManager.pMainPadding),
                  child: Divider(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingManager.pMainPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.content,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      Text(article.description ?? ""),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(PaddingManager.pMainPadding),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WebView(
                            url: article.url,
                          ),
                        ));
                      },
                      child: Text(
                        S.current.goToLink,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: PaddingManager.pMainPadding,
                      right: PaddingManager.pMainPadding,
                      bottom: PaddingManager.pMainPadding),
                  child: Text(
                      article.source?.name != null
                          ? " ${S.current.by} ${article.source?.name}"
                          : "",
                      textAlign: Intl.getCurrentLocale() == "en"
                          ? TextAlign.right
                          : TextAlign.left),
                ),
              ])),
            ],
          );

          /*  return const Center(
            child: CircularProgressIndicator(),
          ); */
        },
      ),
    );
  }
}

String convertDateFormat(String time) {
  DateTime dateTime = DateTime.parse(time);
  String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
  return formattedDate;
}
