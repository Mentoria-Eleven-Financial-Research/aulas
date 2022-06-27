import 'package:flutter/material.dart';

import '../home_page.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {
  HomeStateEmpty();

  final int stateCode = 1;
}

class HomeStateRegular extends HomeState {
  HomeStateRegular({required this.tasks});

  final List<Task> tasks;

  final int stateCode = 2;
}

class HomeStateChangingList extends HomeState {
  HomeStateChangingList({required this.tasks});

  final int stateCode = 3;
  final List<Task> tasks;
}

extension When on HomeState {
  Widget when({
    Widget? onRegular,
    Widget? onChanging,
    Widget? onEmpty,
  }) {
    switch (runtimeType) {
      case HomeStateEmpty:
        if (onEmpty != null) return onEmpty;
        break;
      case HomeStateChangingList:
        if (onChanging != null) return onChanging;
        break;
      case HomeStateRegular:
        if (onRegular != null) return onRegular;
        break;
      default:
        return Container();
    }
    return Container();
  }
}
