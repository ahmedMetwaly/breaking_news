import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/model/article_model.dart';
import 'package:breaking_news/resources/values_manager.dart';
import 'package:breaking_news/view/screens/home/widgets/header.dart';
import '../../../bloc/intersted_topics/intersted_topics_bloc.dart';
import '../../../bloc/intersted_topics/intersted_topics_state.dart';
import '../../../bloc/intersted_topics/intersted_topicss_event.dart';
import '../../../generated/l10n.dart';
import 'widgets/article.dart';
import "dart:math";

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(minHeight, maxHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SliverPersistentHeader makeHeader(String headerText) {
      return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverAppBarDelegate(
          minHeight: 75.0,
          maxHeight: 75.0,
          child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Align(
                alignment: Localizations.localeOf(context).languageCode == "en"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Text(
                  headerText,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )),
        ),
      );
    }

    String getInterstedTopics(String topic) {
      switch (topic) {
        case "general":
          return S.current.general;
        case "business":
          return S.current.business;
        case "entertainment":
          return S.current.entertainment;
        case "health":
          return S.current.health;
        case "science":
          return S.current.science;
        case "sports":
          return S.current.sports;
        case "technology":
          return S.current.technology;
        case "favourite":
          return S.current.favorite;
        default:
          return S.current.error;
      }
    }

    return Scaffold(
      body: BlocConsumer<InterstedTopicsBloc, InterstedTopicsState>(
        builder: (context, state) {
          //print(state);
          if (state is InitialState) {
            context.read<InterstedTopicsBloc>().country =
                AuthenticationBloc.user.country ?? "us";
            context.read<InterstedTopicsBloc>().interstedTopics =
                AuthenticationBloc.user.interstedTopics ?? ["general"];
            context.read<InterstedTopicsBloc>().add(GetInterstedTopics());
          }
          if (state is SuccessState && state.interstedTopics.isNotEmpty) {
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
                              AuthenticationBloc.user.interstedTopics?[0] ??
                                  ""),
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                    SliverList.separated(
                      itemCount: state.interstedTopics.length,
                      separatorBuilder: (ctx, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 22.0),
                          height: 85.0,
                          child: state.interstedTopics.length == 1
                              ? const SizedBox()
                              : (AuthenticationBloc
                                          .user.interstedTopics!.length >
                                      1)
                                  ? Text(
                                      getInterstedTopics(AuthenticationBloc.user
                                              .interstedTopics?[index + 1] ??
                                          ""),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
                                    )
                                  : Text(
                                      getInterstedTopics(AuthenticationBloc
                                              .user.interstedTopics?[index] ??
                                          ""),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
                                    ),
                        );
                      },
                      itemBuilder: (ctx, index) => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (ctx, index) =>
                            const SizedBox(height: SizeManager.sSpace),
                        itemCount:
                            state.interstedTopics[index].articles?.length ?? 0,
                        itemBuilder: (ctx, indx) => Article(
                          articleModel: ArticleModel(
                            imageUrl: state.interstedTopics[index]
                                .articles?[indx].imageUrl,
                            title: state
                                .interstedTopics[index].articles?[indx].title,
                            author: state
                                .interstedTopics[index].articles?[indx].author,
                            url: state
                                .interstedTopics[index].articles?[indx].url,
                            description: state.interstedTopics[index]
                                .articles?[indx].description,
                            content: state
                                .interstedTopics[index].articles?[indx].content,
                            source: state
                                .interstedTopics[index].articles?[indx].source,
                            time: state
                                .interstedTopics[index].articles?[indx].time,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (BuildContext context, InterstedTopicsState state) {
          if (state is FailureState) {
            showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(S.current.error),
                  content: Text(state.errorMessage),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                          context.read<InterstedTopicsBloc>().country =
                              AuthenticationBloc.user.country ?? "us";
                          context.read<InterstedTopicsBloc>().interstedTopics =
                              AuthenticationBloc.user.interstedTopics ??
                                  ["general"];
                          context
                              .read<InterstedTopicsBloc>()
                              .add(GetInterstedTopics());
                        },
                        child: Text(S.current.retry)),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
