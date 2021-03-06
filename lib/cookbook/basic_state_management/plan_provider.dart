import 'package:flutter/material.dart';
import './models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _plans = <Plan>[]; // List of Plan()

  PlanProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static List<Plan> of(BuildContext context) {
    ///passing to the `<PlanProvider>` Class then it can instantiate for _plan
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._plans; // Using ! mark must not return a null value
  }
}
