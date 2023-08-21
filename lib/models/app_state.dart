import 'package:flutter/material.dart';

class AppState {
  final int counter;
  final MaterialColor primarySwatch;

  AppState({this.counter = 0, this.primarySwatch = Colors.blue});

  AppState copyWith({
    int? counter,
    MaterialColor? primarySwatch,
  }) {
    return AppState(
      counter: counter ?? this.counter,
      primarySwatch: primarySwatch ?? this.primarySwatch,
    );
  }

}