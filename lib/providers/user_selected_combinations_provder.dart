import 'package:flutter_riverpod/flutter_riverpod.dart';

// This  class will maintain the state of the user selected combinations
class UserSelectedCombinationsNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return []; // initial state
  }

  void add(String combination) {
    state = [...state, combination];
  }

  void remove(String combination) {
    state = state.where((item) => item != combination).toList();
  }
}
