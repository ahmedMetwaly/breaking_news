import 'package:breaking_news/model/article_model.dart';

abstract class NewsState {}

class InitialState extends NewsState {}

class LoadingState extends NewsState {}

class ErrorState extends NewsState {
  ErrorState({required this.error});
  String error;
}

class SuccessState extends NewsState {
  SuccessState({this.specificTopic});
  ResponseModel? specificTopic;
}
