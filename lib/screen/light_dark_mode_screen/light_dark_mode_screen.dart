import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/light_dark_mode/light_dark_mode_viewmodel.dart';
import 'package:flutter_template/widget/general/base_screen/base_screen.dart';
import 'package:flutter_template/widget/library/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class LightDarkModeScreen extends StatefulWidget {
  const LightDarkModeScreen({super.key});

  @override
  State<LightDarkModeScreen> createState() => _LightDarkModeScreenState();
}

class _LightDarkModeScreenState extends State<LightDarkModeScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LightDarkModeViewModel>(
      create: getIt.call,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        isScrollable: true,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: theme.level1),
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localization.themeMode,
                      ),
                      FlutterTemplateButton(text: 'Light Mode / Dark Mode', onClick: viewModel.updateThemeMode)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
