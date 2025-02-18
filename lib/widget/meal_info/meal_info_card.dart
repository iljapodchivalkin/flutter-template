import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/styles/theme_data.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/viewmodel/meals/meals_viewmodel.dart';
import 'package:flutter_template/widget/meal_info/favorite_icon.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class MealInfoCard extends StatefulWidget {
  final String mealImage;
  final String mealTitle;
  final String? instructions;
  final VoidCallback? onMealCardTapped;
  
  

  const MealInfoCard({
    required this.mealImage,
    required this.mealTitle,
    this.onMealCardTapped,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onMealCardTapped,
      child: ProviderWidget<MealsViewModel>(
        create:() => getIt()..init(),
        childBuilderWithViewModel: (context, viewModel, theme, localization) => MouseRegion(
          onEnter: (_) => _updateIsHovered(true),
          onExit: (_) => _updateIsHovered(false),
          child: AnimatedContainer(
            duration: ThemeDurations.mediumAnimationDuration,
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(16),
            transform: _isHovered ? Matrix4.translationValues(0, -12, 0) : Matrix4.identity(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.pureWhite,
              boxShadow: theme.effects.elevation2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(widget.mealImage),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.mealTitle,
                        style: theme.bodyNeutralDefault.paragraphM,
                      ),
                      FavoriteIconWidget()
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
