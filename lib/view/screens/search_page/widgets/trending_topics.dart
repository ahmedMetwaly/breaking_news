import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/authentication/authentication_bloc.dart';
import '../../../../bloc/news/news_bloc.dart';
import '../../../../bloc/news/news_event.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/values_manager.dart';
import '../../topics_page/screens/display_topic_articles.dart';

class TrendingTopics extends StatelessWidget {
  const TrendingTopics({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    Map<String , String> topics ={
      "business": S.current.business,
      "entertainment": S.current.entertainment,
      "health": S.current.health,
      "science": S.current.science,
      "sports": S.current.sports,
      "technology": S.current.technology,
    };
   
 
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.current.trend,
              style: Theme.of(context).textTheme.headlineMedium),
          Expanded(
            
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        context.read<NewsBloc>().specificTopic =
                            topics.keys.toList()[index].toLowerCase();
                        context.read<NewsBloc>().country =
                            AuthenticationBloc.user.country ?? "us";
                        context.read<NewsBloc>().add(GetTopHeadline());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DisplayTopicArticles(),
                              settings: RouteSettings(
                                arguments: topics.values.toList()[index],
                              ),
                            ));
                      },
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        topics.values.toList()[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        S.current.articleCount,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: SizeManager.sSpace,
                    ),
                itemCount: topics.length),
          ),
        ],
      ),
    );
  }
}
