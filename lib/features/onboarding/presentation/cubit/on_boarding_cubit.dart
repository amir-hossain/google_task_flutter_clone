import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState.init()) {
    _checkOnBoarding();
  }

  static const String prefKey = "isOnBoardingComplete";

  Future<void> onButtonClick() async {
    final prefs = SharedPreferencesAsync();
    await prefs.setBool(prefKey, true);
    final bool? isOnBoardingComplete = await prefs.getBool(prefKey);
    emit(state.copyWith(isOnBoardingComplete: isOnBoardingComplete ?? false));
  }

  void onPageChanged(int index) => emit(state.copyWith(currentPage: index));

  Future<void> _checkOnBoarding() async {
    final prefs = SharedPreferencesAsync();
    final bool? isOnBoardingComplete = await prefs.getBool(prefKey);
    if (isOnBoardingComplete == true) {
      emit(state.copyWith(isOnBoardingComplete: true));
    }
  }
}
