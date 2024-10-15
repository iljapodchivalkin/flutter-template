import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/viewmodel/log_detail/log_detail_viewmodel.dart';
import 'package:flutter_template/widget/general/simple_screen/base_screen.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class LogDetailScreen extends StatefulWidget {
  final String date;

  const LogDetailScreen({
    required this.date,
    super.key,
  });

  @override
  LogDetailScreenState createState() => LogDetailScreenState();
}

class LogDetailScreenState extends State<LogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LogDetailViewModel>(
      create: () => getIt()..init(widget.date),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen.builder(
        itemCount: viewModel.logs.length,
        reversed: true,
        itemBuilder: (context, index) {
          final log = viewModel.logs.reversed.toList()[index];
          return Text(
            log,
            style: theme.text.bodySmall,
          );
        },
      ),
    );
  }
}
