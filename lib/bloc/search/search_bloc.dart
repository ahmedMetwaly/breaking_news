import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/search/search_event.dart';
import 'package:breaking_news/bloc/search/search_state.dart';
import 'package:breaking_news/services/api/api_services.dart';

class SeearchBloc extends Bloc<SearchEvent, SearchState> {
  SeearchBloc() : super(InitialState()) {
    on<GetSearchedData>(_getSearchData);
  }
  String sentence="";
  FutureOr<void> _getSearchData(
      GetSearchedData event, Emitter<SearchState> emit) async {
    emit(LoadingState());
    await ApiServices.searchOn(sentence: sentence)
        .then((value) => emit(SuccessState(searchResult: value)))
        .catchError((error) {
      emit(FailedState());
    });
  }
}
