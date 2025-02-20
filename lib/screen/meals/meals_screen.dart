import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/meals/meals_viewmodel.dart';
import 'package:flutter_template/widget/library/flutter_template_progress_indicator.dart';
import 'package:flutter_template/widget/meal_info/meal_info_card.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MealsViewModel>(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownMenu(
                        onSelected: (value) => viewModel.onTypeSelected(value),
                        menuStyle: MenuStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)), side: BorderSide.none),
                          ),
                        ),
                        dropdownMenuEntries: MealFilterOptions.values
                            .map((option) => DropdownMenuEntry(
                                  value: option,
                                  label: localization.getTranslation(option.labelKey),
                                ))
                            .toList(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Expanded(
                          child: SearchBar(
                            hintText: localization.enterSearchQuery,
                            onChanged: (text) {
                              if (_debounce?.isActive ?? false) _debounce?.cancel();
                              _debounce = Timer(const Duration(milliseconds: 500), () {
                                viewModel.searchMeal(text);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                if (viewModel.isLoading == true) ...[FlutterTemplateProgressIndicator(dark: true)],
                Expanded(
                  child: GridView.builder(
                    itemCount: viewModel.meals.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isLargeScreen ? 3 : 2),
                    itemBuilder: (BuildContext context, int index) {
                      final meal = viewModel.meals[index];
                      return MealInfoCard(
                        mealId: meal.id,
                        mealImage: meal.image,
                        mealTitle: meal.name,
                        instructions: meal.instructions,
                        isFavorite: viewModel.isMealFavorite(meal.id),
                        onMealCardTapped: () => viewModel.onMealCardTapped(meal),
                        onFavoriteButtonClicked: () => viewModel.onFavoriteButtonClicked(meal.id),
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
