
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/intersted_topics/intersted_topicss_event.dart';
import 'package:breaking_news/bloc/intersted_topics/intersted_topics_state.dart';

import '../../services/api/api_services.dart';

class InterstedTopicsBloc
    extends Bloc<InterstedTopicsEvent, InterstedTopicsState> {
  InterstedTopicsBloc() : super(InitialState()) {
    on<GetInterstedTopics>(_getInterstedTopics);
  }
  //TODO:: init those vars from init Page from user and save it on sharedPref

  List<String> interstedTopics = [];
  String country = "us";

  FutureOr<void> _getInterstedTopics(
      GetInterstedTopics event, Emitter<InterstedTopicsState> emit) async {
    emit(LoadingState());
    try {
      print(country);
      print(interstedTopics);
      await ApiServices.getInterstedData(
              country: country, interstedTopics: interstedTopics)
          .then((value) => emit(SuccessState(
                interstedTopics: value,
              )));
    } catch (error) {
      emit(FailureState(errorMessage: error.toString()));
      print(error.toString());
    }
  }
}
