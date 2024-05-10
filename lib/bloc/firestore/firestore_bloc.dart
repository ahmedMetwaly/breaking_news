import 'dart:async';

import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/firestore/firestore_event.dart';
import 'package:breaking_news/bloc/firestore/firestore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/firebase/firestore_service.dart';

class FirestoreBloc extends Bloc<FirestoreEvents, FirestoreState> {
  FirestoreBloc() : super(InitialFirestore()) {
    on<UserUpdateDataEvent>(_updataUserHistory);
    on<UpdateUserFavouriteTopicsEvent>(_updataUserFavourite);
    on<ChangeLanguageOnFirestore>(_changeLanguage);
    on<UpdateUserCountry>(_updateUserCountry);
    on<UpdateUserInterstedTopics>(_updateUserInterestedTopics);
    on<ChangeProfileImage>(_changeProfileImage);
  }

  FutureOr<void> _updataUserHistory(
      UserUpdateDataEvent event, Emitter<FirestoreState> emit) async {
    try {
      emit(UpdatindDataState());
      await FirestoreService()
          .updataUserData(
              userId: AuthenticationBloc.user.uid ?? "0",
              field: "history",
              data: AuthenticationBloc.user.history
                      ?.map((e) => e.toJson())
                      .toList() ??
                  [])
          .then((value) =>
              emit(UpdatedUserDataState(user: AuthenticationBloc.user)));
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _updataUserFavourite(UpdateUserFavouriteTopicsEvent event,
      Emitter<FirestoreState> emit) async {
    try {
      emit(UpdatingFavoriteState());
      await FirestoreService()
          .updataUserData(
              userId: AuthenticationBloc.user.uid ?? "0",
              field: "favouriteTopics",
              data: AuthenticationBloc.user.favouriteTopics
                      ?.map((e) => e.toJson())
                      .toList() ??
                  [])
          .then((value) =>
              emit(UpdatedUserFavoriteState(user: AuthenticationBloc.user)));
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _changeLanguage(
      ChangeLanguageOnFirestore event, Emitter<FirestoreState> emit) async {
    try {
      emit(UpdatindDataState());
      await FirestoreService()
          .updataUserData(
              userId: AuthenticationBloc.user.uid ?? "0",
              field: "language",
              data: AuthenticationBloc.user.language ?? "en")
          .then((value) =>
              emit(UpdatedUserDataState(user: AuthenticationBloc.user)));
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  late XFile profileImage ;
  FutureOr<void> _changeProfileImage(
      ChangeProfileImage event, Emitter<FirestoreState> emit) async {
    try {
      emit(UpdatindDataState());
      await FirestoreService()
          .uploadImage(
              userId: AuthenticationBloc.user.uid ?? "0", image: profileImage)
          .then((value) {
            //print("image uploaded");
            AuthenticationBloc.user.imageUrl = value;
            return emit(UpdatedUserDataState(user: AuthenticationBloc.user));
          });
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _updateUserCountry(UpdateUserCountry event, Emitter<FirestoreState> emit) async{
    try {
      emit(UpdatindDataState());
      await FirestoreService()
          .updataUserData(
          userId: AuthenticationBloc.user.uid ?? "0",
          field: "country",
          data: AuthenticationBloc.user.country ?? "us")
          .then((value) =>
          emit(UpdatedUserDataState(user: AuthenticationBloc.user)));
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _updateUserInterestedTopics(UpdateUserInterstedTopics event, Emitter<FirestoreState> emit) async{
    try {
      emit(UpdatindDataState());
      await FirestoreService()
          .updataUserData(
          userId: AuthenticationBloc.user.uid ?? "0",
          field: "interstedTopics",
          data: AuthenticationBloc.user.interstedTopics ?? [])
          .then((value) =>
          emit(UpdatedUserDataState(user: AuthenticationBloc.user)));
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }
}
