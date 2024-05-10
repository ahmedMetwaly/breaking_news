import 'package:breaking_news/bloc/authentication/authentication_event.dart';
import 'package:breaking_news/bloc/firestore/firestore_bloc.dart';
import 'package:breaking_news/bloc/sharedprefrences/sharedpref_bloc.dart';
import 'package:breaking_news/bloc/sharedprefrences/sharedpref_state.dart';
import 'package:breaking_news/generated/l10n.dart';
import 'package:breaking_news/services/api/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/intersted_topics/intersted_topics_bloc.dart';
import 'bloc/init_settings/init_settings_bloc.dart';
import 'bloc/news/news_bloc.dart';
import 'bloc/search/search_bloc.dart';
import 'firebase_options.dart';
import 'resources/router.dart';
import 'resources/routes.dart';
import 'resources/theme_manager.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiServices.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(); // Ensure activation.
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) => SharedPrefBloc()..appStarted(), lazy: false),
   
    BlocProvider(
        create: (context) => AuthenticationBloc()..add(AppStarted()),
        lazy: false),
    BlocProvider(create: (context) => FirestoreBloc()),
    BlocProvider(create: (context) => InitSettingsBloc()),
    BlocProvider(create: (context) => NewsBloc()),
    BlocProvider(create: (context) => InterstedTopicsBloc()),
    BlocProvider(create: (context) => SeearchBloc())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefBloc, SettingsStates>(
        builder: (context, state) => MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(context.read<SharedPrefBloc>().lang),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              initialRoute: Routes.splashScreen,
              onGenerateRoute: RoutesGeneratour.getRoute,
              theme:SharedPrefBloc.isDark
                  ? ThemeManager.darkTheme
                  : ThemeManager.lightTheme,
            ));
  }
}
