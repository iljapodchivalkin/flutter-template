import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/widget/library/flutter_template_button.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

@flutterDialog
class MealDetailScreen extends StatelessWidget {
  final String mealImage;
  final String mealTitle;
  final String? instructions;

  const MealDetailScreen({
    required this.mealImage,
    required this.mealTitle,
    this.instructions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.all(16),
      child: DataProviderWidget(
        childBuilder: (context, theme, localization) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  mealImage,
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
                      mealTitle,
                      style: theme.bodyNeutralDefault.headingXs,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    if (instructions.isNotNullOrEmpty) ...[
                      Text(
                        "Instructions:",
                        style: theme.bodyNeutralDefault.headingXXS,
                      ),
                      SizedBox(height: 8),
                      Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: instructions
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
                        "No instructions available.",
                        style: theme.bodyNeutralDefault.paragraphM.italic,
                      ),
                    ],
                    SizedBox(height: 20),
                    Center(
                      child: FlutterTemplateButton(
                        text: "Close",
                        onClick: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
