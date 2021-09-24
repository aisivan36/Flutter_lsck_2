import 'package:flutter/material.dart';
import 'package:lsck/cookbook/basic_state_management/plan_provider.dart';
import 'package:lsck/cookbook/basic_state_management/views/plan_creator_screen.dart';

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
