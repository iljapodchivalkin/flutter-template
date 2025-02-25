import 'package:flutter/material.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class LightDarkModeViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final GlobalViewModel _globalViewModel;

  ThemeMode get themeMode => _globalViewModel.themeMode;

  LightDarkModeViewModel(
    this._navigator,
    this._globalViewModel,
  );

  void updateThemeMode() {
    if(_globalViewModel.themeMode == ThemeMode.light){
      _globalViewModel.updateThemeMode(ThemeMode.dark);
    } else {
      _globalViewModel.updateThemeMode(ThemeMode.light);
    }
     
  }

  void onBackClicked() => _navigator.goBack();
}
