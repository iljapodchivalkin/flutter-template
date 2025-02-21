import 'package:flutter/material.dart';
import 'package:flutter_template/styles/theme_durations.dart';
import 'package:flutter_template/widget/meal_info/favorite_icon.dart';
import 'package:flutter_template/widget/provider/data_provider_widget.dart';

class MealListCard extends StatefulWidget {
  final String mealId;
  final String mealTitle;
  final bool isFavorite;
  final VoidCallback? onMealCardTapped;
  final VoidCallback? onFavoriteButtonClicked;

  const MealListCard({
    required this.mealId,
    required this.mealTitle,
    required this.isFavorite,
    required this.onFavoriteButtonClicked,
    this.onMealCardTapped,
    super.key,
  });

  @override
  State<MealListCard> createState() => _MealListCardState();
}

class _MealListCardState extends State<MealListCard> {
  /*
  bool _isHovered = false;

  void _updateIsHovered(bool isHovered) {
    setState(() => _isHovered = isHovered);
  }
  */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onMealCardTapped,
      child: DataProviderWidget(
        childBuilder: (context, theme, localization) => MouseRegion(
          //onEnter: (_) => _updateIsHovered(true),
          //onExit: (_) => _updateIsHovered(false),
          child: AnimatedContainer(
            duration: ThemeDurations.mediumAnimationDuration,
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.pureWhite,
              boxShadow: theme.effects.elevation2,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.mealTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FavoriteIconWidget(
                    isFavorite: widget.isFavorite,
                    onFavoriteChanged: widget.onFavoriteButtonClicked,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
