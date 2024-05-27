import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _appLocale = AppLocalizations.supportedLocales.isNotEmpty
      ? AppLocalizations.supportedLocales.first
      : const Locale("en");

  final SharedPreferences _sharedPreferences;

  LocalizationProvider(this._sharedPreferences) {
    var selectedLocale = _sharedPreferences.getString("selectedLocale");
    if (selectedLocale != null) {
      _appLocale = Locale(selectedLocale);
    }
  }

  // Expose read access for localization
  Locale get appLocale => _appLocale;
  // Update app localization
  void setLocale(Locale locale) {
    if (_appLocale == locale ||
        !AppLocalizations.delegate.isSupported(locale)) {
      return;
    }

    _appLocale = locale;
    _sharedPreferences.setString('selectedLocale', locale.toString());
    notifyListeners();
  }
}
