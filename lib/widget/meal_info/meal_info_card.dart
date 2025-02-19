import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/meal_info/favorite_icon.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MealInfoCard extends StatefulWidget {
  final String mealId;
  final String mealImage;
  final String mealTitle;
  final String? instructions;
  final bool isFavorite;
  final VoidCallback? onMealCardTapped;
  final VoidCallback? onFavoriteButtonClicked;

  const MealInfoCard({
    required this.mealId,
    required this.mealImage,
    required this.mealTitle,
    required this.isFavorite,
    required this.onFavoriteButtonClicked,
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
      child: DataProviderWidget(
        childBuilder: (context, theme, localization) => MouseRegion(
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
                Expanded(child: Image.network(widget.mealImage, fit: BoxFit.cover)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.mealTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      FavoriteIconWidget(
                        isFavorite: widget.isFavorite,
                        onFavoriteChanged: widget.onFavoriteButtonClicked,
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
