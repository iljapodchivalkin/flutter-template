import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/locale/localization_overrides.dart';
import 'package:sprintf/sprintf.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//

typedef LocaleFilter = bool Function(String languageCode);

class Localization {
  LocaleFilter? localeFilter;

  var _localisedValues = <String, dynamic>{};
  var _localisedOverrideValues = <String, dynamic>{};

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization)!;

  /// The locale is used to get the correct json locale.
  /// It can later be used to check what the locale is that was used to load this Localization instance.
  final Locale? locale;

  Localization({required this.locale});

  static Future<Localization> load({
    required Locale locale, 
    LocalizationOverrides? localizationOverrides,
    bool showLocalizationKeys = false,
    bool useCaching = true,
    AssetBundle? bundle,
    }) async {
    final localizations = Localization(locale: locale);
    if (showLocalizationKeys) {
      return localizations;
    }
    if (localizationOverrides != null) {
      final overrideLocalizations = await localizationOverrides.getOverriddenLocalizations(locale);
      localizations._localisedOverrideValues = overrideLocalizations;
    }
    final jsonContent = await (bundle ?? rootBundle).loadString('assets/locale/${locale.toLanguageTag()}.json', cache: useCaching);
    localizations._localisedValues = json.decode(jsonContent) as Map<String, dynamic>;
    return localizations;
  }

  String _t(String key, {List<dynamic>? args}) {
    try {
      final value = (_localisedOverrideValues[key] ?? _localisedValues[key]) as String?;
      if (value == null) return key;
      if (args == null || args.isEmpty) return value;
      return sprintf(value, args);
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  /// Translations:
  ///
  /// en:  **'Animations'**
  String get debugAnimationsTitle => _t(LocalizationKeys.debugAnimationsTitle);

  /// Translations:
  ///
  /// en:  **'Database'**
  String get debugDatabase => _t(LocalizationKeys.debugDatabase);

  /// Translations:
  ///
  /// en:  **'View licenses'**
  String get debugLicensesGoTo => _t(LocalizationKeys.debugLicensesGoTo);

  /// Translations:
  ///
  /// en:  **'Licenses'**
  String get debugLicensesTitle => _t(LocalizationKeys.debugLicensesTitle);

  /// Translations:
  ///
  /// en:  **'Current language: [arg1 string]'**
  String debugLocaleCurrentLanguage(String arg1) => _t(LocalizationKeys.debugLocaleCurrentLanguage, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Select your language'**
  String get debugLocaleSelector => _t(LocalizationKeys.debugLocaleSelector);

  /// Translations:
  ///
  /// en:  **'Language'**
  String get debugLocaleTitle => _t(LocalizationKeys.debugLocaleTitle);

  /// Translations:
  ///
  /// en:  **'Native bridge'**
  String get debugNativeBridge => _t(LocalizationKeys.debugNativeBridge);

  /// Translations:
  ///
  /// en:  **'Send native log'**
  String get debugNativeBridgeLog => _t(LocalizationKeys.debugNativeBridgeLog);

  /// Translations:
  ///
  /// en:  **'Show translations'**
  String get debugShowTranslations => _t(LocalizationKeys.debugShowTranslations);

  /// Translations:
  ///
  /// en:  **'Slow animations'**
  String get debugSlowAnimations => _t(LocalizationKeys.debugSlowAnimations);

  /// Translations:
  ///
  /// en:  **'Current platfrom: [arg1 string]'**
  String debugTargetPlatformSubtitle(String arg1) => _t(LocalizationKeys.debugTargetPlatformSubtitle, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Target platfrom'**
  String get debugTargetPlatformTitle => _t(LocalizationKeys.debugTargetPlatformTitle);

  /// Translations:
  ///
  /// en:  **'Theme'**
  String get debugThemeTitle => _t(LocalizationKeys.debugThemeTitle);

  /// Translations:
  ///
  /// en:  **'Debug'**
  String get debugTitle => _t(LocalizationKeys.debugTitle);

  /// Translations:
  ///
  /// en:  **'Translation Keys'**
  String get debugTranslationsTitle => _t(LocalizationKeys.debugTranslationsTitle);

  /// Translations:
  ///
  /// en:  **'View database'**
  String get debugViewDatabase => _t(LocalizationKeys.debugViewDatabase);

  /// Translations:
  ///
  /// en:  **'Bad request error'**
  String get errorBadRequest => _t(LocalizationKeys.errorBadRequest);

  /// Translations:
  ///
  /// en:  **'You coded something wrong'**
  String get errorDuringDev => _t(LocalizationKeys.errorDuringDev);

  /// Translations:
  ///
  /// en:  **'Forbidden error'**
  String get errorForbidden => _t(LocalizationKeys.errorForbidden);

  /// Translations:
  ///
  /// en:  **'Something went wrong'**
  String get errorGeneral => _t(LocalizationKeys.errorGeneral);

  /// Translations:
  ///
  /// en:  **'Something went wrong (code: [arg1 string])'**
  String errorGeneralWithCode(String arg1) => _t(LocalizationKeys.errorGeneralWithCode, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Internal server error'**
  String get errorInternalServer => _t(LocalizationKeys.errorInternalServer);

  /// Translations:
  ///
  /// en:  **'No internet connection available'**
  String get errorNoNetwork => _t(LocalizationKeys.errorNoNetwork);

  /// Translations:
  ///
  /// en:  **'Unauthorized error'**
  String get errorUnauthorized => _t(LocalizationKeys.errorUnauthorized);

  /// Translations:
  ///
  /// en:  **'Android'**
  String get generalLabelAndroid => _t(LocalizationKeys.generalLabelAndroid);

  /// Translations:
  ///
  /// en:  **'Cancel'**
  String get generalLabelCancel => _t(LocalizationKeys.generalLabelCancel);

  /// Translations:
  ///
  /// en:  **'Delete'**
  String get generalLabelDelete => _t(LocalizationKeys.generalLabelDelete);

  /// Translations:
  ///
  /// en:  **'iOS'**
  String get generalLabelIos => _t(LocalizationKeys.generalLabelIos);

  /// Translations:
  ///
  /// en:  **'No'**
  String get generalLabelNo => _t(LocalizationKeys.generalLabelNo);

  /// Translations:
  ///
  /// en:  **'Ok'**
  String get generalLabelOk => _t(LocalizationKeys.generalLabelOk);

  /// Translations:
  ///
  /// en:  **'Save'**
  String get generalLabelSave => _t(LocalizationKeys.generalLabelSave);

  /// Translations:
  ///
  /// en:  **'System default'**
  String get generalLabelSystemDefault => _t(LocalizationKeys.generalLabelSystemDefault);

  /// Translations:
  ///
  /// en:  **'Yes'**
  String get generalLabelYes => _t(LocalizationKeys.generalLabelYes);

  /// Translations:
  ///
  /// en:  **'Settings'**
  String get settingsTitle => _t(LocalizationKeys.settingsTitle);

  /// Translations:
  ///
  /// en:  **'Enter your todo'**
  String get todoAddInputHint => _t(LocalizationKeys.todoAddInputHint);

  /// Translations:
  ///
  /// en:  **'Add todo'**
  String get todoAddTitle => _t(LocalizationKeys.todoAddTitle);

  /// Translations:
  ///
  /// en:  **'No data added to your database. Fetch some todos with an api call (download icon) or add one yourself by clicking the add icon.'**
  String get todoEmptyState => _t(LocalizationKeys.todoEmptyState);

  /// Translations:
  ///
  /// en:  **'Todo'**
  String get todoTitle => _t(LocalizationKeys.todoTitle);

  /// Translations:
  ///
  /// en:  **'Theme'**
  String get debugThemeModeTitle => _t(LocalizationKeys.debugThemeModeTitle);

  /// Translations:
  ///
  /// en:  **'Show the app in dark mode or light'**
  String get debugThemeModeSubtitle => _t(LocalizationKeys.debugThemeModeSubtitle);

  /// Translations:
  ///
  /// en:  **'Light'**
  String get themeModeLabelLight => _t(LocalizationKeys.themeModeLabelLight);

  /// Translations:
  ///
  /// en:  **'Dark'**
  String get themeModeLabelDark => _t(LocalizationKeys.themeModeLabelDark);

  /// Translations:
  ///
  /// en:  **'System default'**
  String get themeModeLabelSystem => _t(LocalizationKeys.themeModeLabelSystem);

  /// Translations:
  ///
  /// en:  **'Help us improve'**
  String get permissionAnalyticsTitle => _t(LocalizationKeys.permissionAnalyticsTitle);

  /// Translations:
  ///
  /// en:  **'We would love to know how you use our app. This helps us to improve your user experience. No personal data is collected. '**
  String get permissionAnalyticsDescription => _t(LocalizationKeys.permissionAnalyticsDescription);

  /// Translations:
  ///
  /// en:  **'Accept'**
  String get permissionButtonAccept => _t(LocalizationKeys.permissionButtonAccept);

  /// Translations:
  ///
  /// en:  **'Decline'**
  String get permissionButtonDecline => _t(LocalizationKeys.permissionButtonDecline);

  /// Translations:
  ///
  /// en:  **'More info'**
  String get permissionButtonMoreInfo => _t(LocalizationKeys.permissionButtonMoreInfo);

  /// Translations:
  ///
  /// en:  **'Permissions'**
  String get debugPermissionsTitle => _t(LocalizationKeys.debugPermissionsTitle);

  /// Translations:
  ///
  /// en:  **'Show analytics permission screen'**
  String get debugPermissionsShowAnalyticsPermission => _t(LocalizationKeys.debugPermissionsShowAnalyticsPermission);

  /// Translations:
  ///
  /// en:  **'Reset analytics permission'**
  String get debugPermissionResetAnalytics => _t(LocalizationKeys.debugPermissionResetAnalytics);

  /// Translations:
  ///
  /// en:  **'Meals App'**
  String get appName => _t(LocalizationKeys.appName);

  /// Translations:
  ///
  /// en:  **'Search by dish name'**
  String get searchByDishName => _t(LocalizationKeys.searchByDishName);

  /// Translations:
  ///
  /// en:  **'Search by country'**
  String get searchByCountry => _t(LocalizationKeys.searchByCountry);

  /// Translations:
  ///
  /// en:  **'Search by category'**
  String get searchByCategory => _t(LocalizationKeys.searchByCategory);

  /// Translations:
  ///
  /// en:  **'Enter your search query here...'**
  String get enterSearchQuery => _t(LocalizationKeys.enterSearchQuery);

  /// Translations:
  ///
  /// en:  **'Instructions'**
  String get instructions => _t(LocalizationKeys.instructions);

  /// Translations:
  ///
  /// en:  **'No instructions available'**
  String get noInstructionsAvailable => _t(LocalizationKeys.noInstructionsAvailable);

  /// Translations:
  ///
  /// en:  **'Close'**
  String get close => _t(LocalizationKeys.close);

  /// Translations:
  ///
  /// en:  **'Meals'**
  String get mealsPage => _t(LocalizationKeys.mealsPage);

  /// Translations:
  ///
  /// en:  **'Favorite Meals'**
  String get favoriteMeals => _t(LocalizationKeys.favoriteMeals);

  String getTranslation(String key, {List<dynamic>? args}) => _t(key, args: args ?? <dynamic>[]);

}
