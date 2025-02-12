import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/meal_info/meal_detail_screen.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MealInfoCard extends StatefulWidget {
  final String mealImage;
  final String mealTitle;
  final String? instructions;

  const MealInfoCard({
    required this.mealImage,
    required this.mealTitle,
    this.instructions,
    super.key,
  });

  @override
  State<MealInfoCard> createState() => _MealInfoCardState();
}

class _MealInfoCardState extends State<MealInfoCard> {
  bool _isHovered = false;

  void _updateIsHovered(bool isHovered) {
    setState(() => _isHovered = isHovered);
  }

  void _showMealDetailScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.all(20),
          child: MealDetailScreen(
            mealImage: widget.mealImage,
            mealTitle: widget.mealTitle,
            instructions: widget.instructions,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMealDetailScreen(context),
      child: DataProviderWidget(
        childBuilder: (context, theme, localization) => MouseRegion(
          onEnter: (_) => _updateIsHovered(true),
          onExit: (_) => _updateIsHovered(false),
          child: AnimatedContainer(
            duration: ThemeDurations.mediumAnimationDuration,
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(16),
            transform: _isHovered
                ? Matrix4.translationValues(0, -12, 0)
                : Matrix4.identity(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.pureWhite,
              boxShadow: theme.effects.elevation2,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    widget.mealImage
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.mealTitle,
                    style: theme.bodyNeutralDefault.paragraphM,
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
