import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';


@freezed
abstract class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState({
    required int currentPage,
    required bool isOnBoardingComplete
}) = _OnBoardingState;

  factory OnBoardingState.init(){
    return OnBoardingState(currentPage: 0, isOnBoardingComplete: false);
  }

}


