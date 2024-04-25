import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../resources/values_manager.dart';

class TrendingTopics extends StatelessWidget {
  const TrendingTopics({
    super.key,
    required this.topics,
  });

  final List<String> topics;

  @override
  Widget build(BuildContext context) {
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
                        //TODO:: got to the screen
                      },
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                        topics[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        "1204 articles",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
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

