import 'package:breaking_news/model/article_model.dart';

abstract class SearchState {}

class InitialState extends SearchState{}
class LoadingState extends SearchState{}
class SuccessState extends SearchState{
  final ResponseModel searchResult ;

  SuccessState({required this.searchResult});
}
class FailedState extends SearchState{}