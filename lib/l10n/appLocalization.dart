import 'package:flutter/material.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  final Map<String, String> _localizedValues;

  AppLocalizations(this._localizedValues);


  String translate(String key) {
    return _localizedValues[key] ?? key;
  }

  String get home => translate('home');
  String get goodMorning => translate('goodMorning');
  String get viewAll => translate('viewAll');
  String get goToHome => translate('goToHome');
  String get theme => translate('theme');
  String get language => translate('language');
  String get dark => translate('dark');
  String get light => translate('light');
  String get english => translate('english');
  String get arabic => translate('arabic');

  static Future<AppLocalizations> load(Locale locale) async {
    Map<String, String> localizedStrings = {};

    if (locale.languageCode == 'ar') {
      localizedStrings = {
        "home": "الصفحة الرئيسية",
        "goToHome": "العودة إلى الصفحة الرئيسية",
        "goodMorning": "صباح الخير\nإليك بعض الأخبار لك",
        "viewAll": "عرض الكل",
        "theme": "المظهر",
        "language": "اللغة",
        "dark": "الليل",
        "light": "النهار",
        "english": "الإنجليزية",
        "arabic": "العربية"
      };
    } else {
      localizedStrings = {
        "home": "Home",
        "goToHome": "Go To Home",
        "goodMorning": "Good Morning\nHere is Some News For You",
        "viewAll": "View All",
        "theme": "Theme",
        "language": "Language",
        "dark": "Dark",
        "light": "Light",
        "english": "English",
        "arabic": "Arabic"
      };
    }

    return AppLocalizations(localizedStrings);
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
