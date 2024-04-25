// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `News`
  String get appTitle {
    return Intl.message(
      'News',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Good morninig`
  String get goodMorning {
    return Intl.message(
      'Good morninig',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Wrong`
  String get wrong {
    return Intl.message(
      'Wrong',
      name: 'wrong',
      desc: '',
      args: [],
    );
  }

  /// `No Page Found`
  String get noRoute {
    return Intl.message(
      'No Page Found',
      name: 'noRoute',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgotPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get loginWithSocialMedia {
    return Intl.message(
      'Or login with',
      name: 'loginWithSocialMedia',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Required Field`
  String get requiredField {
    return Intl.message(
      'Required Field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Name`
  String get notValidName {
    return Intl.message(
      'Not Valid Name',
      name: 'notValidName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Already have an accoount`
  String get haveAccoount {
    return Intl.message(
      'Already have an accoount',
      name: 'haveAccoount',
      desc: '',
      args: [],
    );
  }

  /// `Signup  with social media`
  String get signUpWithSc {
    return Intl.message(
      'Signup  with social media',
      name: 'signUpWithSc',
      desc: '',
      args: [],
    );
  }

  /// `Not valid email`
  String get notValidEmail {
    return Intl.message(
      'Not valid email',
      name: 'notValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Use 8 characters or more for your password`
  String get passErrorSignUp {
    return Intl.message(
      'Use 8 characters or more for your password',
      name: 'passErrorSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the NewsNow App`
  String get onboarding1Title {
    return Intl.message(
      'Welcome to the NewsNow App',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Stay ahead of the curve with NewsNow! Personalize your news feed, receive breaking news alerts, and explore a world of information at your fingertips`
  String get onboarding1Body {
    return Intl.message(
      'Stay ahead of the curve with NewsNow! Personalize your news feed, receive breaking news alerts, and explore a world of information at your fingertips',
      name: 'onboarding1Body',
      desc: '',
      args: [],
    );
  }

  /// `Explore the World of News`
  String get onboarding2Title {
    return Intl.message(
      'Explore the World of News',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `Customize your news experience by choosing your favorite topics. From global events to niche interests, our app covers it all.`
  String get onboarding2Body {
    return Intl.message(
      'Customize your news experience by choosing your favorite topics. From global events to niche interests, our app covers it all.',
      name: 'onboarding2Body',
      desc: '',
      args: [],
    );
  }

  /// `Stay Informed, Anywhere`
  String get onboarding3Title {
    return Intl.message(
      'Stay Informed, Anywhere',
      name: 'onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `Access breaking news and save articles. Share and discuss with your community, and delve into a world of knowledge on the go.`
  String get onboarding3Body {
    return Intl.message(
      'Access breaking news and save articles. Share and discuss with your community, and delve into a world of knowledge on the go.',
      name: 'onboarding3Body',
      desc: '',
      args: [],
    );
  }

  /// `Discover Hotest\nNews`
  String get discover {
    return Intl.message(
      'Discover Hotest\nNews',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this item ?`
  String get deleteContent {
    return Intl.message(
      'Do you want to delete this item ?',
      name: 'deleteContent',
      desc: '',
      args: [],
    );
  }

  /// `No History`
  String get noHistory {
    return Intl.message(
      'No History',
      name: 'noHistory',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `You don't have a favorite yet!`
  String get noFavorite {
    return Intl.message(
      'You don\'t have a favorite yet!',
      name: 'noFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Search article, topic, writer`
  String get searchHint {
    return Intl.message(
      'Search article, topic, writer',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Trending topic today`
  String get trend {
    return Intl.message(
      'Trending topic today',
      name: 'trend',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get health {
    return Intl.message(
      'Health',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get science {
    return Intl.message(
      'Science',
      name: 'science',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get technology {
    return Intl.message(
      'Technology',
      name: 'technology',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Topics`
  String get topics {
    return Intl.message(
      'Topics',
      name: 'topics',
      desc: '',
      args: [],
    );
  }

  /// `Add to favorite`
  String get addToFav {
    return Intl.message(
      'Add to favorite',
      name: 'addToFav',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get content {
    return Intl.message(
      'Content',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `Go To Link`
  String get goToLink {
    return Intl.message(
      'Go To Link',
      name: 'goToLink',
      desc: '',
      args: [],
    );
  }

  /// `By`
  String get by {
    return Intl.message(
      'By',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get enLang {
    return Intl.message(
      'English',
      name: 'enLang',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arLang {
    return Intl.message(
      'Arabic',
      name: 'arLang',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Email already exist try sign up with another email.`
  String get emailErrorSignUp {
    return Intl.message(
      'Email already exist try sign up with another email.',
      name: 'emailErrorSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `User name not found!`
  String get userError {
    return Intl.message(
      'User name not found!',
      name: 'userError',
      desc: '',
      args: [],
    );
  }

  /// `Email not found`
  String get emailNotFound {
    return Intl.message(
      'Email not found',
      name: 'emailNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is not correct`
  String get loginError {
    return Intl.message(
      'The email or password is not correct',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is not correct`
  String get noUser {
    return Intl.message(
      'The email or password is not correct',
      name: 'noUser',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPass {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPass',
      desc: '',
      args: [],
    );
  }

  /// `USA`
  String get usa {
    return Intl.message(
      'USA',
      name: 'usa',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get egypt {
    return Intl.message(
      'Egypt',
      name: 'egypt',
      desc: '',
      args: [],
    );
  }

  /// `Topics you care about`
  String get topicsCare {
    return Intl.message(
      'Topics you care about',
      name: 'topicsCare',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get selectLanguage {
    return Intl.message(
      'Select language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `United Arab Emirates`
  String get ae {
    return Intl.message(
      'United Arab Emirates',
      name: 'ae',
      desc: '',
      args: [],
    );
  }

  /// `Argentina`
  String get ar {
    return Intl.message(
      'Argentina',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `Austria`
  String get at {
    return Intl.message(
      'Austria',
      name: 'at',
      desc: '',
      args: [],
    );
  }

  /// `Australia`
  String get au {
    return Intl.message(
      'Australia',
      name: 'au',
      desc: '',
      args: [],
    );
  }

  /// `Belgium`
  String get be {
    return Intl.message(
      'Belgium',
      name: 'be',
      desc: '',
      args: [],
    );
  }

  /// `Bulgaria`
  String get bg {
    return Intl.message(
      'Bulgaria',
      name: 'bg',
      desc: '',
      args: [],
    );
  }

  /// `Brazil`
  String get br {
    return Intl.message(
      'Brazil',
      name: 'br',
      desc: '',
      args: [],
    );
  }

  /// `Canada`
  String get ca {
    return Intl.message(
      'Canada',
      name: 'ca',
      desc: '',
      args: [],
    );
  }

  /// `Switzerland`
  String get ch {
    return Intl.message(
      'Switzerland',
      name: 'ch',
      desc: '',
      args: [],
    );
  }

  /// `China`
  String get cn {
    return Intl.message(
      'China',
      name: 'cn',
      desc: '',
      args: [],
    );
  }

  /// `Colombia`
  String get co {
    return Intl.message(
      'Colombia',
      name: 'co',
      desc: '',
      args: [],
    );
  }

  /// `Cuba`
  String get cu {
    return Intl.message(
      'Cuba',
      name: 'cu',
      desc: '',
      args: [],
    );
  }

  /// `Czech Republic`
  String get cz {
    return Intl.message(
      'Czech Republic',
      name: 'cz',
      desc: '',
      args: [],
    );
  }

  /// `Germany`
  String get de {
    return Intl.message(
      'Germany',
      name: 'de',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get eg {
    return Intl.message(
      'Egypt',
      name: 'eg',
      desc: '',
      args: [],
    );
  }

  /// `France`
  String get fr {
    return Intl.message(
      'France',
      name: 'fr',
      desc: '',
      args: [],
    );
  }

  /// `United Kingdom`
  String get gb {
    return Intl.message(
      'United Kingdom',
      name: 'gb',
      desc: '',
      args: [],
    );
  }

  /// `Greece`
  String get gr {
    return Intl.message(
      'Greece',
      name: 'gr',
      desc: '',
      args: [],
    );
  }

  /// `Hong Kong`
  String get hk {
    return Intl.message(
      'Hong Kong',
      name: 'hk',
      desc: '',
      args: [],
    );
  }

  /// `Hungary`
  String get hu {
    return Intl.message(
      'Hungary',
      name: 'hu',
      desc: '',
      args: [],
    );
  }

  /// `Indonesia`
  String get id {
    return Intl.message(
      'Indonesia',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Ireland`
  String get ie {
    return Intl.message(
      'Ireland',
      name: 'ie',
      desc: '',
      args: [],
    );
  }

  /// `Israel`
  String get il {
    return Intl.message(
      'Israel',
      name: 'il',
      desc: '',
      args: [],
    );
  }

  /// `India`
  String get india {
    return Intl.message(
      'India',
      name: 'india',
      desc: '',
      args: [],
    );
  }

  /// `Italy`
  String get it {
    return Intl.message(
      'Italy',
      name: 'it',
      desc: '',
      args: [],
    );
  }

  /// `Japan`
  String get jp {
    return Intl.message(
      'Japan',
      name: 'jp',
      desc: '',
      args: [],
    );
  }

  /// `South Korea`
  String get kr {
    return Intl.message(
      'South Korea',
      name: 'kr',
      desc: '',
      args: [],
    );
  }

  /// `Lithuania`
  String get lt {
    return Intl.message(
      'Lithuania',
      name: 'lt',
      desc: '',
      args: [],
    );
  }

  /// `Latvia`
  String get lv {
    return Intl.message(
      'Latvia',
      name: 'lv',
      desc: '',
      args: [],
    );
  }

  /// `Morocco`
  String get ma {
    return Intl.message(
      'Morocco',
      name: 'ma',
      desc: '',
      args: [],
    );
  }

  /// `Mexico`
  String get mx {
    return Intl.message(
      'Mexico',
      name: 'mx',
      desc: '',
      args: [],
    );
  }

  /// `Malaysia`
  String get my {
    return Intl.message(
      'Malaysia',
      name: 'my',
      desc: '',
      args: [],
    );
  }

  /// `Nigeria`
  String get ng {
    return Intl.message(
      'Nigeria',
      name: 'ng',
      desc: '',
      args: [],
    );
  }

  /// `Netherlands`
  String get nl {
    return Intl.message(
      'Netherlands',
      name: 'nl',
      desc: '',
      args: [],
    );
  }

  /// `Norway`
  String get no {
    return Intl.message(
      'Norway',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `New Zealand`
  String get nz {
    return Intl.message(
      'New Zealand',
      name: 'nz',
      desc: '',
      args: [],
    );
  }

  /// `Philippines`
  String get ph {
    return Intl.message(
      'Philippines',
      name: 'ph',
      desc: '',
      args: [],
    );
  }

  /// `Poland`
  String get pl {
    return Intl.message(
      'Poland',
      name: 'pl',
      desc: '',
      args: [],
    );
  }

  /// `Portugal`
  String get pt {
    return Intl.message(
      'Portugal',
      name: 'pt',
      desc: '',
      args: [],
    );
  }

  /// `Romania`
  String get ro {
    return Intl.message(
      'Romania',
      name: 'ro',
      desc: '',
      args: [],
    );
  }

  /// `Serbia`
  String get rs {
    return Intl.message(
      'Serbia',
      name: 'rs',
      desc: '',
      args: [],
    );
  }

  /// `Russia`
  String get ru {
    return Intl.message(
      'Russia',
      name: 'ru',
      desc: '',
      args: [],
    );
  }

  /// `Saudi Arabia`
  String get sa {
    return Intl.message(
      'Saudi Arabia',
      name: 'sa',
      desc: '',
      args: [],
    );
  }

  /// `Sweden`
  String get se {
    return Intl.message(
      'Sweden',
      name: 'se',
      desc: '',
      args: [],
    );
  }

  /// `Singapore`
  String get sg {
    return Intl.message(
      'Singapore',
      name: 'sg',
      desc: '',
      args: [],
    );
  }

  /// `Slovenia`
  String get si {
    return Intl.message(
      'Slovenia',
      name: 'si',
      desc: '',
      args: [],
    );
  }

  /// `Slovakia`
  String get sk {
    return Intl.message(
      'Slovakia',
      name: 'sk',
      desc: '',
      args: [],
    );
  }

  /// `Thailand`
  String get th {
    return Intl.message(
      'Thailand',
      name: 'th',
      desc: '',
      args: [],
    );
  }

  /// `Turkey`
  String get tr {
    return Intl.message(
      'Turkey',
      name: 'tr',
      desc: '',
      args: [],
    );
  }

  /// `Taiwan`
  String get tw {
    return Intl.message(
      'Taiwan',
      name: 'tw',
      desc: '',
      args: [],
    );
  }

  /// `Ukraine`
  String get ua {
    return Intl.message(
      'Ukraine',
      name: 'ua',
      desc: '',
      args: [],
    );
  }

  /// `United States`
  String get us {
    return Intl.message(
      'United States',
      name: 'us',
      desc: '',
      args: [],
    );
  }

  /// `Venezuela`
  String get ve {
    return Intl.message(
      'Venezuela',
      name: 've',
      desc: '',
      args: [],
    );
  }

  /// `South Africa`
  String get za {
    return Intl.message(
      'South Africa',
      name: 'za',
      desc: '',
      args: [],
    );
  }

  /// `You are logout`
  String get loginAlertTitle {
    return Intl.message(
      'You are logout',
      name: 'loginAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please login to add this item to favorite.`
  String get loginAlertText {
    return Intl.message(
      'Please login to add this item to favorite.',
      name: 'loginAlertText',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `OR continue as a`
  String get continueAsGuest {
    return Intl.message(
      'OR continue as a',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to exit`
  String get exit {
    return Intl.message(
      'Press back again to exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Delete all items`
  String get clear {
    return Intl.message(
      'Delete all items',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `No back history found`
  String get noBack {
    return Intl.message(
      'No back history found',
      name: 'noBack',
      desc: '',
      args: [],
    );
  }

  /// `No forward history found`
  String get noForward {
    return Intl.message(
      'No forward history found',
      name: 'noForward',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get connectionError {
    return Intl.message(
      'Please check your internet connection',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `Confim`
  String get confirm {
    return Intl.message(
      'Confim',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasssword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasssword',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent to your email!`
  String get passwordReset {
    return Intl.message(
      'Password reset link sent to your email!',
      name: 'passwordReset',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email !`
  String get emailRequired {
    return Intl.message(
      'Please enter a valid email !',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.`
  String get forgotPasswordDetails {
    return Intl.message(
      'Don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
      name: 'forgotPasswordDetails',
      desc: '',
      args: [],
    );
  }

  /// `Your accoount security is our priority ! we've sent you a secure link to safely change your password and keep your account protected.`
  String get passwordResestDetails {
    return Intl.message(
      'Your accoount security is our priority ! we\'ve sent you a secure link to safely change your password and keep your account protected.',
      name: 'passwordResestDetails',
      desc: '',
      args: [],
    );
  }

  /// `Resend email`
  String get resendEmail {
    return Intl.message(
      'Resend email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent check your account.`
  String get checkYourEmail {
    return Intl.message(
      'Password reset email sent check your account.',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get sent {
    return Intl.message(
      'Sent',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good afternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evining`
  String get goodEvening {
    return Intl.message(
      'Good evining',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
