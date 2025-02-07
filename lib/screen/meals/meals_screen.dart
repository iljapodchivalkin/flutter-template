
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
      create: ()=> getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Meals App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownMenu(
                    menuStyle: MenuStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))),
                    dropdownMenuEntries: [
                    DropdownMenuEntry(value: 1, label: 'Search by dish name'),
                    DropdownMenuEntry(value: 2, label: 'Search by country'),
                    DropdownMenuEntry(value: 3, label: 'Search by ingredient'),
                  ],),
                  SizedBox(
                    width: 15,
                  ),
                  SearchBar(
                    hintText: 'Enter your search query here...',
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: viewModel.meals.map((mealItem)=> MealInfoCard()).toList(),
              ),
            ],
          ),
        );
      }
    );
  }
}


