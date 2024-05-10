import 'package:breaking_news/generated/l10n.dart';
import 'package:breaking_news/services/sharedprefrences_service/sharedprefrences_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'init_settings_states.dart';

class InitSettingsBloc extends Cubit<InitializeState> {
  InitSettingsBloc() : super(InitState());

  /* String language = S.current.enLang;
  String country = S.current.usa; */
  List<String> interstedTopics = [];
  List<bool> topicsValue = [false, false, false, false, false, false, false];
  final Map<String, String> topics = {
    "general": S.current.general,
    "entertainment": S.current.entertainment,
    "sports": S.current.sports,
    "business": S.current.business,
    "health": S.current.health,
    "science": S.current.science,
    "technology": S.current.technology
  };
  final Map<String,String> languages = {"en":S.current.enLang, "ar":"العربية"};
  List<bool> languageValues = [false, false];

   List<String> countries = [
    "ae",
    "ar",
    "at",
    "au",
    "be",
    "bg",
    "br",
    "ca",
    "ch",
    "cn",
    "co",
    "cu",
    "cz",
    "de",
    "eg",
    "fr",
    "gb",
    "gr",
    "hk",
    "hu",
    "id",
    "ie",
    "il",
    "in",
    "it",
    "jp",
    "kr",
    "lt",
    "lv",
    "ma",
    "mx",
    "my",
    "ng",
    "nl",
    "no",
    "nz",
    "ph",
    "pl",
    "pt",
    "ro",
    "rs",
    "ru",
    "sa",
    "se",
    "sg",
    "si",
    "sk",
    "th",
    "tr",
    "tw",
    "ua",
    "us",
    "ve",
    "za",
  ];
  List<bool> countriesValues = List.generate(54, (index) => false);
  String interstedCountry = "us";

  void chooseInterstedTopics(bool value, int index) {
    topicsValue[index] = value;
    if (value) {
      interstedTopics.add(topics.keys.elementAt(index));
    } else {
      interstedTopics
          .removeWhere((element) => element == topics.keys.elementAt(index));
    }
    //print(interstedTopics);
    emit(InitializedState(interstedTopics: interstedTopics));
  }

  String selectedLanguage = "en";
  void chooseLanguage(int index) {
    List.generate(languages.length, (index) => false);
    for (int i = 0; i < languageValues.length; i++) {
      languageValues[i] = i == index;
    }
    selectedLanguage = languages.keys.toList()[index];
    emit(InitializedState(language: languages.keys.toList()[index]));
  }

  void chooseCountries(String selectedCountry) {
    ////print(countries.length);
    interstedCountry = selectedCountry;
    emit(InitializedState(country: interstedCountry));
  }

  bool isDark = false;
  void toggleTheme() {
    isDark = !isDark;
    SharedPrefrencesService.addBoolToSF("isDark", isDark);
    emit(ToggleTheme());
  }
  /* void searchOnCountries(String word) {
    List<String> list = List<String>.from(countries.values)
        .where((country) => country.contains(word)).toList();
        emit(SearchCompleted(result: list));
  } */
}
