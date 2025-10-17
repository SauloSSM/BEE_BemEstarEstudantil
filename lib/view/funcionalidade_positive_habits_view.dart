import 'package:flutter/material.dart';
import '../controller/positive_habits_controller.dart';
import '../main.dart';

class FuncionalidadePositiveHabitsView extends StatefulWidget {
  const FuncionalidadePositiveHabitsView({super.key});

  @override
  State<FuncionalidadePositiveHabitsView> createState() =>
      _FuncionalidadePositiveHabitsViewState();
}

class _FuncionalidadePositiveHabitsViewState
    extends State<FuncionalidadePositiveHabitsView> {
  final controller = g<PositiveHabitsController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio de Hábitos'),
      ),
      // USO DE LISTVIEW
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: controller.habits.length,
        itemBuilder: (context, index) {
          final habit = controller.habits[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12.0),
            child: CheckboxListTile(
              value: habit.isCompleted,
              onChanged: (bool? value) => controller.toggleHabitCompletion(habit),
              secondary: Icon(habit.icon, color: Theme.of(context).primaryColor),
              title: Text(habit.title, style: const TextStyle(fontSize: 16)),
              subtitle: Text(
                'Sequência: ${habit.streak} dias 🔥',
                style: TextStyle(
                  color: habit.streak > 0 ? Colors.orange.shade700 : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Marque os hábitos que você completou hoje!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}