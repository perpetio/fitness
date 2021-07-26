part of 'tab_bar_bloc.dart';

@immutable
abstract class TabBarState {}

class TabBarInitial extends TabBarState {}

class TabBarItemSelectedState extends TabBarState {
  final int index;

  TabBarItemSelectedState({
    required this.index,
  });
}
