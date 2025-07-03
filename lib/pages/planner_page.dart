import 'package:flutter/material.dart';
import 'package:tonnsour/components/evening_widget.dart';
import 'package:tonnsour/components/header_widget.dart';
import 'package:tonnsour/components/reminder_item_widget.dart';
import 'package:tonnsour/components/task_item_widget.dart';
import 'package:tonnsour/components/tocall_item_widget.dart';
import 'package:tonnsour/components/morning_widget.dart';

import '../models/goal.dart';
import '../utils/services/goals_service.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({super.key});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

/*

 */
class _PlannerPageState extends State<PlannerPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final goalService = GoalsService();

    return Scaffold(
      appBar: AppBar(title: const Text('Goals')),
      body: StreamBuilder<List<Goal>>(
        stream: goalService.watchGoals(),
        builder: (context, snapshot) {
          final goals = snapshot.data ?? [];

          for (var goal in goals) {
            debugPrint("Goal: ${goal.id} ${goal.name}");
          }

          if (goals.isEmpty) {
            return const Center(child: Text("Aucun goal trouvé"));
          }

          return ListView(
            children: goals
                .map((goal) => ListTile(
                    title:
                        Text("Goal: ${goal.id} ${goal.name} ${goal.isDone}")))
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final goal = Goal()
            ..name = "Exemple ${DateTime.now()}"
            ..isDone = false;
          GoalsService().addGoal(goal);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
