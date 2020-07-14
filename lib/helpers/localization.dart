import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  Locale _locale;
  static Map<dynamic, dynamic> _localizationValue;

  String get currentLanguage => _locale.languageCode;

  Locale get currentLocale => _locale;

  AppLocalization._internal(this._locale);

  String getLocalizedText(String key) {
    if (_localizationValue != null)
      return _localizationValue[key] ?? '** $key not found';
    return "";
  }

  static Future<AppLocalization> load(
      Locale locale, String localAssetsPath) async {
    AppLocalization appLocalization = new AppLocalization._internal(locale);
    String jsonLocalizedValues = await rootBundle
        .loadString(localAssetsPath + "AppLocal-${locale.languageCode}.json");
    _localizationValue = json.decode(jsonLocalizedValues);
    return appLocalization;
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  String localizationPath;
  List<String> supportedLanguages;

  AppLocalizationDelegate({this.localizationPath, this.supportedLanguages});

  @override
  bool isSupported(Locale locale) =>
      supportedLanguages.contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) =>
      AppLocalization.load(locale, localizationPath);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
