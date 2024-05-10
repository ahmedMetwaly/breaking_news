import 'dart:async';

import 'package:breaking_news/model/article_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/news/news_state.dart';
import 'package:breaking_news/services/api/api_services.dart';

import 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(InitialState()) {
    on<GetTopHeadline>(_getTopHeadLine);
  }
  //this var to get specific topic
  String specificTopic = "general";
  String country = "us";
  FutureOr<void> _getTopHeadLine(
    GetTopHeadline event,
    Emitter<NewsState> emit,
  ) async {
    emit(LoadingState());
    await ApiServices.getTopHeadlineData(
            country: country, specificTopic: specificTopic)
        .then((value) {
      if (value is ResponseModel) {
        emit(SuccessState(specificTopic: value));
      } else {
        emit(ErrorState(error: value.toString()));
      }
    });
    ////print(response.articles);
  }
}
