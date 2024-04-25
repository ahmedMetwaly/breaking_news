import "package:breaking_news/view/screens/login/screens/reset_email.dart";
import "package:breaking_news/view/screens/profile_page/screens/history.dart";
import "package:flutter/material.dart";
import "package:breaking_news/view/screens/home_screen/home_screen.dart";
import "package:breaking_news/view/screens/init_settings/init_settings.dart";
import "package:breaking_news/view/screens/splash_screen/splash_screen.dart";
import "package:breaking_news/view/screens/topics_page/screens/display_topic_articles.dart";

import "../generated/l10n.dart";
import "../view/screens/app_settings/app_starts.dart";
import "../view/screens/login/login.dart";
import "../view/screens/onboarding/onboarding.dart";
import "../view/screens/signup/signup.dart";
import "../view/screens/topics_page/screens/web_view.dart";
import "../view/screens/login/screens/forget_password.dart";
import "routes.dart";

class RoutesGeneratour {
  static Route<dynamic> getRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.initSettings:
        return MaterialPageRoute(builder: (_) => const InitSettings());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());

      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogIn());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.displayTopicArticles:
        return MaterialPageRoute(builder: (_) => const DisplayTopicArticles());
      case Routes.history:
        return MaterialPageRoute(builder: (_) => const History());
      case Routes.webView:
        return MaterialPageRoute(builder: (_) => const WebView());
      case Routes.appStarts:
        return MaterialPageRoute(builder: (_) => const AppStarts());
            case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
         case Routes.resetEmail:
        return MaterialPageRoute(builder: (_) => const ResetEmail());
      default:
        return unFoundedRoute();
    }
  }

  static Route<dynamic> unFoundedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(S.current.wrong)),
              body: Center(child: Text(S.current.noRoute)),
            ));
  }
}
