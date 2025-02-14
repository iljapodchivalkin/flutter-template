import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OnboardingNavigator {
  final MainNavigator _navigator;

  const OnboardingNavigator(
    this._navigator,
  );

  Future<void> goToNextScreen() async {
    return _navigator.goToMealsScreen();
  }
}
