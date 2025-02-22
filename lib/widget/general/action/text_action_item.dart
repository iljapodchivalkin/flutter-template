import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class TextActionItem extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool enabled;
  final VoidCallback onClick;

  const TextActionItem({
    required this.text,
    required this.enabled,
    required this.onClick,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Center(
        child: TouchFeedBack(
          borderRadius: BorderRadius.circular(4),
          onTapped: enabled ? onClick : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AnimatedDefaultTextStyle(
              style: style ?? theme.pureWhite.labelS,
              duration: ThemeDurations.shortAnimationDuration,
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
