import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/init_settings/init_settings_bloc.dart';
import 'package:breaking_news/bloc/init_settings/init_settings_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/firestore/firestore_bloc.dart';
import '../../../../bloc/firestore/firestore_event.dart';
import '../../../../bloc/intersted_topics/intersted_topics_bloc.dart';
import '../../../../bloc/intersted_topics/intersted_topicss_event.dart';
import '../../../../bloc/news/news_bloc.dart';
import '../../../../bloc/news/news_event.dart';
import '../../../../generated/l10n.dart';

class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key, this.fromProfile});

  final bool? fromProfile;

  String countryValue(String countryZipcode) {
    switch (countryZipcode) {
      case "ae":
        return S.current.ae;
      case "ar":
        return S.current.ar;
      case "at":
        return S.current.at;
      case "au":
        return S.current.au;
      case "be":
        return S.current.be;
      case "bg":
        return S.current.bg;
      case "br":
        return S.current.br;
      case "ca":
        return S.current.ca;
      case "ch":
        return S.current.ch;
      case "cn":
        return S.current.cn;
      case "co":
        return S.current.co;
      case "cu":
        return S.current.cu;
      case "cz":
        return S.current.cz;
      case "de":
        return S.current.de;
      case "eg":
        return S.current.eg;
      case "fr":
        return S.current.fr;
      case "gb":
        return S.current.gb;
      case "gr":
        return S.current.gr;
      case "hk":
        return S.current.hk;
      case "hu":
        return S.current.hu;
      case "id":
        return S.current.id;
      case "ie":
        return S.current.ie;
      case "il":
        return S.current.il;
      case "in":
        return S.current.india;
      case "it":
        return S.current.it;
      case "jp":
        return S.current.jp;
      case "kr":
        return S.current.kr;
      case "lt":
        return S.current.lt;
      case "lv":
        return S.current.lv;
      case "ma":
        return S.current.ma;
      case "mx":
        return S.current.mx;
      case "my":
        return S.current.my;
      case "ng":
        return S.current.ng;
      case "nl":
        return S.current.nl;
      case "no":
        return S.current.no;
      case "nz":
        return S.current.nz;
      case "ph":
        return S.current.ph;
      case "pl":
        return S.current.pl;
      case "pt":
        return S.current.pt;
      case "ro":
        return S.current.ro;
      case "rs":
        return S.current.rs;
      case "ru":
        return S.current.ru;
      case "sa":
        return S.current.sa;
      case "se":
        return S.current.se;
      case "sg":
        return S.current.sg;
      case "si":
        return S.current.si;
      case "sk":
        return S.current.sk;
      case "th":
        return S.current.th;
      case "tr":
        return S.current.tr;
      case "tw":
        return S.current.tw;
      case "ua":
        return S.current.ua;
      case "us":
        return S.current.us;
      case "ve":
        return S.current.ve;
      case "za":
        return S.current.za;
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitSettingsBloc, InitializeState>(
      builder: (BuildContext context, InitializeState state) => Column(
        children: [
          Text(S.current.selectInterestedCountry,
              style: Theme.of(context).textTheme.bodyLarge),
          Divider(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5)),
          DropdownButton(
            value: context.read<InitSettingsBloc>().interstedCountry,
            items: context
                .read<InitSettingsBloc>()
                .countries
                .map((country) => DropdownMenuItem(
                    value: country,
                    child: Text(
                      countryValue(country),
                      style: Theme.of(context).textTheme.bodyMedium,
                    )))
                .toList(),
            onChanged: (value) {
              context.read<InitSettingsBloc>().chooseCountries(value ?? "us");
              if (fromProfile != null && fromProfile == true) {
                context.read<InterstedTopicsBloc>().country = value ?? "us";
                AuthenticationBloc.user.country = value ?? "us";
                context.read<NewsBloc>().country = value ?? "us";
                context.read<InterstedTopicsBloc>().add(GetInterstedTopics());
                context.read<NewsBloc>().add(GetTopHeadline());
                if (FirebaseAuth.instance.currentUser != null) {
                  context.read<FirestoreBloc>().add(UpdateUserCountry());
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
