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

  final Map<String, String> countries = {
    "ae": S.current.ae,
    "ar": S.current.ar,
    "at": S.current.at,
    "au": S.current.au,
    "be": S.current.be,
    "bg": S.current.bg,
    "br": S.current.br,
    "ca": S.current.ca,
    "ch": S.current.ch,
    "cn": S.current.cn,
    "co": S.current.co,
    "cu": S.current.cu,
    "cz": S.current.cz,
    "de": S.current.de,
    "eg": S.current.eg,
    "fr": S.current.fr,
    "gb": S.current.gb,
    "gr": S.current.gr,
    "hk": S.current.hk,
    "hu": S.current.hu,
    "id": S.current.id,
    "ie": S.current.ie,
    "il": S.current.il,
    "in": S.current.india,
    "it": S.current.it,
    "jp": S.current.jp,
    "kr": S.current.kr,
    "lt": S.current.lt,
    "lv": S.current.lv,
    "ma": S.current.ma,
    "mx": S.current.mx,
    "my": S.current.my,
    "ng": S.current.ng,
    "nl": S.current.nl,
    "no": S.current.no,
    "nz": S.current.nz,
    "ph": S.current.ph,
    "pl": S.current.pl,
    "pt": S.current.pt,
    "ro": S.current.ro,
    "rs": S.current.rs,
    "ru": S.current.ru,
    "sa": S.current.sa,
    "se": S.current.se,
    "sg": S.current.sg,
    "si": S.current.si,
    "sk": S.current.sk,
    "th": S.current.th,
    "tr": S.current.tr,
    "tw": S.current.tw,
    "ua": S.current.ua,
    "us": S.current.us,
    "ve": S.current.ve,
    "za": S.current.za,
  };
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
    print(interstedTopics);
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
    //print(countries.length);
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
