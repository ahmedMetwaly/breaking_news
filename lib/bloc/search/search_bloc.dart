import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/search/search_event.dart';
import 'package:breaking_news/bloc/search/search_state.dart';
import 'package:breaking_news/services/api/api_services.dart';

import '../../model/article_model.dart';

class SeearchBloc extends Bloc<SearchEvent, SearchState> {
  SeearchBloc() : super(InitialState()) {
    on<GetSearchedData>(_getSearchData);
  }
  String sentence = "";
  FutureOr<void> _getSearchData(
      GetSearchedData event, Emitter<SearchState> emit) async {
    emit(LoadingState());
    await ApiServices.searchOn(sentence: sentence).then((value) {
      if (value is ResponseModel) {
        emit(SuccessState(searchResult: value));
      } else {
        emit(FailedState(error: value.toString()));
      }
    }).catchError((error) {
      emit(FailedState(error: error.toString()));
    });
  }
}
