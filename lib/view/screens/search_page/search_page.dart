import 'package:breaking_news/view/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/search/search_bloc.dart';
import 'package:breaking_news/bloc/search/search_state.dart';
import 'package:breaking_news/generated/l10n.dart';
import 'package:breaking_news/resources/values_manager.dart';
import '../../../bloc/search/search_event.dart';
import '../home/widgets/article.dart';
import 'widgets/search_bar.dart';
import 'widgets/trending_topics.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.current.search,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: SizeManager.sSpace16,
              ),
              const MySearchBar(),
              const SizedBox(
                height: SizeManager.sSpace16,
              ),
              BlocBuilder<SeearchBloc, SearchState>(
                  builder: (BuildContext context, SearchState state) {
                //print(state);
                if (state is LoadingState) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.current.searchResult,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 24)),
                        const SizedBox(
                          height: 30,
                        ),
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  );
                }
                if (state is SuccessState) {
                  return Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.current.searchResult,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 24)),
                          Expanded(
                              child: ListView.separated(
                            itemBuilder: (context, index) => Article(
                                articleModel:
                                    state.searchResult.articles![index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: SizeManager.sSpace,
                            ),
                            itemCount: state.searchResult.articles?.length ?? 0,
                          )),
                        ]),
                  );
                }
                if (state is FailedState) {
                  if (context.read<SeearchBloc>().sentence.trim().isEmpty) {
                    return const TrendingTopics();
                  } else {
                    return Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          child: MyErrorWidget(
                              errorMessage: state.error,
                              onTap: () {
                                context
                                    .read<SeearchBloc>()
                                    .add(GetSearchedData());
                              }),
                        ),
                      ),
                    );
                  }
                }
                return const TrendingTopics();
              })
            ],
          ),
        ),
      ),
    );
  }
}
