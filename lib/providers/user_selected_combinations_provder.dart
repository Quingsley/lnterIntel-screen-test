import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSelectedCombinationsNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void add(String combination) {
    state = [...state, combination];
  }

  void remove(String combination) {
    state = state.where((item) => item != combination).toList();
  }

  // void clear() {
  //   state = [];
  // }
}
