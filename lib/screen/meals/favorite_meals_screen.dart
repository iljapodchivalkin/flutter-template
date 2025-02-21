import 'package:flutter/material.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/meals/favorite_meals_viewmodel.dart';
//import 'package:flutter_template/viewmodel/meals/meals_viewmodel.dart';
//import 'package:flutter_template/widget/library/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/meal_info/meal_info_card.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

class FavoriteMealsScreen extends StatefulWidget {
  const FavoriteMealsScreen({super.key});

  @override
  State<FavoriteMealsScreen> createState() => _FavoriteMealsScreenState();
}

class _FavoriteMealsScreenState extends State<FavoriteMealsScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<FavoriteMealsViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
        appBar: AppBar(
          title: Text(
            localization.appName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isLargeScreen = constraints.maxWidth > 900;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 32),
                Expanded(
                  child: GridView.builder(
                    itemCount: viewModel.favoriteMeals.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isLargeScreen ? 3 : 2),
                    itemBuilder: (BuildContext context, int index) {
                      final meal = viewModel.favoriteMeals[index];
                      return MealInfoCard(
                        mealId: meal.id,
                        mealImage: meal.image,
                        mealTitle: meal.name,
                        instructions: meal.instructions,
                        isFavorite: viewModel.isMealFavorite(meal),
                        onMealCardTapped: () => viewModel.onMealCardTapped(meal),
                        onFavoriteButtonClicked: () => viewModel.onFavoriteButtonClicked(meal),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
