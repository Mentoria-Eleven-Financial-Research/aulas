import 'package:apirest/shared/helpers/app_state.dart';
import 'package:flutter/material.dart';

class BaseState extends ChangeNotifier {
  AppState _state = AppState.none;
  AppState get state => _state;
  set state(AppState value) {
    _state = value;
    notifyListeners();
  }

  String? error;

  Future<T?> execute<T>(Future<T> Function() future) async {
    try {
      state = AppState.loading;
      final response = await future();
      state = AppState.success;
      return response;
    } catch (e) {
      error = e.toString();
      state = AppState.error;
      return null;
    }
  }
}
