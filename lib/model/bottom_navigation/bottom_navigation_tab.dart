import 'package:flutter/material.dart';
import 'package:flutter_template/screen/meals/favorite_meals_screen.dart';
import 'package:flutter_template/screen/meals/meals_screen.dart';
import 'package:flutter_template/screen/theme_mode/theme_mode_selector.dart';

import 'package:flutter_template/util/locale/localization_keys.dart';


enum BottomNavigationTab {
  meals(
    iconActive: Icons.fastfood_outlined,
    iconInactive: Icons.fastfood_outlined,
    labelKey: LocalizationKeys.mealsPage
  ),
  favorites(
    iconActive: Icons.star,
    iconInactive: Icons.star,
    labelKey: LocalizationKeys.favoriteMeals
  ),
  settings(iconActive: Icons.settings, iconInactive: Icons.settings, labelKey: LocalizationKeys.settings);

  final IconData iconActive;
  final IconData iconInactive;
  final String labelKey;

  const BottomNavigationTab({
    required this.iconActive,
    required this.iconInactive,
    required this.labelKey,
  });

  static BottomNavigationTab get defaultTab => BottomNavigationTab.meals;
}

extension BottomNavigationExtension on BottomNavigationTab {
  Widget childBuilder(BuildContext context) => switch (this) {
        BottomNavigationTab.meals => const MealsScreen(),
        BottomNavigationTab.favorites => const FavoriteMealsScreen(),
        BottomNavigationTab.settings => const ThemeModeSelectorScreen(),
      };
}
