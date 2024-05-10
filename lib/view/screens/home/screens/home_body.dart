/* import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../bloc/authentication/authentication_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../model/article_model.dart';
import '../../../../resources/values_manager.dart';
import '../widgets/article.dart';
import '../widgets/header.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.interstedTopics,
  });
  final List<ResponseModel> interstedTopics;
  @override
  Widget build(BuildContext context) {
 
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: CustomScrollView(
          slivers: [
            const Header(),
            makeHeader(S.current.discover),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 22.0),
                height: 85.0,
                child: Text(
                  getInterstedTopics(
                      AuthenticationBloc.user.interstedTopics?[0] ?? ""),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            SliverList.separated(
              itemCount: interstedTopics.length,
              separatorBuilder: (ctx, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 22.0),
                  height: 85.0,
                  child: interstedTopics.length == 1
                      ? const SizedBox()
                      : (AuthenticationBloc.user.interstedTopics!.length > 1)
                          ? Text(
                              getInterstedTopics(AuthenticationBloc
                                      .user.interstedTopics?[index + 1] ??
                                  ""),
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          : Text(
                              getInterstedTopics(AuthenticationBloc
                                      .user.interstedTopics?[index] ??
                                  ""),
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                );
              },
              itemBuilder: (ctx, index) => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (ctx, index) =>
                    const SizedBox(height: SizeManager.sSpace),
                itemCount: interstedTopics[index].articles?.length ?? 0,
                itemBuilder: (ctx, indx) => Article(
                  articleModel: ArticleModel(
                    imageUrl: interstedTopics[index].articles?[indx].imageUrl,
                    title: interstedTopics[index].articles?[indx].title,
                    author: interstedTopics[index].articles?[indx].author,
                    url: interstedTopics[index].articles?[indx].url,
                    description:
                        interstedTopics[index].articles?[indx].description,
                    content: interstedTopics[index].articles?[indx].content,
                    source: interstedTopics[index].articles?[indx].source,
                    time: interstedTopics[index].articles?[indx].time,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */