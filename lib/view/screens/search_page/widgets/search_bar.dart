import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/search/search_bloc.dart';
import 'package:breaking_news/bloc/search/search_event.dart';
import 'package:breaking_news/bloc/search/search_state.dart';

import '../../../../generated/l10n.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
        TextEditingController searchController = TextEditingController();

    return BlocBuilder<SeearchBloc,SearchState>(
      builder: (BuildContext context, SearchState state) {
        return TextFormField(
        controller: searchController,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
          hintText: S.current.searchHint,
          label: Text(S.current.search),
        ),
        onChanged: (value) {
          context.read<SeearchBloc>().sentence = value;
          context.read<SeearchBloc>().add(GetSearchedData());
        },
      );
      },
    );
  }
}
