import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/viewmodel/meals/meals_viewmodel.dart';
import 'package:flutter_template/widget/meal_info/meal_info_card.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';

@flutterRoute
class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MealsViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) =>
          Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meals App',
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
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: MealFilterOptions.name,
                            label: 'Search by dish name',
                          ),
                          DropdownMenuEntry(
                            value: MealFilterOptions.country,
                            label: 'Search by country',
                          ),
                          DropdownMenuEntry(
                            value: MealFilterOptions.category,
                            label: 'Search by category',
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: SearchBar(
                          hintText: 'Enter your search query here...',
                          onSubmitted: (text) => viewModel.searchMeal(text),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: GridView.builder(
                    itemCount: viewModel.meals.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isLargeScreen ? 3 : 2),
                    itemBuilder: (BuildContext context, int index) {
                      final meal = viewModel.meals[index];
                      return MealInfoCard(
                        mealImage: meal.image,
                        mealTitle: meal.name,
                        instructions: meal.instructions,
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
