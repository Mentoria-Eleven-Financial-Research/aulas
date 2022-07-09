import 'package:flutter/material.dart';

import '../home_page.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {
  HomeStateEmpty();
}

class HomeStateRegular extends HomeState {
  HomeStateRegular({required this.tasks});

  final List<Task> tasks;
}

class HomeStateChangingList extends HomeState {
  HomeStateChangingList();
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
