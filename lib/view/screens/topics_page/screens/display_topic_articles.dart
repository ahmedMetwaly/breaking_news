import 'package:breaking_news/view/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/news/news_bloc.dart';
import 'package:breaking_news/bloc/news/news_state.dart';
import '../../../../bloc/authentication/authentication_bloc.dart';
import '../../../../bloc/news/news_event.dart';
import '../../../../resources/values_manager.dart';
import '../widgets/article_widget.dart';

class DisplayTopicArticles extends StatelessWidget {
  const DisplayTopicArticles({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SuccessState) {
            return ListView.separated(
                padding: const EdgeInsets.all(PaddingManager.pMainPadding),
                itemBuilder: (context, index) => ArticleWidget(
                      article: state.specificTopic!.articles![index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: SizeManager.sSpace16,
                    ),
                itemCount: state.specificTopic!.articles!.length);
          }
          if (state is ErrorState) {
            return Scaffold(
              body: MyErrorWidget(
                  errorMessage: state.error,
                  onTap: () {
                    //context.read<NewsBloc>().specificTopic = topicModel.requestTopic.toLowerCase();
                    context.read<NewsBloc>().country =
                        AuthenticationBloc.user.country ?? "us";
                    context.read<NewsBloc>().add(GetTopHeadline());
                  }),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
