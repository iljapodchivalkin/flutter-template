//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/screen/theme_mode/theme_mode_selector.dart';
import 'package:flutter_template/viewmodel/settings/settings_viewmodel.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
//import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@flutterRoute
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SettingsViewModel>(
        create: () => getIt()..init(),
        childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
              appBar: AppBar(
                title: Text(
                  localization.settings,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: LayoutBuilder(builder: (context, constraints) {
                //final isLargeScreen = constraints.maxWidth > 900;
                /*
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 32),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(localization.themeMode),
                          ThemeModeSelectorScreen()
                        ],
                      ),
                    )
                  ],
                );
                */
                return ThemeModeSelectorScreen();
              }),
            ));
  }
}
