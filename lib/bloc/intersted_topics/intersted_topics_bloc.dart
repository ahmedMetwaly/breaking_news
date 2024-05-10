import 'dart:async';
import 'package:breaking_news/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_news/bloc/intersted_topics/intersted_topicss_event.dart';
import 'package:breaking_news/bloc/intersted_topics/intersted_topics_state.dart';

import '../../model/article_model.dart';
import '../../services/api/api_services.dart';

class InterstedTopicsBloc
    extends Bloc<InterstedTopicsEvent, InterstedTopicsState> {
  InterstedTopicsBloc() : super(InitialState()) {
    on<GetInterstedTopics>(_getInterstedTopics);
  }

  List<String> interstedTopics = [];
  String country = "us";

  FutureOr<void> _getInterstedTopics(
      GetInterstedTopics event, Emitter<InterstedTopicsState> emit) async {
    emit(LoadingState());
    try {
      //print(country);
      //print(interstedTopics);
      await ApiServices.getInterstedData(
              country: country, interstedTopics: interstedTopics)
          .then((value) {
            //print("value: $value");
        if (value is List<ResponseModel>) {
          emit(SuccessState(
            interstedTopics: value
          ));
        }else {
          emit(FailureState(errorMessage: value.toString()));
        }
      });
    } catch (error) {
      String errorMessage = "";
      if (error.toString().contains("429")) {
        errorMessage = S.current.errorToManyRequests;
      } else if (error.toString().contains("500")) {
        errorMessage = S.current.serverError;
      }
      emit(FailureState(errorMessage: errorMessage));
      //print(error.toString());
    }
  }
}
