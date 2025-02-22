import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/util/keys.dart';
import 'package:flutter_template/viewmodel/debug/debug_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/debug_row_item.dart';
import 'package:flutter_template/widget/debug/debug_section.dart';
import 'package:flutter_template/widget/debug/debug_switch_row_item.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:icapps_icons/icapps_icons.dart';
import 'package:provider/provider.dart';

@flutterRoute
class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  DebugScreenState createState() => DebugScreenState();
}

@visibleForTesting
class DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => BaseScreen(
        title: localization.settingsTitle,
        padding: const EdgeInsets.all(24),
        isScrollable: true,
        children: [
          DebugSection(
            title: localization.debugAnimationsTitle,
            icon: IcappsIcons.spark1,
            children: [
              DebugRowSwitchItem(
                key: Keys.debugSlowAnimations,
                title: localization.debugSlowAnimations,
                value: viewModel.slowAnimationsEnabled,
                onChanged: viewModel.onSlowAnimationsChanged,
              ),
            ],
          ),
          const SizedBox(height: 24),
          DebugSection(
            title: localization.debugThemeTitle,
            icon: IcappsIcons.swatches,
            children: [
              DebugRowItem(
                key: Keys.debugTargetPlatform,
                title: localization.debugTargetPlatformTitle,
                subTitle: localization.debugTargetPlatformSubtitle(localization.getTranslation(Provider.of<GlobalViewModel>(context).getCurrentPlatform())),
                onClick: viewModel.onTargetPlatformClicked,
              ),
              DebugRowItem(
                key: Keys.debugThemeMode,
                title: localization.debugThemeModeTitle,
                subTitle: localization.debugThemeModeSubtitle,
                onClick: viewModel.onThemeModeClicked,
              ),
            ],
          ),
          const SizedBox(height: 24),
          DebugSection(
            title: localization.debugLocaleTitle,
            icon: IcappsIcons.globe1,
            children: [
              DebugRowItem(
                key: Keys.debugSelectLanguage,
                title: localization.debugLocaleSelector,
                subTitle: localization.debugLocaleCurrentLanguage(Provider.of<GlobalViewModel>(context).getCurrentLanguage()),
                onClick: viewModel.onSelectLanguageClicked,
              ),
              DebugRowSwitchItem(
                key: Keys.debugShowTranslations,
                title: localization.debugShowTranslations,
                value: Provider.of<GlobalViewModel>(context, listen: false).showsTranslationKeys,
                onChanged: (_) => Provider.of<GlobalViewModel>(context, listen: false).toggleTranslationKeys(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          DebugSection(
            title: localization.debugLicensesTitle,
            icon: IcappsIcons.rosette1,
            children: [
              DebugRowItem(
                key: Keys.debugLicense,
                title: localization.debugLicensesGoTo,
                onClick: viewModel.onLicensesClicked,
              ),
            ],
          ),
          const SizedBox(height: 24),
          DebugSection(
            title: localization.debugDatabase,
            icon: IcappsIcons.boxWithLid,
            children: [
              DebugRowItem(
                key: Keys.debugDatabase,
                title: localization.debugViewDatabase,
                onClick: viewModel.goToDatabase,
              ),
            ],
          ),
          const SizedBox(height: 24),
          DebugSection(
            title: localization.debugPermissionsTitle,
            icon: IcappsIcons.lockOpen1,
            children: [
              DebugRowItem(
                key: Keys.debugPermissionAnalytics,
                title: localization.debugPermissionsShowAnalyticsPermission,
                onClick: viewModel.goToAnalyticsPermissionScreen,
              ),
              DebugRowItem(
                key: Keys.debugPermissionAnalyticsReset,
                title: localization.debugPermissionResetAnalytics,
                onClick: viewModel.resetAnalyticsPermission,
              ),
            ],
          ),
          const SizedBox(height: 24),
          DebugSection(
            title: 'logs',
            icon: IcappsIcons.listBullets,
            children: [
              DebugRowItem(
                key: Keys.debugPermissionAnalyticsReset,
                title: 'Show logs',
                onClick: viewModel.onLogsTapped,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
