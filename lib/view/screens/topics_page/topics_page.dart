import "package:flutter/material.dart";
import "package:breaking_news/generated/l10n.dart";
import "package:breaking_news/model/topic_model.dart";
import "package:breaking_news/resources/colors_manager.dart";
import "package:breaking_news/resources/image_manager.dart";
import "package:breaking_news/resources/values_manager.dart";
import "package:breaking_news/view/screens/topics_page/widgets/topic_widget.dart";

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TopicModel> topics = [
      TopicModel(
          imagePath: ImageManager.business,
          title: S.current.business,
          color: Theme.of(context).colorScheme.primary,
          requestTopic: "business"),
      TopicModel(
          imagePath: ImageManager.entertainment,
          title: S.current.entertainment,
          color: ColorsManager.yellow,
          requestTopic: "entertainment"),
      TopicModel(
          imagePath: ImageManager.health,
          title: S.current.health,
          color: Colors.teal,
          requestTopic: "health"),
      TopicModel(
          imagePath: ImageManager.science,
          title: S.current.science,
          color: Theme.of(context).colorScheme.background,
          requestTopic: "science"),
      TopicModel(
          imagePath: ImageManager.sports,
          title: S.current.sports,
          color: ColorsManager.yellow,
          requestTopic: "sports"),
      TopicModel(
          imagePath: ImageManager.technology,
          title: S.current.technology,
          color: Theme.of(context).colorScheme.background,
          requestTopic: "technology"),
    ];
    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          
          title: Padding(
            padding: const EdgeInsets.all(PaddingManager.pMainPadding),
            child: Text(
              S.current.topics,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(PaddingManager.pMainPadding),
            child: ListView.separated(
                padding: const EdgeInsets.all(PaddingManager.pMainPadding),
                itemBuilder: (context, index) =>
                    TopicWidget(topicModel: topics[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: SizeManager.sSpace16),
                itemCount: topics.length),
          ),
        ));
  }
}
