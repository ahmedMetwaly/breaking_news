import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/news/news_bloc.dart';
import 'package:breaking_news/bloc/news/news_event.dart';
import 'package:breaking_news/model/topic_model.dart';
import 'package:breaking_news/view/screens/topics_page/screens/display_topic_articles.dart';
import '../../../../resources/values_manager.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({
    super.key,
    required this.topicModel,
  });

  final TopicModel topicModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NewsBloc>().specificTopic = topicModel.requestTopic.toLowerCase();
        context.read<NewsBloc>().add(GetTopHeadline());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DisplayTopicArticles(),
              settings: RouteSettings(
                arguments: topicModel.title,
              ),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeManager.borderRadius),
            image: DecorationImage(
                image: AssetImage(topicModel.imagePath), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.outline,
                offset: const Offset(1, 1),
                spreadRadius: 2,
                blurRadius: 15,
              ),
            ]),
        child: Center(
            child: Text(
          topicModel.title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: topicModel.color, shadows: [
            Shadow(
                color: Theme.of(context).colorScheme.outline,
                blurRadius: 55,
                offset: const Offset(1, 1))
          ]),
        )),
      ),
    );
  }
}
