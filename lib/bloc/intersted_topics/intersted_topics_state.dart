import 'package:breaking_news/model/article_model.dart';

abstract class InterstedTopicsState {}

class InitialState extends InterstedTopicsState {}

class LoadingState extends InterstedTopicsState {}

class SuccessState extends InterstedTopicsState {
  SuccessState({required this.interstedTopics});
  List<ResponseModel> interstedTopics;
}

class FailureState extends InterstedTopicsState {
  final String errorMessage;

  FailureState({required this.errorMessage});
}
