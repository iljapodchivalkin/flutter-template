import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/viewmodel/meals/meals_detail_screen_viewmodel.dart';
import 'package:flutter_template/widget/library/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

@FlutterRoute(routeName: 'meal/:mealId')
class MealDetailScreen extends StatelessWidget {
  final String mealId;

  const MealDetailScreen({
    required this.mealId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.all(16),
      child: ProviderWidget<MealsDetailScreenViewmodel>(
        create: () => getIt.get()..init(mealId),
        childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    viewModel.mealImage ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 240,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image,
                      size: 100,
                      color: theme.strokeDefault,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.mealName ?? '',
                        style: theme.bodyNeutralDefault.headingXs,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      if (viewModel.mealInstructions.isNotNullOrEmpty) ...[
                        Text(
                          localization.instructions,
                          style: theme.bodyNeutralDefault.headingXXS,
                        ),
                        SizedBox(height: 8),
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: viewModel.mealInstructions
                                  ?.split('/n')
                                  .map((step) => Text(
                                        step,
                                        style: theme.bodyNeutralDefault.paragraphS,
                                      ))
                                  .toList() ??
                              [],
                        ),
                      ] else ...[
                        Text(
                          localization.noInstructionsAvailable,
                          style: theme.bodyNeutralDefault.paragraphM.italic,
                        ),
                      ],
                      SizedBox(height: 20),
                      Center(
                        child: FlutterTemplateButton(
                          text: localization.close,
                          onClick: () => viewModel.onBackButtonClicked(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
