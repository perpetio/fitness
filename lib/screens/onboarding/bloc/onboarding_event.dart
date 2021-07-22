part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class PageChangedEvent extends OnboardingEvent {}

class PageSwipedEvent extends OnboardingEvent {
  final int index;

  PageSwipedEvent({required this.index});
}
