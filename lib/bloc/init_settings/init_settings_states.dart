abstract class InitializeState {}

class InitState extends InitializeState {}

class UninitializedState extends InitializeState {}

class InitializedState extends InitializeState {
  final String? country;
  final String? language;
  final List<String>? interstedTopics;

  InitializedState({
    this.country,
    this.language,
    this.interstedTopics,
  });

}
class ToggleTheme extends InitializeState{}
