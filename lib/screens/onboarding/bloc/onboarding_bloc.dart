import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial());

  int pageIndex = 0;

  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    if (event is PageChangedEvent) {
      if (pageIndex == 2) {
        return;
      }
      pageIndex += 1;
      yield PageChangedState(counter: pageIndex);
    }
  }
}
