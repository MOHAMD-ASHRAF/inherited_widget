import 'package:flutter/material.dart';
import 'package:inherited_widget/models/app_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  var state = AppState();

  void addCounter() {
    final counter = state.counter + 1;
    final newState = state.copyWith(counter: counter);
    setState(() {
      state = newState;
    });
  }

  void setColor(MaterialColor newColor) {
    final newState = state.copyWith(primarySwatch: newColor);
    setState(() {
      state = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      appState: state,
      state: this,
      child: widget.child,
    );
  }
}

class StateInheritedWidget extends InheritedWidget {
  final AppState appState;
  final _StateWidgetState state;

  const StateInheritedWidget(
      {super.key,
      required super.child,
      required this.appState,
      required this.state});

  static _StateWidgetState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!.state;

  @override
  bool updateShouldNotify(covariant StateInheritedWidget oldWidget) =>
      oldWidget.appState != appState;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is StateInheritedWidget &&
          runtimeType == other.runtimeType &&
          appState == other.appState &&
          state == other.state;

  @override
  int get hashCode => super.hashCode ^ appState.hashCode ^ state.hashCode;
}
