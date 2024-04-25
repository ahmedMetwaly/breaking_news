import '../../model/user_model.dart';

abstract class FirestoreState {}
class  InitialFirestore extends FirestoreState {}
class UpdatindDataState extends FirestoreState {}
class  UpdatingFavoriteState  extends FirestoreState {}

class UpdatedUserDataState extends FirestoreState {
  final UserModel user;

  UpdatedUserDataState({required this.user});
}
class UpdatedUserFavoriteState extends FirestoreState {
  final UserModel user;

  UpdatedUserFavoriteState({required this.user});
}
class UpdateFailedDataState extends FirestoreState {
  final String errorMessage;

  UpdateFailedDataState({required this.errorMessage});
}
