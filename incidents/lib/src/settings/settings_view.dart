import 'package:flutter/material.dart';
import 'package:incidents/src/providers/localization_provider.dart';
import 'package:provider/provider.dart';

import 'settings_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(AppLocalizations.of(context)!.settingsAppTheme),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<ThemeMode>(
                // Read the selected themeMode from the controller
                value: controller.themeMode,
                // Call the updateThemeMode method any time the user selects a theme.
                onChanged: controller.updateThemeMode,
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child:
                        Text(AppLocalizations.of(context)!.settingsSystemTheme),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child:
                        Text(AppLocalizations.of(context)!.settingsLightTheme),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child:
                        Text(AppLocalizations.of(context)!.settingsDarkTheme),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(AppLocalizations.of(context)!.settingsAppLanguage),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DropdownButton<Locale>(
                // Read the selected Localization
                value: context.read<LocalizationProvider>().appLocale,
                // Call the update method any time the user selects another Locale.
                onChanged: (value) {
                  context.read<LocalizationProvider>().setLocale(value!);
                },
                items: AppLocalizations.supportedLocales
                    .map((locale) => DropdownMenuItem(
                          value: locale,
                          child: locale.languageCode == "ar"
                              ? const Text('العربية')
                              : const Text('English'),
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
